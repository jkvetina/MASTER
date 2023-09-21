CREATE OR REPLACE FORCE VIEW app_launchpad_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        u.app_id
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
    APEX_PAGE.GET_URL (
        p_session       => core.get_session_id(),
        p_application   => m.app_id,
        p_page          => 'HOME'           -- get real homepage
    ) AS app_link,
    --
    CASE WHEN m.app_id = 710
        THEN 'fa-heart'
        ELSE 'fa-heart-o'
        END AS badge_icon
    --
FROM app_navigation_map_mv m
JOIN x
    ON x.app_id         = m.app_id
WHERE m.app_group       = 'LAUNCHPAD'
GROUP BY
    m.workspace,
    m.app_id,
    m.app_alias,
    m.app_prefix,
    m.app_name,
    m.app_desc
ORDER BY
    m.workspace,
    m.app_name;
--
COMMENT ON TABLE app_launchpad_v IS '';

