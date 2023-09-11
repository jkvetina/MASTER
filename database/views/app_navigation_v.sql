CREATE OR REPLACE FORCE VIEW app_navigation_v AS
WITH curr AS (
    -- current context
    SELECT /*+ MATERIALIZE */
        core.get_app_id()                           AS app_id,
        core.get_page_id()                          AS page_id,
        n.parent_id,
        core.get_page_group(n.page_id)              AS page_group,
        COALESCE(u.user_id,   core.get_user_id())   AS user_id,
        COALESCE(u.user_name, core.get_user_id())   AS user_name,
        core.get_item('G_CONTEXT_ID')               AS context_id
    FROM DUAL
    LEFT JOIN app_navigation n
        ON n.app_id         = core.get_app_id()
        AND n.page_id       = core.get_page_id()
    LEFT JOIN app_users u
        ON u.user_id        = core.get_user_id()
),
t AS (
    -- available pages
    SELECT /*+ MATERIALIZE */
        curr.app_id         AS app_id,
        curr.user_name      AS user_name,
        --
        n.page_id,
        n.parent_id,
        --
        core.get_page_name(in_name => s.page_name) AS page_name,  -- to support #icons
        --
        s.page_alias,
        s.auth_scheme,
        n.is_reset,
        n.order#
    FROM app_navigation n
    CROSS JOIN curr
    JOIN app_navigation_map_mv s
        ON s.app_id         = n.app_id
        AND s.page_id       = n.page_id
    WHERE 1 = 1
        AND n.app_id        = curr.app_id
        AND n.is_hidden     IS NULL
        --
        AND 'Y' = app.is_page_available (
            in_user_id          => curr.user_id,
            in_app_id           => s.app_id,
            in_page_id          => s.page_id,
            in_context_id       => curr.context_id,
            in_auth_scheme      => s.auth_scheme,
            in_procedure_name   => s.procedure_name
        )
    UNION ALL
    -- add page zero to split navigation to left and right parts
    SELECT
        curr.app_id         AS app_id,
        curr.user_name      AS user_name,
        0                   AS page_id,
        NULL                AS parent_id,
        NULL                AS page_name,
        NULL                AS page_alias,
        NULL                AS auth_scheme,
        NULL                AS is_reset,
        666                 AS order#
    FROM curr
    WHERE NOT EXISTS (
        SELECT 1
        FROM app_navigation n
        WHERE n.app_id      = curr.app_id
            AND n.page_id   = 0
    )
),
n AS (
    -- build the tree
    SELECT /*+ MATERIALIZE */
        CASE WHEN t.parent_id IS NULL THEN 1 ELSE 2 END AS lvl,
        --
        CASE
            WHEN t.page_id = 9999   THEN 'Logout'
            WHEN t.page_id = 0      THEN '</li></ul><ul class="empty"></ul><ul><li>'
            ELSE REPLACE(t.page_name, '&' || 'APP_USER.', t.user_name)
            END AS label,
        CASE
            WHEN t.page_id = 9999   THEN '&' || 'LOGOUT_URL.'
            WHEN t.page_id > 0      THEN
                APEX_PAGE.GET_URL (
                    p_application   => t.app_id,
                    p_page          => NVL(t.page_alias, t.page_id),
                    p_clear_cache   => CASE WHEN t.is_reset = 'Y' THEN t.page_id END
                )
            END AS target,
        --
        CASE
            WHEN t.page_id = (SELECT page_id   FROM curr)   THEN 'YES'
            WHEN t.page_id = (SELECT parent_id FROM curr)   THEN 'YES'
            END AS is_current_list_entry,
        --
        NULL                    AS image,
        NULL                    AS image_attribute,
        NULL                    AS image_alt_attribute,
        --
        CASE
            WHEN t.page_id = 900 THEN 'RIGHT'
            END AS attribute01,
        --
        NULL                    AS attribute02,
        --
        CASE
            WHEN t.page_id = 0 THEN '" style="display: none;'
            END AS attribute03,
        --
        NULL                    AS attribute04,
        NULL                    AS attribute05,
        NULL                    AS attribute06,
        NULL                    AS attribute07,
        NULL                    AS attribute08,
        NULL                    AS attribute09,
        NULL                    AS attribute10,
        --
        t.page_id,
        t.parent_id,
        t.auth_scheme,
        --
        SYS_CONNECT_BY_PATH(t.order# || '.' || t.page_id, '/') AS order#,
        --
        REPLACE(RPAD(' ', (LEVEL - 1) * 4, ' '), ' ', '&' || 'nbsp; ') || t.page_name AS label__
    FROM t
    CONNECT BY t.app_id         = PRIOR t.app_id
        AND t.parent_id         = PRIOR t.page_id
    START WITH t.parent_id      IS NULL
    ORDER SIBLINGS BY t.order# NULLS LAST, t.page_id
)
SELECT                          -- append launchpad icon/link
    1                           AS lvl,
    '<span class="fa fa-navicon"></span>' AS label,
    --
    APEX_PAGE.GET_URL (
        p_application   => 800,
        p_page          => 100
        --p_clear_cache   => 100
    ) AS target,
    --
    NULL                        AS is_current_list_entry,
    NULL                        AS image,
    NULL                        AS image_attribute,
    NULL                        AS image_alt_attribute,
    NULL                        AS attribute01,              -- <li class="...">
    NULL                        AS attribute02,              -- <li>...<a>
    NULL                        AS attribute03,              -- <a class="..."
    NULL                        AS attribute04,              -- <a title="..."
    NULL                        AS attribute05,              -- <a ...> // javascript onclick
    NULL                        AS attribute06,              -- <a>... #TEXT</a>
    NULL                        AS attribute07,              -- <a>#TEXT ...</a>
    NULL                        AS attribute08,              -- </a>...
    NULL                        AS attribute09,
    NULL                        AS attribute10,
    NULL                        AS page_id,
    NULL                        AS parent_id,
    NULL                        AS auth_scheme,
    NULL                        AS label__,
    NULL                        AS order#
FROM curr
--
UNION ALL
SELECT
    n.lvl,
    n.label,
    n.target,
    n.is_current_list_entry,
    n.image,
    n.image_attribute,
    n.image_alt_attribute,
    n.attribute01,              -- <li class="...">
    n.attribute02,              -- <li>...<a>
    n.attribute03,              -- <a class="..."
    n.attribute04,              -- <a title="..."
    n.attribute05,              -- <a ...> // javascript onclick
    n.attribute06,              -- <a>... #TEXT</a>
    n.attribute07,              -- <a>#TEXT ...</a>
    n.attribute08,              -- </a>...
    n.attribute09,
    n.attribute10,
    n.page_id,
    n.parent_id,
    n.auth_scheme,
    n.label__,
    n.order#
FROM n
--
UNION ALL
SELECT                          -- append user profile page and logout
    1                           AS lvl,
    --
    core.get_page_name(in_name => t.page_name) AS label,
    --
    APEX_PAGE.GET_URL (
        p_application   => t.app_id,
        p_page          => t.page_id,
        p_clear_cache   => t.page_id
    ) AS target,
    --
    NULL                        AS is_current_list_entry,
    NULL                        AS image,
    NULL                        AS image_attribute,
    NULL                        AS image_alt_attribute,
    NULL                        AS attribute01,              -- <li class="...">
    NULL                        AS attribute02,              -- <li>...<a>
    NULL                        AS attribute03,              -- <a class="..."
    NULL                        AS attribute04,              -- <a title="..."
    NULL                        AS attribute05,              -- <a ...> // javascript onclick
    NULL                        AS attribute06,              -- <a>... #TEXT</a>
    NULL                        AS attribute07,              -- <a>#TEXT ...</a>
    NULL                        AS attribute08,              -- </a>...
    NULL                        AS attribute09,
    NULL                        AS attribute10,
    NULL                        AS page_id,
    NULL                        AS parent_id,
    NULL                        AS auth_scheme,
    NULL                        AS label__,
    '9998/help'                 AS order#
FROM app_navigation_map_mv t
WHERE t.app_id      = 800
    AND t.page_id   = 980
--
UNION ALL
SELECT                          -- append user profile page and logout
    1                           AS lvl,
    curr.user_name              AS label,
    --
    APEX_PAGE.GET_URL (
        p_application   => 800,
        p_page          => 900,
        p_clear_cache   => 900
    ) AS target,
    --
    NULL                        AS is_current_list_entry,
    NULL                        AS image,
    NULL                        AS image_attribute,
    NULL                        AS image_alt_attribute,
    'RIGHT'                     AS attribute01,              -- <li class="...">
    NULL                        AS attribute02,              -- <li>...<a>
    NULL                        AS attribute03,              -- <a class="..."
    NULL                        AS attribute04,              -- <a title="..."
    NULL                        AS attribute05,              -- <a ...> // javascript onclick
    NULL                        AS attribute06,              -- <a>... #TEXT</a>
    NULL                        AS attribute07,              -- <a>#TEXT ...</a>
    NULL                        AS attribute08,              -- </a>...
    NULL                        AS attribute09,
    NULL                        AS attribute10,
    NULL                        AS page_id,
    NULL                        AS parent_id,
    NULL                        AS auth_scheme,
    NULL                        AS label__,
    '9999/user-profile'         AS order#
FROM curr
--
UNION ALL
SELECT                          -- append user profile page and logout
    2                           AS lvl,
    'Logout'                    AS label,
    '&' || 'LOGOUT_URL.'        AS target,
    --
    NULL                        AS is_current_list_entry,
    NULL                        AS image,
    NULL                        AS image_attribute,
    NULL                        AS image_alt_attribute,
    'RIGHT'                     AS attribute01,              -- <li class="...">
    NULL                        AS attribute02,              -- <li>...<a>
    NULL                        AS attribute03,              -- <a class="..."
    NULL                        AS attribute04,              -- <a title="..."
    NULL                        AS attribute05,              -- <a ...> // javascript onclick
    NULL                        AS attribute06,              -- <a>... #TEXT</a>
    NULL                        AS attribute07,              -- <a>#TEXT ...</a>
    NULL                        AS attribute08,              -- </a>...
    NULL                        AS attribute09,
    NULL                        AS attribute10,
    NULL                        AS page_id,
    NULL                        AS parent_id,
    NULL                        AS auth_scheme,
    NULL                        AS label__,
    '9999/user-profile/logout'  AS order#
FROM curr;
--
COMMENT ON TABLE app_navigation_v IS '';

