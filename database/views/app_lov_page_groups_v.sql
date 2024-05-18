CREATE OR REPLACE FORCE VIEW app_lov_page_groups_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()   AS app_id
    FROM DUAL
)
SELECT
    t.page_group,
    MIN(t.page_id) AS order#,
    --
    INITCAP(REGEXP_SUBSTR(t.page_group, '^([A-Za-z0-9_]+)\s[-\s]?(.*)$', 1, 1, NULL, 2))    AS page_group_name,
    INITCAP(REGEXP_SUBSTR(t.page_group, '^([A-Za-z0-9_]+)\s', 1, 1, NULL, 1))               AS group_name,
    --
    LAG(t.page_group)   OVER (ORDER BY MIN(t.page_id)) AS prev_group,
    LEAD(t.page_group)  OVER (ORDER BY MIN(t.page_id)) AS next_group
    --
FROM app_navigation_map_mv t
JOIN x
    ON t.app_id             = x.app_id
WHERE t.page_id             NOT IN (0, 9999)
    AND t.page_group        NOT LIKE '\_\_%' ESCAPE '\'
GROUP BY
    t.page_group;
/

