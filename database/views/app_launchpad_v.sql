CREATE OR REPLACE FORCE VIEW app_launchpad_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_session_id()   AS session_id,
        core.get_user_id()      AS user_id
    FROM DUAL
)
SELECT
    a.workspace,
    a.app_id,
    a.app_alias,
    a.app_name,
    --
    NULLIF(a.app_desc, '-')     AS app_desc,
    NULLIF(a.app_prefix, '-')   AS app_prefix,
    --
    a.app_version,
    a.app_group,
    --
    a.app_auth,
    a.app_owner,
    --
    REPLACE(
        core.get_app_home_url(a.app_id, in_full => 'Y'),
        '&' || 'APP_SESSION.', x.session_id
    ) AS app_link,
    --
    RTRIM(REPLACE(
        core.get_app_home_url(a.app_id, in_full => 'Y'),
        '&' || 'APP_SESSION.', ''
    ), ':') AS app_link_visible,
    --
    m.is_favorite,
    --
    CASE WHEN m.is_favorite = 'Y'
        THEN 'fa-heart RED'
        ELSE 'fa-heart-o GREY'
        END AS badge_icon,
    --
    ROW_NUMBER() OVER (ORDER BY a.workspace, a.app_name) AS sort#,
    --
    v.app_id                AS suggested_app,
    v.suggested_version
    --
FROM app_apex_apps_mv a
CROSS JOIN x
LEFT JOIN app_users_map m
    ON m.app_id     = a.app_id
    AND m.user_id   = x.user_id
LEFT JOIN app_launchpad_versions_v v
    ON v.app_id     = a.app_id
WHERE 1 = 1
    AND a.app_alias NOT LIKE 'MASTER%'  -- ignore Master apps
;
/

