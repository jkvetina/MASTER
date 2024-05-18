CREATE OR REPLACE FORCE VIEW app_users_devices_v AS
SELECT
    t.push_subscription_id,
    t.application_id,
    t.application_id || ' - ' || t.application_name AS application_name,
    --
    APEX_STRING_UTIL.GET_DOMAIN(JSON_VALUE(t.subscription_interface, '$.endpoint')) AS domain,
    --
    '#' || ROW_NUMBER() OVER (ORDER BY t.created_on) AS device_id,
    --
    core.get_date(t.created_on, 'YYYY-MM-DD HH24:MI') AS created_at,
    t.subscription_interface
    --
FROM apex_appl_push_subscriptions t
WHERE t.workspace           = core.get_app_workspace()
    AND t.application_id    = core.get_app_id()
    AND t.user_name         = core.get_user_id();
/

