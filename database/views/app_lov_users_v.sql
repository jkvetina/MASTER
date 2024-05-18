CREATE OR REPLACE FORCE VIEW app_lov_users_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()   AS app_id
    FROM DUAL
)
SELECT
    t.user_id,
    t.user_name,
    t.user_mail,
    m.is_active,
    NVL(m.is_admin, t.is_admin) AS is_admin
    --
FROM app_users t
CROSS JOIN x
JOIN app_users_map m
    ON m.user_id    = t.user_id
    AND m.app_id    = x.app_id
WHERE t.is_active   = 'Y';
/

