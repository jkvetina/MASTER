CREATE TABLE app_user_messages (
    app_id                          NUMBER(8,0)     CONSTRAINT nn_app_user_messages_app NOT NULL,
    user_id                         VARCHAR2(128)   CONSTRAINT nn_app_user_messages_user NOT NULL,
    message_id                      VARCHAR2(64)    CONSTRAINT nn_app_user_messages_id NOT NULL,
    message_type                    VARCHAR2(8)     CONSTRAINT nn_app_user_messages_type NOT NULL,
    message_payload                 VARCHAR2(2000)  CONSTRAINT nn_app_user_messages_text NOT NULL,
    session_id                      INTEGER,
    delivered_at                    DATE,
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    --
    CONSTRAINT pk_app_user_messages
        PRIMARY KEY (app_id, user_id, message_id),
    --
    CONSTRAINT fk_app_user_messages_app_id
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id),
    --
    CONSTRAINT fk_app_user_messages_user_id
        FOREIGN KEY (user_id)
        REFERENCES app_users (user_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_user_messages IS '';
--
COMMENT ON COLUMN app_user_messages.app_id              IS '';
COMMENT ON COLUMN app_user_messages.user_id             IS '';
COMMENT ON COLUMN app_user_messages.message_id          IS '';
COMMENT ON COLUMN app_user_messages.message_type        IS '';
COMMENT ON COLUMN app_user_messages.message_payload     IS '';
COMMENT ON COLUMN app_user_messages.session_id          IS '';
COMMENT ON COLUMN app_user_messages.delivered_at        IS '';

