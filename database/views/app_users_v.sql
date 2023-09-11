CREATE OR REPLACE FORCE VIEW app_users_v AS
WITH u AS (
    SELECT /*+ MATERIALIZE */
        t.app_id,
        t.user_id,
        u.user_name,
        u.user_mail,
        t.is_active
        --
    FROM app_users u
    JOIN app_users_map t
        ON t.app_id         = core.get_app_id()
        AND t.user_id       = u.user_id
    WHERE u.is_active       = 'Y'
),
a AS (
    SELECT /*+ MATERIALIZE */
        t.user_id,
        COUNT(DISTINCT t.app_id)        AS count_apps
        --
    FROM app_users_map t
    JOIN u
        ON u.user_id        = t.user_id
        AND t.is_active     = 'Y'
    GROUP BY
        t.user_id
),
r AS (
    SELECT /*+ MATERIALIZE */
        r.user_id,
        COUNT(DISTINCT r.role_id)       AS count_roles
        --
    FROM app_roles_map r
    JOIN u
        ON u.user_id        = r.user_id
        AND u.is_active     = 'Y'
        AND r.is_active     = 'Y'
    GROUP BY
        r.user_id
)
SELECT
    u.user_id,
    u.user_name,
    u.user_mail,
    u.is_active,
    --
    a.count_apps,
    r.count_roles
    --
FROM u
LEFT JOIN a
    ON a.user_id        = u.user_id
LEFT JOIN r
    ON r.user_id        = u.user_id;
--
COMMENT ON TABLE app_users_v IS '';

