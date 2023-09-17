CREATE OR REPLACE FORCE VIEW app_navigation_v AS
WITH curr AS (
    -- current context
    SELECT /*+ MATERIALIZE */
        core.get_app_id()                           AS app_id,
        core.get_app_name()                         AS app_name,
        core.get_app_id(in_dont_override => 'Y')    AS real_app_id,
        800                                         AS master_app_id,
        --
        core.get_page_id()                          AS page_id,
        --core.get_page_group(n.page_id)              AS page_group,
        n.parent_id,
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
s AS (
    -- available pages
    SELECT /*+ MATERIALIZE */
        n.app_id,
        n.page_id,
        n.parent_id,
        --
        core.get_page_name(in_name => s.page_name) AS page_name,  -- to support #icons
        --
        s.page_alias,
        s.page_group,
        s.page_css_classes,
        s.auth_scheme,
        s.procedure_name,
        n.is_reset,
        n.order#,
        m.col_id,
        --
        CASE
            WHEN s.app_id = curr.master_app_id AND s.page_id = 100
                THEN 1
            ELSE ROW_NUMBER() OVER (
                    PARTITION BY n.page_id
                    ORDER BY CASE WHEN n.app_id = curr.master_app_id THEN 2 ELSE 1 END
                )
            END AS rank_pages#
        --
    FROM app_navigation n
    CROSS JOIN curr
    JOIN app_navigation_map_mv s
        ON s.app_id         = n.app_id
        AND s.page_id       = n.page_id
    LEFT JOIN app_navigation_matrix_v m
        ON m.app_id         = s.app_id
        AND m.page_id       = s.page_id
    WHERE 1 = 1
        AND n.app_id        IN (curr.app_id, curr.master_app_id)
        AND n.page_id       NOT IN (9999)
        AND n.is_hidden     IS NULL
),
t AS (
    -- available pages
    SELECT /*+ MATERIALIZE */
        s.app_id,
        s.page_id,
        s.parent_id,
        s.page_name,
        s.page_alias,
        s.page_group,
        s.page_css_classes,
        s.auth_scheme,
        s.procedure_name,
        s.is_reset,
        s.order#,
        s.col_id
    FROM s
    CROSS JOIN curr
    WHERE s.rank_pages# = 1     -- to remove duplicates in between apps
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
        0                   AS page_id,
        NULL                AS parent_id,
        NULL                AS page_name,
        NULL                AS page_alias,
        NULL                AS page_group,
        NULL                AS page_css_classes,
        NULL                AS auth_scheme,
        NULL                AS procedure_name,
        NULL                AS is_reset,
        666                 AS order#,
        NULL                AS col_id
    FROM curr
    WHERE NOT EXISTS (
        SELECT 1
        FROM app_navigation n
        WHERE n.app_id      = curr.app_id
            AND n.page_id   = 0
    )
    UNION ALL
    -- add logout page
    SELECT
        curr.master_app_id  AS app_id,
        9999                AS page_id,
        900                 AS parent_id,
        NULL                AS page_name,
        NULL                AS page_alias,
        NULL                AS page_group,
        NULL                AS page_css_classes,
        NULL                AS auth_scheme,
        NULL                AS procedure_name,
        NULL                AS is_reset,
        999                 AS order#,
        NULL                AS col_id
    FROM curr
),
n AS (
    -- build the tree
    SELECT /*+ MATERIALIZE */
        CASE WHEN t.parent_id IS NULL THEN 1 ELSE 2 END AS lvl,
        --
        CASE
            WHEN t.page_id = 9999   THEN core.get_page_name(in_name => '#fa-coffee Logout')
            WHEN t.page_id = 0      THEN '</span></a></li></ul>'   || CHR(10) ||
                                         '<ul class="EMPTY"></ul>' || CHR(10) ||
                                         '<ul class="RIGHT"><li style="display: none;"><a href=""><span>'  -- a trick to split nav menu to left and right
            ELSE
                REPLACE(REPLACE(
                    CASE WHEN LEVEL > 2 AND t.page_name NOT LIKE '#fa-%' THEN '&' || 'mdash;&' || 'nbsp; ' END
                    || t.page_name,
                    '&' || 'APP_NAME.', curr.app_name),
                    '&' || 'APP_USER.', curr.user_name)
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
        LTRIM(RTRIM(CASE
            WHEN t.page_id = 0      THEN 'HIDDEN'
            WHEN t.page_id = 900    THEN 'RIGHT_ALIGN'
            END
            || ' ' || t.page_group
            || ' ' || t.page_css_classes
            )) AS attribute01,
        --
        NULL                    AS attribute02,
        --
        CASE
            WHEN t.page_id = 0 THEN '" style="display: none;'
            END AS attribute03,
        --
        NULL                    AS attribute04,
        --
        CASE WHEN LEVEL > 2
            THEN ' style="margin-right: 0.5rem; margin-left: ' || ((LEVEL - 2) + 1) || 'rem; font-size: 70%;"'
            END AS attribute05,
        --
        NULL                    AS attribute06,
        NULL                    AS attribute07,
        NULL                    AS attribute08,
        NULL                    AS attribute09,
        NULL                    AS attribute10,
        --
        t.app_id,
        t.page_id,
        t.parent_id,
        t.auth_scheme,
        t.procedure_name,
        --
        TO_NUMBER(REGEXP_SUBSTR(LTRIM(SYS_CONNECT_BY_PATH(t.parent_id, '/'), '/'), '\d+')) AS page_root_id,
        --
        SYS_CONNECT_BY_PATH(LTRIM(t.col_id || '.' || t.order#, '.') || '.' || t.page_id, '/') AS order#,
        --
        REPLACE(RPAD(' ', (LEVEL - 1) * 4, ' '), ' ', '&' || 'nbsp; ') || t.page_name AS label__
        --
    FROM t
    CROSS JOIN curr
    CONNECT BY t.app_id         = PRIOR t.app_id
        AND t.parent_id         = PRIOR t.page_id
    START WITH t.parent_id      IS NULL
    ORDER SIBLINGS BY t.order# NULLS LAST, t.page_id
),
r AS (
    -- find root page
    SELECT /*+ MATERIALIZE */
        n.app_id,
        n.page_id,
        n.page_root_id
    FROM n
    CROSS JOIN curr
    WHERE n.app_id      IN (curr.app_id, curr.real_app_id)
        AND n.page_id   = curr.page_id
)
SELECT
    n.app_id,                   -- some extra columns for FE
    n.page_id,
    n.parent_id,
    n.page_root_id,
    n.auth_scheme,
    n.procedure_name,
    n.label__,
    --
    n.lvl,                      -- mandatory columns for APEX navigation
    n.label,
    n.target,
    --
    CASE
        WHEN n.app_id IN (curr.app_id, curr.real_app_id) AND n.page_id IN (curr.page_id, curr.parent_id) THEN 'YES'
        WHEN n.app_id = r.app_id AND n.page_id = r.page_root_id THEN 'YES'
        END AS is_current_list_entry,
    --
    NULL AS image,
    NULL AS image_attribute,
    NULL AS image_alt_attribute,
    --
    n.attribute01,              -- <li class="...">
    n.attribute02,              -- <li>...<a>
    n.attribute03,              -- <a class="..."
    n.attribute04,              -- <a title="..."
    n.attribute05,              -- <a ...> // javascript onclick
    n.attribute06,              -- <a>... #TEXT</a>
    n.attribute07,              -- <a>#TEXT ...</a>
    --
    --CASE WHEN b.badge IS NOT NULL
    --    THEN '<span class="BADGE">' || b.badge || '</badge>'
    --    END AS attribute07,                     -- badge right
    --
    n.attribute08,              -- </a>...
    --n.attribute09,              -- <ul class="...">
    NULLIF((
        SELECT 'MULTI_' || MIN(m.cols_) AS cols_
        FROM app_navigation_matrix_v m
        WHERE m.app_id          = n.app_id
            AND m.page_root_id  IN (n.page_id, n.page_root_id)
    ), 'MULTI_') AS attribute09,
    --
    n.attribute10,
    n.order#
FROM n
CROSS JOIN curr
LEFT JOIN r
    ON r.app_id         = n.app_id
    AND r.page_root_id  = n.page_id
--
UNION ALL
SELECT
    n.app_id,           -- some extra columns for FE
    n.page_id,
    NULL                AS parent_id,
    n.page_root_id,
    NULL                AS auth_scheme,
    NULL                AS procedure_name,
    NULL                AS label__,
    --
    2                   AS lvl,  -- mandatory columns for APEX navigation
    NULL                AS label,
    NULL                AS target,
    NULL                AS is_current_list_entry,
    NULL                AS image,
    NULL                AS image_attribute,
    NULL                AS image_alt_attribute,
    --
    'NO_HOVER TRANSPARENT'          AS attribute01,
    '<span>&' || 'nbsp;</span>'     AS attribute02,
    --
    NULL                AS attribute03,
    NULL                AS attribute04,
    NULL                AS attribute05,
    NULL                AS attribute06,
    NULL                AS attribute07,
    NULL                AS attribute08,
    NULL                AS attribute09,
    NULL                AS attribute10,
    n.order#
FROM app_navigation_matrix_v n
WHERE n.page_id IS NULL;
--
COMMENT ON TABLE app_navigation_v IS '';

