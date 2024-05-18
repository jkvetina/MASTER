CREATE OR REPLACE FORCE VIEW app_lov_applications_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()               AS app_id,
        core.get_user_id()              AS user_id,
        core.get_item('$WORKSPACE')     AS workspace
    FROM DUAL
)
SELECT
    a.app_id,
    a.app_name,
    a.app_group
    --
FROM app_navigation_map_mv a
CROSS JOIN x
JOIN app_users_map m
    ON m.user_id        = x.user_id
    AND m.app_id        = x.app_id
    AND m.is_active     = 'Y'
JOIN app_users u
    ON u.user_id        = x.user_id
    AND u.is_active     = 'Y'
WHERE 1 = 1
    AND (a.workspace    = x.workspace OR x.workspace IS NULL)
GROUP BY
    a.app_id,
    a.app_name,
    a.app_group;
/

