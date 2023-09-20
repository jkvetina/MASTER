BEGIN
    DBMS_UTILITY.EXEC_DDL_STATEMENT('DROP MATERIALIZED VIEW APP_TRACKING_SRC_MV');
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- MATERIALIZED VIEW APP_TRACKING_SRC_MV DROPPED');
    DBMS_OUTPUT.PUT_LINE('--');
EXCEPTION
WHEN OTHERS THEN
    NULL;
END;
/
--
CREATE MATERIALIZED VIEW app_tracking_src_mv
TABLESPACE "DATA"
BUILD IMMEDIATE
REFRESH FORCE ON DEMAND
AS
SELECT
    a.workspace,
    a.application_id,
    a.application_name,
    a.page_id,
    a.page_name,
    a.apex_user,
    a.apex_session_id,
    a.view_date,
    a.view_timestamp,
    a.elapsed_time,
    a.page_view_type
    --
FROM apex_workspace_activity_log a
WHERE 1 = 1
    AND a.application_id    IS NOT NULL
    AND a.application_name  IS NOT NULL     -- to remove other workspaces
    AND a.page_id           > 0;
--

