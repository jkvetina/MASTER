CREATE OR REPLACE FORCE VIEW app_navigation_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        x.*,
        --
        COALESCE (
            u.user_name,
            core.get_item('G_USER_NAME')
        ) AS curr_user_name,
        --
        REPLACE(APEX_UTIL.HOST_URL('APEX_PATH'), 'http://:', '') ||
            core.get_app_login_url(x.context_app) AS login_url
        --
    FROM (
        SELECT /*+ MATERIALIZE */
            core.get_app_id()           AS curr_app_id,     -- current/real app
            core.get_page_id()          AS curr_page_id,    -- current page
            core.get_user_id()          AS curr_user_id,
            core.get_session_id()       AS curr_session_id,
            core.get_page_is_modal()    AS is_modal,        -- is page a modal dialog?
            core.get_context_app()      AS context_app,     -- context app (or current app when no context is set)
            core.get_context_page()     AS context_page,
            9999                        AS login_page_id
            --
        FROM DUAL
    ) x
    LEFT JOIN app_users u
        ON u.user_id            = x.curr_user_id
    WHERE 1 = 1
        AND x.curr_page_id      != x.login_page_id          -- ignore navigation on login pages
        AND x.is_modal          IS NULL                     -- ignore navigation on modal pages
),
available_pages AS (
    --
    -- available pages for current user
    -- we dont need to calculate this on every page, actually once per app session should be enough
    --
    SELECT /*+ MATERIALIZE */
        n.target_app_id         AS app_id,
        n.target_page_id        AS page_id,
        n.parent_id,
        --
        n.page_alias,
        n.page_label,
        n.page_group,
        n.page_css_classes,
        n.auth_scheme,
        n.pages_path,
        --
        n.is_reset,
        n.order#,
        n.col_id,
        n.depth,
        n.lvl,
        n.app_alias
        --
    FROM x
    JOIN app_navigation_map_v n
        ON n.app_id             = x.context_app
        AND n.is_hidden         IS NULL
    WHERE 1 = 1
        AND (
            n.target_page_id    IN (0, x.login_page_id)
            OR 'Y'              = core.is_authorized(n.auth_scheme)
        )
),
badges AS (
    --
    -- find badges for specific pages in APEX collection
    -- so if you want to show badge, create records in the collection
    -- check app_nav.add_badge procedure
    --
    SELECT /*+ MATERIALIZE */
        a.n001      AS app_id,
        a.n002      AS page_id,
        a.c001      AS badge,
        a.c002      AS badge_class
    FROM apex_collections a
    WHERE a.collection_name = 'APP_NAVIGATION_BADGES'
)

SELECT
    t.lvl,
    t.app_id,
    t.page_id,
    --
    CASE
        WHEN t.page_id = 0
            -- split navigation to left and right on page zero
            THEN '</li></ul><ul class="RIGHT"><li style="display: none;">'
            --
        WHEN t.page_id = x.login_page_id
            THEN
                '<a href="' || x.login_url ||
                '" class="' || ' NAV_L' || t.depth || ' NAV_P' || t.page_id || '" title="Sign out">' ||
                '<span class="fa fa-coffee"></span>' ||
                '</a>'
            --
        ELSE
            '<a href="' ||
            CASE
                -- add context items to all Master app links (when there is no context app)
                -- or when context app does not match the current/real app
                -- to retain proper app/page context in between apps with multiple tabs
                WHEN (t.app_id != x.context_app OR t.app_alias = 'MASTER') THEN
                    APEX_PAGE.GET_URL (
                        p_application   => t.app_id,
                        p_page          => NVL(t.page_alias, t.page_id),
                        p_session       => x.curr_session_id,
                        p_clear_cache   => CASE WHEN t.is_reset = 'Y' THEN t.page_id END,
                        p_items         => 'CONTEXT_APP,CONTEXT_PAGE',
                        p_values        => TO_CHAR(x.context_app) || ',' || x.context_page
                    )
                ELSE
                    APEX_PAGE.GET_URL (
                        p_application   => t.app_id,
                        p_page          => NVL(t.page_alias, t.page_id),
                        p_session       => x.curr_session_id,
                        p_clear_cache   => CASE WHEN t.is_reset = 'Y' THEN t.page_id END,
                        p_items         => '',
                        p_values        => ''
                    )
                END ||
            '" class="' || ' NAV_L' || t.depth || ' NAV_P' || t.page_id || '">' ||
            CASE
                WHEN t.depth > 2
                    THEN '<span>&mdash; &nbsp;</span>'
                END ||
            '<span>' ||
            --
            REPLACE(REPLACE(t.page_label,
                '#APP_NAME#',   core.get_app_name(t.app_id)),
                '#USER_NAME#',  x.curr_user_name) ||
            '</span>' ||
            --
            CASE
                WHEN b.badge IS NOT NULL
                    THEN '<span class="BADGE ' || b.badge_class || '">' || b.badge || '</span>'
                END ||
            '</a>'
        END AS attribute01,
    --
    '' AS attribute02,
    '' AS attribute03,
    '' AS attribute04,
    '' AS attribute05,
    '' AS attribute06,
    '' AS attribute07,
    '' AS attribute08,
    --
    -- use this attribute to break layout into the new column
    CASE WHEN t.col_id > 0 AND t.col_id != LEAD(t.col_id) OVER (ORDER BY t.order#) THEN '</ul><ul>' END AS attribute09,
    --
    -- use this to pass values to parent <li>
    ' class="' || t.page_group || ' ' || t.page_css_classes ||
        CASE WHEN (
                t.page_id = x.curr_page_id
                OR t.pages_path LIKE '%/' || TO_CHAR(x.curr_page_id) || '/%'
            ) THEN ' ACTIVE' END ||
        '" data-app-id="' || t.app_id || '" data-page-id="' || t.page_id || '"' AS attribute10,
    --
    t.order#    -- to sort pages properly
    --
FROM available_pages t
CROSS JOIN x
LEFT JOIN badges b
    ON b.app_id     = t.app_id
    AND b.page_id   = t.page_id;
/

