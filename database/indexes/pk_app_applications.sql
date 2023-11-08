CREATE UNIQUE INDEX pk_app_applications
    ON app_applications (app_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

