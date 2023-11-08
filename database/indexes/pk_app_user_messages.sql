CREATE UNIQUE INDEX pk_app_user_messages
    ON app_user_messages (app_id, user_id, message_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

