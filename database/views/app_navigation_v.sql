CREATE OR REPLACE FORCE VIEW app_navigation_v AS
WITH x AS (
    -- current context (app, page, user...)
    SELECT /*+ MATERIALIZE */
        core.get_app_id()                           AS curr_app_id,
        core.get_app_name()                         AS curr_app_name,
        core.get_page_id()                          AS curr_page_id,
        COALESCE(u.user_id,   core.get_user_id())   AS curr_user_id,
        COALESCE(u.user_name, core.get_user_id())   AS curr_user_name,
        core.get_app_id(in_dont_override => 'Y')    AS real_app_id,
        800                                         AS master_app_id,
        core.get_item('G_CONTEXT_ID')               AS context_id
        --
    FROM DUAL
    LEFT JOIN app_users u
        ON u.user_id            = core.get_user_id()
    WHERE core.get_page_id()    NOT IN (9999)       -- ignore navigation on login page
),
available_pages AS (
    -- available pages for current user
    SELECT /*+ MATERIALIZE */
        n.app_id,
        n.page_id,
        n.page_alias,
        n.page_group,
        n.page_label,
        n.parent_id,
        n.page_css_classes,
        n.is_reset,
        n.order#,
        n.col_id,
        n.depth,
        n.lvl,
        --
        CASE WHEN n.app_id = x.curr_app_id AND n.page_id = x.curr_page_id THEN n.active_pages END AS active_pages,
        --
        x.curr_app_id,
        x.curr_app_name,
        x.curr_page_id,
        x.curr_user_id,
        x.curr_user_name,
        x.real_app_id,
        x.master_app_id,
        x.context_id
        --
    FROM app_navigation_map_tree_mv n
    JOIN app_navigation_map_mv s
        ON s.app_id             = n.app_id
        AND s.page_id           = n.page_id
    CROSS JOIN x
    WHERE 1 = 1
        AND n.app_id            IN (x.curr_app_id, x.master_app_id)
        AND n.is_hidden         IS NULL
        AND 'Y' = app_auth.is_page_available (
            in_user_id          => x.curr_user_id,
            in_app_id           => s.app_id,
            in_page_id          => s.page_id,
            in_context_id       => x.context_id,
            in_auth_scheme      => s.auth_scheme,
            in_procedure_name   => s.procedure_name
        )
),
badges AS (
    -- find badges for specific pages
    -- you can fill the collection from any app, but you have to remove things too
    SELECT /*+ MATERIALIZE */
        a.n001      AS app_id,
        a.n002      AS page_id,
        a.c001      AS badge,
        a.c002      AS badge_class
    FROM apex_collections a
    WHERE a.collection_name = 'APP_NAVIGATION_BADGES'   -- check app_nav package
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
        ELSE
            '<a href="' ||
            APEX_PAGE.GET_URL (
                p_application   => t.app_id,
                p_page          => NVL(t.page_alias, t.page_id),
                p_session       => CASE WHEN t.page_id = 9999 THEN 0 ELSE core.get_session_id() END,
                p_clear_cache   => CASE WHEN t.is_reset = 'Y' THEN t.page_id END,
                p_items         => CASE WHEN t.page_id = 980 THEN 'P980_APP_ID,P980_PAGE_ID' END,
                p_values        => CASE WHEN t.page_id = 980 THEN t.curr_app_id || ',' || t.curr_page_id END
            ) ||
            '" class="' || ' NAV_L' || t.depth || ' NAV_P' || t.page_id || '">' ||
            CASE
                WHEN t.depth > 2
                    THEN '<span>&mdash; &nbsp;</span>'
                END ||
            '<span>' ||
            CASE
                WHEN t.page_id = 9999 THEN core.get_page_name(in_name => '#fa-coffee Logout')
                ELSE REPLACE(REPLACE(t.page_label,
                    '#APP_NAME#',   t.curr_app_name),
                    '#USER_NAME#',  t.curr_user_name)
                    END ||
            '</span>' ||
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
    CASE WHEN t.col_id > 0 AND t.col_id != LEAD(col_id) OVER (ORDER BY t.order#) THEN '</ul><ul>' END AS attribute09,
    --
    -- use this to pass values to parent <li>
    ' class="' || t.page_group || ' ' || t.page_css_classes ||
        CASE WHEN (
                t.page_id = t.curr_page_id
                OR t.active_pages LIKE '/' || t.page_id || '/%'
                OR t.active_pages LIKE '%/' || t.page_id || '/'
            ) THEN ' ACTIVE' END ||
        '" data-app-id="' || t.app_id || '" data-page-id="' || t.page_id || '"' AS attribute10,
    --
    t.order#    -- to sort pages properly
    --
FROM available_pages t
LEFT JOIN badges b
    ON b.app_id         = t.app_id
    AND b.page_id       = t.page_id
--
UNION ALL
SELECT
    n.lvl,
    n.app_id,
    n.page_id,
    n.attribute01,      -- content <li>...</li>
    n.attribute02,
    n.attribute03,
    n.attribute04,
    n.attribute05,
    n.attribute06,
    n.attribute07,
    n.attribute08,      -- before ...<li>
    n.attribute09,      -- after </li>...
    n.attribute10,      -- inside <li ...>
    n.order#
    --
FROM app_navigation_public_v n;
--
COMMENT ON TABLE app_navigation_v IS '';

