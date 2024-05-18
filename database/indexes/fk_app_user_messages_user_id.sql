CREATE INDEX fk_app_user_messages_user_id
    ON app_user_messages (user_id)
    TABLESPACE data;

