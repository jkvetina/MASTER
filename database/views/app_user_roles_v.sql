CREATE OR REPLACE FORCE VIEW app_user_roles_v AS
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
JOIN app_roles_map m
    ON m.app_id         = r.app_id
    AND m.role_id       = r.role_id
WHERE m.app_id          = core.get_app_id()
    AND m.user_id       = core.get_user_id()
    AND m.is_active     = 'Y'
    AND r.is_active     = 'Y';
--
COMMENT ON TABLE app_user_roles_v IS '';

