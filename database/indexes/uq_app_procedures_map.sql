CREATE UNIQUE INDEX uq_app_procedures_map
    ON app_procedures (app_id, object_name, procedure_name, role_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

