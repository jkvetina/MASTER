CREATE TABLE app_tracking_src (
    workspace                       VARCHAR2(30),
    application_id                  NUMBER(10,0),
    application_name                VARCHAR2(64),
    page_id                         NUMBER(10,0),
    page_name                       VARCHAR2(255),
    apex_user                       VARCHAR2(255),
    apex_session_id                 NUMBER,
    view_date                       DATE,
    view_timestamp                  TIMESTAMP(6),
    elapsed_time                    NUMBER,
    page_view_type                  VARCHAR2(32)
);
--
COMMENT ON TABLE app_tracking_src IS '';
--
COMMENT ON COLUMN app_tracking_src.workspace            IS '';
COMMENT ON COLUMN app_tracking_src.application_id       IS '';
COMMENT ON COLUMN app_tracking_src.application_name     IS '';
COMMENT ON COLUMN app_tracking_src.page_id              IS '';
COMMENT ON COLUMN app_tracking_src.page_name            IS '';
COMMENT ON COLUMN app_tracking_src.apex_user            IS '';
COMMENT ON COLUMN app_tracking_src.apex_session_id      IS '';
COMMENT ON COLUMN app_tracking_src.view_date            IS '';
COMMENT ON COLUMN app_tracking_src.view_timestamp       IS '';
COMMENT ON COLUMN app_tracking_src.elapsed_time         IS '';
COMMENT ON COLUMN app_tracking_src.page_view_type       IS '';

