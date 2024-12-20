CREATE OR REPLACE FORCE VIEW app_navigation_map_v AS
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
),
t AS (
    -- pull materialized data and convert empty columns back to NULLs
    SELECT /*+ MATERIALIZE */
        t.workspace,
        t.app_id,
        t.app_alias,
        t.app_owner,
        t.app_group,
        t.app_name,
        t.app_version,
        t.app_auth,
        NULLIF(t.app_desc, '-')         AS app_desc,            -- convert back to real NULL values
        --
        t.page_id,
        t.page_name,
        NULLIF(t.page_alias, '-')       AS page_alias,
        NULLIF(t.page_title, '-')       AS page_title,
        NULLIF(t.page_group, '-')       AS page_group,
        NULLIF(t.page_css_classes, '-') AS page_css_classes,
        t.page_mode,
        t.page_template,
        --
        NULLIF(t.auth_scheme, '-')      AS auth_scheme,
        t.home_link
        --
    FROM app_navigation_map_mv t
)
SELECT
    -- construct a tree structure for the navigation
    n.app_id,
    n.target_app_id,
    n.target_page_id,
    --
    TO_NUMBER(REGEXP_SUBSTR(LTRIM(SYS_CONNECT_BY_PATH(n.parent_id, '/'), '/'), '\d+')) AS page_root_id,
    --
    UPPER(REPLACE(APEX_STRING_UTIL.GET_SLUG(t.page_group), '-', '_')) AS page_group,
    --
    core.get_page_name(in_name => t.page_name) AS page_label,  -- to support #icons
    --
    t.page_alias,
    t.page_css_classes,
    t.auth_scheme,
    t.app_auth,
    t.app_alias,
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
    SYS_CONNECT_BY_PATH(n.target_page_id, '/') || '/' AS pages_path,
    --
    SYS_CONNECT_BY_PATH(NVL(n.col_id, 0) || '.' || n.order# || '.' || n.target_page_id, '/') AS order#
    --
FROM t
JOIN n
    ON n.target_app_id      = t.app_id
    AND n.target_page_id    = t.page_id
CONNECT BY n.app_id         = PRIOR n.target_app_id
    AND n.parent_id         = PRIOR n.target_page_id
START WITH n.parent_id      IS NULL;
/

