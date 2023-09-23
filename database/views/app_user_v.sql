CREATE OR REPLACE FORCE VIEW app_user_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()   AS app_id,
        core.get_user_id()  AS user_id
    FROM DUAL
)
SELECT
    m.app_id,
    u.user_id,
    u.user_name,
    u.user_mail,
    NVL(m.is_admin, u.is_admin) AS is_admin
    --
FROM app_users u
JOIN x
    ON x.user_id        = u.user_id
JOIN app_users_map m
    ON m.user_id        = u.user_id
    AND m.app_id        = x.app_id
    AND m.is_active     = 'Y'
WHERE u.user_id         = x.user_id
    AND u.is_active     = 'Y';
--
COMMENT ON TABLE app_user_v IS '';

