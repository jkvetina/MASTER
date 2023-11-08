CREATE UNIQUE INDEX pk_app_tables_map
    ON app_tables (app_id, table_name, role_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

