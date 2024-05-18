CREATE TABLE app_users_map (
    app_id                          NUMBER(8,0)           CONSTRAINT nn_app_users_map_app NOT NULL,
    user_id                         VARCHAR2(128)         CONSTRAINT nn_app_users_map_user NOT NULL,
    is_active                       CHAR(1),
    is_admin                        CHAR(1),
    is_favorite                     CHAR(1),
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_users_map_active
        CHECK (
            is_active = 'Y' OR is_active IS NULL
        ),
    --
    CONSTRAINT pk_app_users_map
        PRIMARY KEY (
            user_id,
            app_id
        ),
    --
    CONSTRAINT ch_app_users_map_admin
        CHECK (
            is_admin = 'Y' OR is_admin IS NULL
        ),
    --
    CONSTRAINT ch_app_users_map_favorite
        CHECK (
            is_favorite = 'Y' OR is_favorite IS NULL
        ),
    --
    CONSTRAINT fk_app_users_map_user
        FOREIGN KEY (user_id)
        REFERENCES app_users (user_id)
        DEFERRABLE INITIALLY DEFERRED,
    --
    CONSTRAINT fk_app_users_map_app
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_users_map IS '';
--
COMMENT ON COLUMN app_users_map.app_id          IS '';
COMMENT ON COLUMN app_users_map.user_id         IS '';
COMMENT ON COLUMN app_users_map.is_active       IS '';
COMMENT ON COLUMN app_users_map.is_admin        IS '';
COMMENT ON COLUMN app_users_map.is_favorite     IS '';

