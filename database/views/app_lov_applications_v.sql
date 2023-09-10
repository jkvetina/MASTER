CREATE OR REPLACE FORCE VIEW app_lov_applications_v AS
SELECT
    a.app_id,
    a.app_name
    --
FROM app_navigation_map_mv a
WHERE 1 = 1
    --AND a.workspace = ''
GROUP BY
    a.app_id,
    a.app_name;
--
COMMENT ON TABLE app_lov_applications_v IS '';

