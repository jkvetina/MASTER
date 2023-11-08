CREATE UNIQUE INDEX pk_app_users
    ON app_users (user_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

