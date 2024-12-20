CREATE OR REPLACE FORCE VIEW app_p320_navigation_grid_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()   AS app_id,
        core.get_page_id()  AS page_id
    FROM DUAL
),
navigation AS (
    SELECT /*+ MATERIALIZE */
        n.app_id,
        n.target_app_id,
        n.target_page_id,
        n.parent_id,
        n.is_hidden,
        n.is_reset,
        n.order#,
        n.col_id,
        --
        REPLACE(m.lvl_indent, ' ', '&' || 'nbsp;&' || 'nbsp;') || m.page_label AS page_name,
        REPLACE(m.lvl_indent, ' ', '&' || 'nbsp;&' || 'nbsp;') || m.page_alias AS page_alias,
        --
        m.page_group,
        m.page_css_classes,
        m.page_mode,
        m.auth_scheme
        --
    FROM app_navigation n
    JOIN x
        ON x.app_id             = n.app_id
    LEFT JOIN app_navigation_map_v m
        ON m.app_id             = x.app_id
        AND m.target_app_id     = n.target_app_id
        AND m.target_page_id    = n.target_page_id
)
--
-- existing pages
--
SELECT
    n.app_id || ':' || n.target_app_id || ':' || n.target_page_id AS pk,
    --
    n.app_id,
    n.target_app_id,
    n.target_page_id,
    n.parent_id,
    n.is_hidden,
    n.is_reset,
    n.order#,
    n.col_id,
    --
    n.page_name,
    n.page_alias,
    --
    CASE WHEN n.target_app_id != n.app_id
        THEN (
            -- fill the group from parent
            SELECT t.page_group
            FROM navigation t
            WHERE t.app_id              = n.app_id
                AND t.target_app_id     = n.app_id
                AND t.target_page_id    = n.parent_id
        )
        ELSE n.page_group
        END AS page_group,
    --
    n.page_css_classes,
    n.auth_scheme,
    --
    core.get_page_url (
        in_app_id       => n.target_app_id,
        in_page_id      => n.target_page_id
    ) AS page_link,
    --
    CASE WHEN n.page_mode != 'Normal' THEN 'Y' END AS is_modal,
    --
    ''      AS action_add,
    ''      AS action_delete,
    --
    CASE WHEN n.app_id != n.target_app_id THEN 'D' END AS action_allowed,
    --
    'U'     AS action_dml
    --
FROM navigation n
JOIN app_apex_pages_mv P
    ON p.app_id         = n.target_app_id
    AND p.page_id       = n.target_page_id
--
UNION ALL
--
-- add new pages (missing in the Navigation table)
--
SELECT
    p.app_id || ':' || p.app_id || ':' || p.page_id AS pk,
    --
    p.app_id,
    p.app_id    AS target_app_id,
    p.page_id   AS target_page_id,
    NULL        AS parent_id,
    --
    CASE WHEN p.page_mode != 'Normal' THEN 'Y' END AS is_hidden,
    --
    'Y'         AS is_reset,
    NULL        AS order#,
    NULL        AS col_id,
    --
    p.page_name,
    p.page_alias,
    p.page_group,
    p.page_css_classes,
    p.auth_scheme,
    --
    core.get_page_url (
        in_app_id       => p.app_id,
        in_page_id      => p.page_id
    ) AS page_link,
    --
    CASE WHEN p.page_mode != 'Normal' THEN 'Y' END AS is_modal,
    --
    'Y'     AS action_add,
    ''      AS action_delete,
    'A'     AS action_allowed,
    'U'     AS action_dml
    --
FROM app_apex_pages_mv p
JOIN x
    ON x.app_id             = p.app_id
LEFT JOIN navigation n
    ON n.app_id             = p.app_id
    AND n.target_app_id     = p.app_id
    AND n.target_page_id    = p.page_id
WHERE 1 = 1
    AND n.target_page_id    IS NULL
--
UNION ALL
--
-- remove non-existing pages (but still in the Navigation table)
--
SELECT
    n.app_id || ':' || n.target_app_id || ':' || n.target_page_id AS pk,
    --
    n.app_id,
    n.target_app_id,
    n.target_page_id,
    n.parent_id,
    n.is_hidden,
    n.is_reset,
    n.order#,
    n.col_id,
    --
    n.page_name,
    n.page_alias,
    n.page_group,
    n.page_css_classes,
    n.auth_scheme,
    --
    ''      AS page_link,
    --
    CASE WHEN n.page_mode != 'Normal' THEN 'Y' END AS is_modal,
    --
    ''      AS action_add,
    'Y'     AS action_delete,
    'D'     AS action_allowed,
    'UD'    AS action_dml
    --
FROM navigation n
LEFT JOIN app_apex_pages_mv p
    ON p.app_id         = n.target_app_id
    AND p.page_id       = n.target_page_id
WHERE p.page_id         IS NULL;
/

