CREATE TABLE app_contexts_map (
    app_id                          NUMBER(8,0)     CONSTRAINT nn_app_contexts_map_app NOT NULL,
    user_id                         VARCHAR2(128)   CONSTRAINT nn_app_contexts_map_user NOT NULL,
    page_id                         NUMBER(8,0)     CONSTRAINT nn_app_contexts_map_page NOT NULL,
    context_id                      VARCHAR2(64)    CONSTRAINT nn_app_contexts_map_name NOT NULL,
    is_active                       CHAR(1),
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_contexts_map_active
        CHECK (is_active = 'Y' OR is_active IS NULL),
    --
    CONSTRAINT pk_app_contexts_map
        PRIMARY KEY (app_id, user_id, page_id, context_id),
    --
    CONSTRAINT fk_app_contexts_map_context
        FOREIGN KEY (app_id, context_id)
        REFERENCES app_contexts (app_id, context_id)
        DEFERRABLE INITIALLY DEFERRED,
    --
    CONSTRAINT fk_app_contexts_map_user
        FOREIGN KEY (user_id, app_id)
        REFERENCES app_users_map (user_id, app_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_contexts_map IS '';
--
COMMENT ON COLUMN app_contexts_map.app_id       IS '';
COMMENT ON COLUMN app_contexts_map.user_id      IS '';
COMMENT ON COLUMN app_contexts_map.page_id      IS '';
COMMENT ON COLUMN app_contexts_map.context_id   IS '';
COMMENT ON COLUMN app_contexts_map.is_active    IS '';

