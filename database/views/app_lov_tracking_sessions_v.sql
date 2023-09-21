CREATE OR REPLACE FORCE VIEW app_lov_tracking_sessions_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()                   AS app_id,
        core.get_number_item('$PAGE_ID')    AS page_id,
        core.get_item('$USER_ID')           AS user_id
    FROM DUAL
)
SELECT
    TRUNC(a.view_date)      AS group_name,
    a.apex_session_id       AS id,
    a.apex_session_id       AS name
    --
FROM app_tracking_base_v a
CROSS JOIN x
WHERE 1 = 1
    AND (a.page_id = x.page_id      OR NULLIF(x.page_id, 0) IS NULL)
    AND (a.apex_user = x.user_id    OR x.user_id IS NULL)
GROUP BY
    TRUNC(a.view_date),
    a.apex_session_id;
--
COMMENT ON TABLE app_lov_tracking_sessions_v IS '';

