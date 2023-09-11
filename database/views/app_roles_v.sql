CREATE OR REPLACE FORCE VIEW app_roles_v AS
WITH p AS (
    SELECT /*+ MATERIALIZE */
        p.role_id,
        COUNT(*)        AS count_pages
    FROM app_pages p
    WHERE p.is_active   = 'Y'
    GROUP BY
        p.role_id
),
b AS (
    SELECT /*+ MATERIALIZE */
        t.role_id,
        COUNT(*)        AS count_tables
    FROM app_tables t
    WHERE t.is_active   = 'Y'
        AND COALESCE(t.is_allowed_create, t.is_allowed_update, t.is_allowed_delete) = 'Y'
    GROUP BY
        t.role_id
),
r AS (
    SELECT /*+ MATERIALIZE */
        r.role_id,
        COUNT(*)        AS count_users
    FROM app_roles r
    GROUP BY
        r.role_id
)
SELECT
    t.role_id           AS old_role_id,
    --
    t.role_id,
    t.role_name,
    t.role_group,
    t.role_desc,
    t.is_active,
    t.order#,
    --
    p.count_pages,
    b.count_tables,
    r.count_users
    --
FROM app_roles t
LEFT JOIN p
    ON p.role_id    = t.role_id
LEFT JOIN b
    ON b.role_id    = t.role_id
LEFT JOIN r
    ON r.role_id    = t.role_id;
--
COMMENT ON TABLE app_roles_v IS '';

