BEGIN
    DBMS_UTILITY.EXEC_DDL_STATEMENT('DROP MATERIALIZED VIEW APP_NAVIGATION_MAP_TREE_MV');
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- DROP MATERIALIZED VIEW APP_NAVIGATION_MAP_TREE_MV, DONE');
    DBMS_OUTPUT.PUT_LINE('--');
EXCEPTION
WHEN OTHERS THEN
    NULL;
END;
/
--
CREATE MATERIALIZED VIEW app_navigation_map_tree_mv
BUILD IMMEDIATE
REFRESH FORCE ON DEMAND
AS
SELECT
    t.app_id,
    t.page_id,
    t.page_alias,
    --
    TO_NUMBER(REGEXP_SUBSTR(LTRIM(SYS_CONNECT_BY_PATH(n.parent_id, '/'), '/'), '\d+')) AS page_root_id,
    --
    UPPER(REPLACE(APEX_STRING_UTIL.GET_SLUG(t.page_group), '-', '_')) AS page_group,
    --
    core.get_page_name(in_name => t.page_name) AS page_label,  -- to support #icons
    --
    t.page_css_classes,
    --
    n.parent_id,
    n.is_hidden,
    n.is_reset,
    --
    LEVEL               AS depth,
    LEAST(LEVEL, 2)     AS lvl,
    --
    COALESCE(n.col_id, PRIOR n.col_id, 0) AS col_id,
    --
    SYS_CONNECT_BY_PATH(t.page_id, '/') || '/' AS active_pages,
    --
    SYS_CONNECT_BY_PATH(NVL(n.col_id, 0) || '.' || n.order# || '.' || n.page_id, '/') AS order#
    --
FROM app_navigation_map_mv t
JOIN (
    SELECT
        n.app_id,
        n.page_id,
        n.parent_id,
        n.is_hidden,
        n.is_reset,
        n.order#,
        n.col_id
    FROM app_navigation n
    WHERE n.page_id > 0
    UNION ALL
    --
    -- process just one page zero, priority for the non master app
    SELECT
        a.app_id,
        n.page_id,
        n.parent_id,
        n.is_hidden,
        n.is_reset,
        COALESCE(a.order#, n.order#, 666) AS order#,
        n.col_id
    FROM (
        SELECT
            a.app_id,
            MAX(CASE WHEN a.page_id = 0 THEN a.order# END) AS order#
        FROM app_navigation a
        GROUP BY a.app_id
    ) a
    JOIN app_navigation n
        ON n.app_id         = 800
        AND n.page_id       = 0
) n
    ON n.app_id             = t.app_id
    AND n.page_id           = t.page_id
CONNECT BY n.app_id         = PRIOR n.app_id
    AND n.parent_id         = PRIOR n.page_id
START WITH n.parent_id      IS NULL;
/

