CREATE OR REPLACE FORCE VIEW app_navigation_map_v AS
SELECT
    --
    -- to recover NULL values forced by using MV
    -- and to calculate proper page name
    --
    n.app_id,
    n.target_app_id,
    n.target_page_id,
    --
    NULLIF(n.page_root_id, 0)   AS page_root_id,
    NULLIF(n.parent_id, 0)      AS parent_id,
    NULLIF(n.is_hidden, '-')    AS is_hidden,
    NULLIF(n.is_reset, '-')     AS is_reset,
    --
    n.workspace,
    n.app_alias,
    n.app_owner,
    n.app_group,
    n.app_name,
    n.app_version,
    n.app_auth,
    --
    NULLIF(n.app_desc, '-')     AS app_desc,
    NULLIF(n.app_prefix, '-')   AS app_prefix,
    --
    NULLIF(n.page_alias, '-')   AS page_alias,
    n.page_name,
    --
    core.get_page_name (
        in_page_id      => n.target_page_id,
        in_app_id       => n.target_app_id,
        in_name         => n.page_name,
        in_replace      => 'Y'
    ) AS page_label,
    --
    NULLIF(n.page_group, '-')           AS page_group,
    NULLIF(n.page_group_slug, '_')      AS page_group_slug,     -- not a dash
    NULLIF(n.page_css_classes, '-')     AS page_css_classes,
    --
    n.page_mode,
    n.page_template,
    --
    NULLIF(n.auth_scheme, '-')  AS auth_scheme,
    NULLIF(n.col_id, 0)         AS col_id,
    --
    n.depth,
    n.is_leaf,
    n.lvl,
    n.lvl_indent,
    n.pages_path,
    n.order#
    --
FROM app_navigation_map_mv n;
/

