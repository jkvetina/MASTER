CREATE OR REPLACE FORCE VIEW app_auth_pages_v AS
SELECT
    -- which users can access which pages
    r.user_id,
    p.app_id,
    p.page_id,
    r.role_id,
    r.context_id
    --
FROM app_pages p
JOIN app_roles n
    ON n.app_id         = p.app_id
    AND n.role_id       = p.role_id
    AND n.is_active     = 'Y'
    AND p.is_active     = 'Y'
JOIN app_roles_map r
    ON r.app_id         = n.app_id
    AND r.role_id       = n.role_id
    AND r.is_active     = 'Y'
JOIN app_users_map c
    ON c.app_id         = r.app_id
    AND c.user_id       = r.user_id
    AND c.is_active     = 'Y'
JOIN app_users u
    ON u.user_id        = c.user_id
    AND u.is_active     = 'Y';
--
COMMENT ON TABLE app_auth_pages_v IS '';

