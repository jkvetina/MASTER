CREATE INDEX fk_app_tables_role
    ON app_tables (app_id, role_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

