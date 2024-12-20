CREATE OR REPLACE FORCE VIEW app_lov_all_app_groups_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_item('$WORKSPACE') AS workspace
    FROM DUAL
)
SELECT
    a.app_group     AS id,
    --
    LTRIM(LTRIM(a.app_group, '_')) AS display_value,
    --
    NULL            AS group_id,
    a.app_group     AS sort#
    --
FROM app_apex_apps_mv a
CROSS JOIN x
WHERE 1 = 1
    AND (a.workspace = x.workspace OR x.workspace IS NULL);
/

