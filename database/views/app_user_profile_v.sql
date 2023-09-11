CREATE OR REPLACE FORCE VIEW app_user_profile_v AS
SELECT
    t.user_id,
    t.user_name,
    t.user_mail
    --
FROM app_users t
WHERE t.user_id = core.get_user_id();
--
COMMENT ON TABLE app_user_profile_v IS '';

