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
        n.parent_id,
        n.is_reset,
        n.order#,
        n.col_id,
        --
        core.get_page_name(in_name => s.page_name) AS page_label,  -- to support #icons
        --
        s.page_alias,
        UPPER(REPLACE(APEX_STRING_UTIL.GET_SLUG(s.page_group), '-', '_')) AS page_group,
        s.page_css_classes,
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
    FROM app_navigation n
    CROSS JOIN x
    JOIN app_navigation_map_mv s
        ON s.app_id         = n.app_id
        AND s.page_id       = n.page_id
    WHERE 1 = 1
        AND n.app_id        IN (x.curr_app_id, x.master_app_id)
        AND n.is_hidden     IS NULL
        AND 'Y' = app_auth.is_page_available (
            in_user_id          => x.curr_user_id,
            in_app_id           => s.app_id,
            in_page_id          => s.page_id,
            in_context_id       => x.context_id,
            in_auth_scheme      => s.auth_scheme,
            in_procedure_name   => s.procedure_name
        )
),
current_path AS (
    SELECT /*+ MATERIALIZE */
        MAX(SYS_CONNECT_BY_PATH(t.page_id, '/')) || '/' AS active_pages
    FROM available_pages t
    CONNECT BY t.app_id         = PRIOR t.app_id
        AND t.page_id           = PRIOR t.parent_id
    START WITH t.page_id        = t.curr_page_id
),
t AS (
    -- build the tree, we need pages in specific order
    SELECT /*+ MATERIALIZE */
        LEVEL               AS depth,
        LEAST(LEVEL, 2)     AS lvl,
        --
        TO_NUMBER(REGEXP_SUBSTR(LTRIM(SYS_CONNECT_BY_PATH(t.parent_id, '/'), '/'), '\d+')) AS page_root_id,
        --
        COALESCE(t.col_id, PRIOR col_id, 0) AS col_id__,
        --
        SYS_CONNECT_BY_PATH(
            NVL(t.col_id, 0) || '.' ||
            CASE WHEN t.page_id = 0 THEN NVL(t.order#, 666) ELSE t.order# END || '.' || t.page_id,
            '/') AS order#,
        --
        t.app_id,
        t.page_id,
        t.page_label,
        t.page_alias,
        t.page_group,
        t.page_css_classes,
        t.parent_id,
        t.col_id,
        t.is_reset,
        --
        t.curr_app_id,
        t.curr_app_name,
        t.curr_page_id,
        t.curr_user_id,
        t.curr_user_name,
        t.real_app_id,
        t.master_app_id,
        t.context_id
        --
    FROM available_pages t
    CONNECT BY t.app_id         = PRIOR t.app_id
        AND t.parent_id         = PRIOR t.page_id
    START WITH t.parent_id      IS NULL
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
                p_application   => t.master_app_id,
                p_page          => NVL(t.page_alias, t.page_id),
                p_session       => CASE WHEN t.page_id = 9999 THEN '0' END,
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
                ELSE t.page_label END ||
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
    CASE WHEN t.col_id__ > 0 AND t.col_id__ != LEAD(col_id__) OVER (ORDER BY t.order#) THEN '</ul><ul>' END AS attribute09,
    --
    -- use this to pass values to parent <li>
    ' class="' || t.page_group || ' ' || t.page_css_classes ||
        CASE WHEN ((SELECT COUNT(DISTINCT s.col_id) FROM t s WHERE s.parent_id = t.page_id)) > 1 THEN ' MULTICOLUMN' END ||
        CASE WHEN (
                t.page_id = t.curr_page_id
                OR p.active_pages LIKE '/' || t.page_id || '/%'
                OR p.active_pages LIKE '%/' || t.page_id || '/'
            ) THEN ' ACTIVE' END ||
        '"' AS attribute10,
    --
    t.order#    -- to sort pages properly
    --
FROM t
CROSS JOIN current_path p
LEFT JOIN badges b
    ON b.app_id         = t.app_id
    AND b.page_id       = t.page_id
--
UNION ALL
SELECT
    n.lvl,
    n.app_id,
    n.page_id,
    n.attribute01,
    n.attribute02,
    n.attribute03,
    n.attribute04,
    n.attribute05,
    n.attribute06,
    n.attribute07,
    n.attribute08,
    n.attribute09,
    n.attribute10,
    n.order#
    --
FROM app_navigation_public_v n;
--
COMMENT ON TABLE app_navigation_v IS '';

