CREATE OR REPLACE FORCE VIEW app_p880_invalid_objects_v AS
SELECT
    t.owner,
    t.object_type,
    t.object_name,
    --
    NULL AS dependencies,
    --
    t.last_ddl_time,
    t.status,
    --
    'RECOMPILE' AS action_recompile
    --
FROM all_objects t
WHERE t.owner           = core.get_app_owner()
    AND t.object_name   LIKE core.get_app_prefix() || '%'
    AND t.status        != 'VALID';
--
COMMENT ON TABLE app_p880_invalid_objects_v IS '';

