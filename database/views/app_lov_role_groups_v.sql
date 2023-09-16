CREATE OR REPLACE FORCE VIEW app_lov_role_groups_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()   AS app_id
    FROM DUAL
)
SELECT
    t.role_group
    --
FROM app_roles t
JOIN x
    ON t.app_id             = x.app_id
GROUP BY
    t.role_group;
--
COMMENT ON TABLE app_lov_role_groups_v IS '';

