CREATE UNIQUE INDEX pk_app_settings
    ON app_settings (app_id, context_id, setting_name)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

