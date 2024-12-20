BEGIN
    DBMS_UTILITY.EXEC_DDL_STATEMENT('DROP MATERIALIZED VIEW APP_NAVIGATION_MAP_MV');
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- DROP MATERIALIZED VIEW APP_NAVIGATION_MAP_MV, DONE');
    DBMS_OUTPUT.PUT_LINE('--');
EXCEPTION
WHEN OTHERS THEN
    NULL;
END;
/
--
CREATE MATERIALIZED VIEW app_navigation_map_mv
BUILD IMMEDIATE
REFRESH FORCE ON DEMAND
AS
WITH n AS (
    -- pull data from Navigation table, where tree structure is maintained
    SELECT /*+ MATERIALIZE */
        n.app_id,
        n.target_app_id,
        n.target_page_id,
        n.parent_id,
        n.is_hidden,
        n.is_reset,
        n.order#,
        n.col_id
    FROM app_navigation n
)
SELECT
    --
    -- construct a tree structure for the navigation
    -- the APEX dictionaries could be very slow
    -- also since the CORE is running under AUTHID CURRENT_USER, we cant use it here
    --
    n.app_id,
    n.target_app_id,
    n.target_page_id,
    --
    NVL(TO_NUMBER(REGEXP_SUBSTR(LTRIM(SYS_CONNECT_BY_PATH(n.parent_id, '/'), '/'), '\d+')), 0) AS page_root_id,
    --
    NVL(n.parent_id, 0)         AS parent_id,
    NVL(n.is_hidden, '-')       AS is_hidden,
    NVL(n.is_reset, '-')        AS is_reset,
    --
    t.workspace,
    t.app_alias,
    t.app_owner,
    t.app_group,
    t.app_name,
    t.app_version,
    t.app_auth,
    t.app_desc,
    t.app_prefix,
    --
    t.page_id,
    t.page_name,
    t.page_title,
    t.page_alias,
    t.page_group,
    NVL(UPPER(REPLACE(APEX_STRING_UTIL.GET_SLUG(t.page_group), '-', '_')), '_') AS page_group_slug,
    t.page_css_classes,
    t.page_mode,
    t.page_template,
    t.auth_scheme,
    --
    LEVEL                       AS depth,
    CONNECT_BY_ISLEAF           AS is_leaf,
    LEAST(LEVEL, 2)             AS lvl,
    LPAD(' ', 3 * (LEVEL - 1))  AS lvl_indent,
    --
    NVL(TO_NUMBER(REPLACE(SYS_CONNECT_BY_PATH(n.col_id, '/'), '/', '')), 0) AS col_id,
    --
    SYS_CONNECT_BY_PATH(n.target_app_id || '.' || n.target_page_id, '/') || '/' AS pages_path,
    --
    SYS_CONNECT_BY_PATH(NVL(n.col_id, 0) || '.' || n.order# || '.' || n.target_page_id, '/') AS order#
    --
FROM app_apex_pages_mv t
JOIN n
    ON n.target_app_id      = t.app_id
    AND n.target_page_id    = t.page_id
CONNECT BY NOCYCLE
        n.app_id            = PRIOR n.app_id
    AND n.parent_id         = PRIOR n.target_page_id
START WITH n.parent_id      IS NULL;
/

