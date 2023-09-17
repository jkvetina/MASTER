CREATE OR REPLACE FORCE VIEW app_navigation_grid_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()       AS app_id
    FROM DUAL
)
SELECT
    m.app_id,
    m.page_id,
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

