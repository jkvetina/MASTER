CREATE OR REPLACE FORCE VIEW app_lov_tracking_metrics_v AS
SELECT
    t.status_id     AS id,
    t.status_name   AS name,
    t.order#        AS order#,
    t.status_value  AS color_name
    --
FROM app_lovs t
WHERE t.app_id      = core.get_app_id(in_dont_override => 'Y')
    AND t.lov_id    = 'METRIC';
/

