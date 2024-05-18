CREATE OR REPLACE FORCE VIEW app_auth_components_v AS
SELECT
    -- which users can access which components
    r.user_id,
    r.app_id,
    r.role_id,
    t.component_id,
    t.component_name,
    t.component_type
    --
FROM app_components t
JOIN app_roles_map r
    ON r.app_id         = t.app_id
    AND r.role_id       = t.role_id
    AND r.is_active     = 'Y'
    AND t.is_active     = 'Y'
JOIN app_users_map a
    ON a.app_id         = r.app_id
    AND a.user_id       = r.user_id
    AND a.is_active     = 'Y'
JOIN app_users u
    ON u.user_id        = a.user_id
    AND u.is_active     = 'Y';
/

