CREATE OR REPLACE FORCE VIEW app_navigation_v AS
WITH h AS (
    -- get help text for the page from the page
    SELECT p.help_text  -- CLOB
    FROM apex_application_pages p
    WHERE p.application_id      = core.get_app_id()
        AND p.page_id           = core.get_page_id()
),
x AS (
    SELECT /*+ MATERIALIZE */
        x.*,
        h.help_text,
        --
        980         AS help_page_id,    -- id of the page with context help
        'MASTER%'   AS master_alias,    -- Master app alias starting with
        --
        COALESCE (
            u.user_name,
            core.get_item('USER_NAME'),
            core.get_user_id()
        ) AS curr_user_name,
        --
        core.get_app_login_url(x.context_app, in_full => 'Y') AS login_url
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
    LEFT JOIN h
        ON 1 = 1
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
        n.page_name,
        n.page_label,
        n.page_group_slug,
        n.page_css_classes,
        n.auth_scheme,
        n.pages_path,
        --
        '/' || TO_CHAR(x.curr_app_id)   || '.' || TO_CHAR(x.curr_page_id)   || '/' AS current_path,
        '/' || TO_CHAR(n.target_app_id) || '.' || TO_CHAR(n.target_page_id) || '/' AS page_path,
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
        AND 'Y' = CASE
            -- dont show help link if there is no help content
            WHEN n.app_alias LIKE x.master_alias AND n.target_page_id = x.help_page_id AND x.help_text IS NOT NULL THEN 'Y'    -- show
            WHEN n.app_alias LIKE x.master_alias AND n.target_page_id = x.help_page_id THEN NULL                               -- hide
            ELSE 'Y'
            END
),
p AS (
    -- extract root page to make it active in the menu
    SELECT MIN(REGEXP_SUBSTR(t.pages_path, '^(/[^/]+/)', 1, 1, NULL, 1)) AS current_root
    FROM available_pages t
    WHERE t.pages_path LIKE '%' || t.current_path
),
badges AS (
    --
    -- find badges for specific pages in APEX collection
    -- so if you want to show badge, create records in the collection
    -- check app_p320.add_badge procedure
    --
    SELECT /*+ MATERIALIZE */
        a.n001      AS app_id,
        a.n002      AS page_id,
        a.c001      AS badge,
        a.c002      AS badge_class
    FROM apex_collections a
    WHERE a.collection_name = app_p320.get_collection_name(core.get_app_id())
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
            -- login page
            THEN
                '<a href="' || x.login_url ||
                '" class="' || ' NAV_L' || t.depth || ' NAV_P' || t.page_id || '" title="Sign out">' ||
                '<span class="fa fa-coffee"></span>' ||
                '</a>'
            --
        ELSE
            '<a href="' ||
            CASE
                WHEN t.app_alias LIKE x.master_alias AND t.page_id = x.help_page_id THEN
                    -- the help page itself
                    APEX_PAGE.GET_URL (
                        p_application   => t.app_id,
                        p_page          => NVL(t.page_alias, t.page_id),
                        p_session       => x.curr_session_id,
                        p_clear_cache   => CASE WHEN t.is_reset = 'Y' THEN t.page_id END,
                        p_items         => 'P' || x.help_page_id || '_APP_ID,P' || x.help_page_id || '_PAGE_ID',
                        p_values        => TO_CHAR(x.curr_app_id) || ',' || TO_CHAR(x.curr_page_id)
                    )
                WHEN (t.app_alias LIKE x.master_alias OR t.app_id != x.context_app) THEN
                    --
                    -- add context items to all Master app links (when there is no context app)
                    -- or when context app does not match the current/real app
                    -- to retain proper app/page context in between apps with multiple tabs
                    --
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
                WHEN t.depth > 2 AND t.page_name NOT LIKE '#fa%'
                    THEN '<span>&' || 'mdash; &' || 'nbsp;</span>'
                END ||
            --
            '<span>' || t.page_label || '</span>' ||
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

    -- use this attribute to break layout into the new column
    CASE WHEN t.col_id > 0 AND t.col_id != LEAD(t.col_id) OVER (ORDER BY t.order#) THEN '</ul><ul>' END AS attribute09,

    -- use this to pass values to parent <li>
    ' data-app-id="' || t.app_id || '" data-page-id="' || t.page_id || '"' ||
    ' class="' || t.page_group_slug || ' ' || t.page_css_classes ||
        CASE
            WHEN t.page_path IN (t.current_path, p.current_root)    -- current page or root
                THEN ' ACTIVE'
            END || '"'
        AS attribute10,
    --
    t.order#    -- to sort pages properly
    --
FROM available_pages t
CROSS JOIN x
CROSS JOIN p
LEFT JOIN badges b
    ON b.app_id     = t.app_id
    AND b.page_id   = t.page_id;
/

