CREATE TABLE app_users (
    user_id                         VARCHAR2(128)   CONSTRAINT nn_app_users_id NOT NULL,
    user_name                       VARCHAR2(64),
    user_mail                       VARCHAR2(128),
    is_active                       CHAR(1),
    is_admin                        CHAR(1),
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_users_active
        CHECK (is_active = 'Y' OR is_active IS NULL),
    --
    CONSTRAINT pk_app_users
        PRIMARY KEY (user_id),
    --
    CONSTRAINT ch_app_users_admin
        CHECK (is_admin = 'Y' OR is_admin IS NULL)
);
--
COMMENT ON TABLE app_users IS '';
--
COMMENT ON COLUMN app_users.user_id     IS '';
COMMENT ON COLUMN app_users.user_name   IS '';
COMMENT ON COLUMN app_users.user_mail   IS '';
COMMENT ON COLUMN app_users.is_active   IS '';
COMMENT ON COLUMN app_users.is_admin    IS '';

