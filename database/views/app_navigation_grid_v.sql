CREATE OR REPLACE FORCE VIEW app_navigation_grid_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()       AS app_id
    FROM DUAL
)
SELECT
    NVL(m.app_id, n.app_id)     AS app_id,
    NVL(m.page_id, n.page_id)   AS page_id,
    --
    CASE
        WHEN n.page_id IS NOT NULL AND m.page_id IS NOT NULL
            THEN NULL
        WHEN m.page_id IS NOT NULL
            THEN core.get_icon('fa-plus')
        WHEN n.page_id IS NOT NULL
            THEN core.get_icon('fa-trash-o')
        END AS action_name,
    --
    CASE
        WHEN n.page_id IS NOT NULL AND m.page_id IS NOT NULL
            THEN NULL
        WHEN m.page_id IS NOT NULL
            THEN core.get_page_url (
                in_page_id  => 850,
                in_names    => 'P850_ADD_PAGE',
                in_values   => m.page_id
            )
        WHEN n.page_id IS NOT NULL
            THEN core.get_page_url (
                in_page_id  => 850,
                in_names    => 'P850_REMOVE_PAGE',
                in_values   => n.page_id
            )
        END AS action_link,
    --
    CASE
        WHEN n.page_id IS NOT NULL AND m.page_id IS NOT NULL
            THEN 'UD'
        END AS action_dml,
    --
    n.parent_id,
    n.order#,
    n.col_id,
    n.is_hidden,
    n.is_reset,
    --
    m.page_alias,
    m.page_name,
    m.page_group,
    m.auth_scheme,
    --
    CASE WHEN m.page_mode != 'Normal' THEN 'Y' END AS is_modal,
    --
    m.page_css_classes  AS css_classes,
    --
    z.label__           AS label,
    z.order#            AS sort_order#
    --
FROM app_navigation_map_mv m
JOIN x
    ON x.app_id         = m.app_id
LEFT JOIN app_navigation n
    ON n.app_id         = m.app_id
    AND n.page_id       = m.page_id
LEFT JOIN app_navigation_v z
    ON z.app_id         = m.app_id
    AND z.page_id       = m.page_id;
--
COMMENT ON TABLE app_navigation_grid_v IS '';

