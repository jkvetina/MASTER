CREATE UNIQUE INDEX pk_app_roles
    ON app_roles (app_id, role_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

