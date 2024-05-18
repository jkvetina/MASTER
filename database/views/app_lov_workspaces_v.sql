CREATE OR REPLACE FORCE VIEW app_lov_workspaces_v AS
SELECT
    a.workspace
    --
FROM app_navigation_map_mv a
GROUP BY
    a.workspace;
/

