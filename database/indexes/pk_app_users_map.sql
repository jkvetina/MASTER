CREATE UNIQUE INDEX pk_app_users_map
    ON app_users_map (user_id, app_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

