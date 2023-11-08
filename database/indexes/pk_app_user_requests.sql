CREATE UNIQUE INDEX pk_app_user_requests
    ON app_user_requests (user_mail)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

