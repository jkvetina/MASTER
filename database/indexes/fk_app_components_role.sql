CREATE INDEX fk_app_components_role
    ON app_components (app_id, role_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

