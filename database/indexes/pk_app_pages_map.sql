CREATE UNIQUE INDEX pk_app_pages_map
    ON app_pages (app_id, page_id, role_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

