CREATE OR REPLACE FORCE VIEW app_navigation_matrix_v AS
WITH curr AS (
    -- current context
    SELECT /*+ MATERIALIZE */
        core.get_app_id()                           AS app_id,
        800                                         AS master_app_id
    FROM DUAL
),
max_rows AS (
    -- generate fake rows anc columns so we can align all columns on same row numbers
    SELECT /*+ MATERIALIZE */
        LEVEL AS id
    FROM DUAL
    CONNECT BY LEVEL <= 30
),
s AS (
    SELECT /*+ MATERIALIZE */
        n.app_id,
        n.parent_id                 AS page_root_id,
        CONNECT_BY_ROOT n.page_id   AS page_id,
        NULLIF(LEVEL, 1)            AS lvl,
        --
        '/' || n.app_id || '.' || n.parent_id || '/' || n.col_id --|| '.' || LEVEL
            || SYS_CONNECT_BY_PATH(n.order#, '.') || '.' || n.page_id || '/'
            || CONNECT_BY_ROOT n.page_id AS order#,
        n.col_id
    FROM app_navigation n
    CROSS JOIN curr
    WHERE n.app_id                  IN (curr.app_id, curr.master_app_id)
        AND n.col_id                IS NOT NULL
    CONNECT BY PRIOR n.app_id       = n.app_id
        AND PRIOR n.parent_id       = n.page_id
),
n AS (
    SELECT /*+ MATERIALIZE */
        s.*,
        ROW_NUMBER() OVER (PARTITION BY s.app_id, s.page_root_id, s.col_id ORDER BY s.order#) AS row_id,
        COUNT(s.lvl) OVER (PARTITION BY s.app_id, s.page_root_id, s.col_id) AS childs
    FROM s
),
dimensions AS (
    -- get columns and rows for each multi column menu
    SELECT /*+ MATERIALIZE */
        c.app_id,
        c.page_root_id,
        MAX(c.max_cols)     AS max_cols,
        MAX(c.max_rows)     AS max_rows,
        MAX(c.childs)       AS max_childs,
        MIN(c.childs)       AS min_childs
    FROM (
        SELECT
            n.app_id,
            n.page_root_id,
            COUNT(DISTINCT n.col_id)    OVER (PARTITION BY n.app_id, n.page_root_id) AS max_cols,
            COUNT(n.col_id)             AS max_rows,
            --
            SUM(CASE WHEN n.lvl > 1 THEN 1 ELSE 0 END) AS childs
        FROM n
        GROUP BY
            n.app_id,
            n.page_root_id,
            n.col_id
    ) c
    GROUP BY
        c.app_id,
        c.page_root_id
)
-- generate matrix to align columns on same height/rows
SELECT
    d.app_id,
    d.page_root_id,
    n.page_id,
    c.id                AS col_id,
    r.id                AS row_id,
    d.max_rows,
    d.max_cols,
    d.max_childs,
    d.min_childs,
    --
    (
        SELECT MAX(n.childs) AS childs
        FROM n
        WHERE n.app_id          = d.app_id
            AND n.page_root_id  = d.page_root_id
            AND n.col_id        = c.id
    ) - d.min_childs AS adjust_for_childs,
    --
    (
        SELECT MAX(n.order#)    AS order#
        FROM n
        WHERE n.app_id          = d.app_id
            AND n.page_root_id  = d.page_root_id
            AND n.col_id        = c.id
    ) || '.' || r.id AS order#
    --
FROM dimensions d
JOIN max_rows c
    ON c.id             <= d.max_cols
JOIN max_rows r
    ON r.id             <= d.max_rows
LEFT JOIN n
    ON n.app_id         = d.app_id
    AND n.page_root_id  = d.page_root_id
    AND n.col_id        = c.id
    AND n.row_id        = r.id;
--
COMMENT ON TABLE app_navigation_matrix_v IS '';

