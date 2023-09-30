CREATE OR REPLACE FORCE VIEW app_launchpad_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        u.app_id,
        core.get_session_id()   AS session_id,
        V('DEBUG')              AS debug_mode
    FROM app_users_map u
    JOIN app_applications a
        ON a.app_id         = u.app_id
        AND a.is_active     = 'Y'
    WHERE u.user_id         = core.get_user_id()
        AND u.is_active     = 'Y'
)
SELECT
    m.workspace,
    m.app_id,
    m.app_alias,
    m.app_prefix,
    m.app_name,
    m.app_desc,
    --
    MAX(APEX_UTIL.PREPARE_URL(REPLACE(REPLACE(REPLACE(m.home_link,
        '&' || 'APP_ID.',       m.app_id),
        '&' || 'APP_SESSION.',  x.session_id),
        '&' || 'DEBUG.',        x.debug_mode)
    )) AS app_link,
    --
    CASE WHEN a.is_favorite = 'Y'
        THEN 'fa-heart RED'
        ELSE 'fa-heart-o'
        END AS badge_icon,
    --
    a.is_favorite
    --
FROM app_navigation_map_mv m
JOIN x
    ON x.app_id         = m.app_id
LEFT JOIN app_users_map a
    ON a.app_id         = m.app_id
WHERE m.app_group       = 'LAUNCHPAD'
GROUP BY
    m.workspace,
    m.app_id,
    m.app_alias,
    m.app_prefix,
    m.app_name,
    m.app_desc,
    a.is_favorite
ORDER BY
    m.workspace,
    m.app_name;
--
COMMENT ON TABLE app_launchpad_v IS '';

