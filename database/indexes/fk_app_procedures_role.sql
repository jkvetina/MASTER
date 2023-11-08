CREATE INDEX fk_app_procedures_role
    ON app_procedures (app_id, role_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

