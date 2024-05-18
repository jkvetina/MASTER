CREATE TABLE app_roles_map (
    app_id                          NUMBER(8,0)           CONSTRAINT nn_app_roles_map_app NOT NULL,
    user_id                         VARCHAR2(128)         CONSTRAINT nn_app_roles_map_user NOT NULL,
    role_id                         VARCHAR2(64)          CONSTRAINT nn_app_roles_map_role NOT NULL,
    context_id                      VARCHAR2(64)          CONSTRAINT nn_app_roles_map_context NOT NULL,
    is_active                       CHAR(1),
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_roles_map_active
        CHECK (
            is_active = 'Y' OR is_active IS NULL
        ),
    --
    CONSTRAINT uq_app_roles_map
        UNIQUE (
            app_id,
            user_id,
            role_id,
            context_id
        ),
    --
    CONSTRAINT fk_app_roles_map_user
        FOREIGN KEY (
            user_id,
            app_id
        )
        REFERENCES app_users_map (
            user_id,
            app_id
        )
        DEFERRABLE INITIALLY DEFERRED,
    --
    CONSTRAINT fk_app_roles_map_role
        FOREIGN KEY (
            app_id,
            role_id
        )
        REFERENCES app_roles (
            app_id,
            role_id
        )
        DEFERRABLE INITIALLY DEFERRED,
    --
    CONSTRAINT fk_app_roles_map_context
        FOREIGN KEY (
            app_id,
            context_id
        )
        REFERENCES app_contexts (
            app_id,
            context_id
        )
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_roles_map IS '';
--
COMMENT ON COLUMN app_roles_map.app_id          IS '';
COMMENT ON COLUMN app_roles_map.user_id         IS '';
COMMENT ON COLUMN app_roles_map.role_id         IS '';
COMMENT ON COLUMN app_roles_map.context_id      IS '';
COMMENT ON COLUMN app_roles_map.is_active       IS '';

