CREATE OR REPLACE FORCE VIEW app_lov_all_apps_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_item('$WORKSPACE') AS workspace
    FROM DUAL
)
SELECT
    a.app_id        AS id,
    --
    TO_CHAR(a.app_id) || ' - ' || a.app_name AS display_value,
    --
    a.app_group     AS group_id,
    a.app_id        AS sort#
    --
FROM app_apex_apps_mv a
CROSS JOIN x
WHERE 1 = 1
    AND (a.workspace = x.workspace OR x.workspace IS NULL);
/

