CREATE UNIQUE INDEX pk_navigation
    ON app_navigation (app_id, page_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

