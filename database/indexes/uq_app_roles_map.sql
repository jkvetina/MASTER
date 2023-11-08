CREATE UNIQUE INDEX uq_app_roles_map
    ON app_roles_map (app_id, user_id, role_id, context_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

