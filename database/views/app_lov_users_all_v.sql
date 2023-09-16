CREATE OR REPLACE FORCE VIEW app_lov_users_all_v AS
SELECT
    t.user_id,
    t.user_name,
    t.user_mail
    --
FROM app_users t
WHERE t.is_active   = 'Y';
--
COMMENT ON TABLE app_lov_users_all_v IS '';

