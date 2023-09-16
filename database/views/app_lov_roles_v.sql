CREATE OR REPLACE FORCE VIEW app_lov_roles_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()               AS app_id,
        core.get_item('$ROLE_GROUP')    AS role_group
    FROM DUAL
)
SELECT
    t.role_id,
    NVL(t.role_name, t.role_id) AS role_name,
    t.role_group,
    --
    CASE WHEN t.is_active = 'Y' THEN 'Active:' ELSE 'Not Active:' END AS is_active,
    --
    ROW_NUMBER() OVER (ORDER BY t.order# NULLS LAST, t.role_id) AS order#
    --
FROM app_roles t
JOIN x
    ON t.app_id             = x.app_id
WHERE 1 = 1
    AND (x.role_group       = t.role_group OR x.role_group IS NULL);
--
COMMENT ON TABLE app_lov_roles_v IS '';

