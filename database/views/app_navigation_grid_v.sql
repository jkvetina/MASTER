CREATE OR REPLACE FORCE VIEW app_navigation_grid_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()       AS app_id
    FROM DUAL
),
live_pages AS (
    SELECT /*+ MATERIALIZE */
        p.application_id        AS app_id,
        p.page_id,
        p.page_alias,
        p.page_group,
        p.page_name,
        p.page_mode,
        p.authorization_scheme
    FROM x
    JOIN apex_application_pages p
        ON p.application_id     = x.app_id
),
z AS (
    SELECT /*+ MATERIALIZE */
        z.app_id,
        z.page_id,
        z.label__,
        z.order#
    FROM app_navigation_v z
)
-- existing pages
SELECT
    'EDIT:' || NVL(m.app_id, n.app_id) || ':' || NVL(m.page_id, n.page_id) AS pk,
    --
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
    core.get_page_url (
        in_app_id       => m.app_id,
        in_page_id      => m.page_id
    ) AS page_link,
    --
    CASE WHEN m.page_mode != 'Normal' THEN 'Y' END AS is_modal,
    --
    m.page_css_classes AS css_classes,
    --
    NVL(z.label__, REPLACE(RPAD(' ', 4, ' '), ' ', '&' || 'nbsp; ') || m.page_name) AS label,
    --
    NVL(z.order#, p.order# || '/' || NVL(n.order#, 0) || '.' || n.page_id) AS sort_order#
    --
FROM app_navigation n
JOIN x
    ON x.app_id         = n.app_id
JOIN app_navigation_map_mv m
    ON m.app_id         = n.app_id
    AND m.page_id       = n.page_id
LEFT JOIN z
    ON z.app_id         = n.app_id
    AND z.page_id       = n.page_id
LEFT JOIN z p
    ON p.app_id         = n.app_id
    AND p.page_id       = n.parent_id
--
-- remove pages
UNION ALL
SELECT
    'DEL:' || n.app_id || ':' || n.page_id AS pk,
    --
    n.app_id,
    n.page_id,
    --
    core.get_icon('fa-trash-o') AS action_name,
    core.get_page_url (
        in_page_id  => 850,
        in_names    => 'P850_REMOVE_PAGE',
        in_values   => n.page_id
    ) AS action_link,
    --
    'D' AS action_dml,
    --
    n.parent_id,
    n.order#,
    n.col_id,
    n.is_hidden,
    n.is_reset,
    --
    NULL AS page_alias,
    NULL AS page_name,
    ' '  AS page_group,     -- to show first
    NULL AS auth_scheme,
    NULL AS page_link,
    NULL AS is_modal,
    NULL AS css_classes,
    NULL AS label,
    --
    NULL AS sort_order#
    --
FROM app_navigation n
JOIN x
    ON x.app_id         = n.app_id
LEFT JOIN live_pages p
    ON p.app_id         = n.app_id
    AND p.page_id       = n.page_id
WHERE p.page_id         IS NULL
--
-- add pages
UNION ALL
SELECT
    'ADD:' || p.app_id || ':' || p.page_id AS pk,
    --
    p.app_id,
    p.page_id,
    --
    core.get_icon('fa-plus') AS action_name,
    core.get_page_url (
        in_page_id  => 850,
        in_names    => 'P850_ADD_PAGE',
        in_values   => p.page_id
    ) AS action_link,
    --
    ''   AS action_dml,
    --
    NULL AS parent_id,      -- guess ?
    NULL AS order#,         -- guess
    NULL AS col_id,
    --
    CASE WHEN p.page_mode != 'Normal' THEN 'Y' END AS is_hidden,
    'Y' AS is_reset,
    --
    p.page_alias,
    p.page_name,
    p.page_group,
    p.authorization_scheme,
    --
    core.get_page_url (
        in_app_id       => p.app_id,
        in_page_id      => p.page_id
    ) AS page_link,
    --
    CASE WHEN p.page_mode != 'Normal' THEN 'Y' END AS is_modal,
    NULL AS css_classes,
    --
    p.page_name AS label,
    --
    NULL AS sort_order#
    --
FROM live_pages p
LEFT JOIN app_navigation n
    ON n.app_id         = p.app_id
    AND n.page_id       = p.page_id
WHERE n.page_id         IS NULL;
--
COMMENT ON TABLE app_navigation_grid_v IS '';

