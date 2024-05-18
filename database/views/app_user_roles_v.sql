CREATE OR REPLACE FORCE VIEW app_user_roles_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()       AS app_id,
        core.get_user_id()      AS user_id
    FROM DUAL
)
SELECT
    r.role_id,
    r.role_name,
    r.role_group,
    r.role_desc,
    r.order#,
    --
    m.context_id
    --
FROM app_roles r
CROSS JOIN x
JOIN app_roles_map m
    ON m.app_id         = r.app_id
    AND m.role_id       = r.role_id
WHERE m.app_id          = x.app_id
    AND m.user_id       = x.user_id
    AND m.is_active     = 'Y'
    AND r.is_active     = 'Y'
--
UNION ALL
SELECT
    'IS_USER'           AS role_id,
    'User'              AS role_name,
    'DEFAULT'           AS role_group,
    --
    'User who can access the application' AS role_desc,
    --
    1                   AS order#,
    NULL                AS context_id
    --
FROM app_users_map u
JOIN x
    ON x.app_id         = u.app_id
    AND x.user_id       = u.user_id
WHERE u.is_active       = 'Y'
--
UNION ALL
SELECT
    'IS_ADMIN'          AS role_id,
    'Admin'             AS role_name,
    'DEFAULT'           AS role_group,
    --
    'User with administrative rights' AS role_desc,
    --
    2                   AS order#,
    NULL                AS context_id
    --
FROM app_users_map u
JOIN x
    ON x.app_id         = u.app_id
    AND x.user_id       = u.user_id
WHERE u.is_active       = 'Y'
    AND is_admin        = 'Y'
--
UNION ALL
SELECT
    'IS_DEVELOPER'      AS role_id,
    'Developer'         AS role_name,
    'DEFAULT'           AS role_group,
    --
    'Almost like a god' AS role_desc,
    --
    3                   AS order#,
    NULL                AS context_id
    --
FROM DUAL
WHERE core.is_developer_y() = 'Y';
/

