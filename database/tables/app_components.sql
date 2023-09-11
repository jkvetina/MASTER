CREATE TABLE app_components (
    app_id                          NUMBER(8,0)     CONSTRAINT nn_app_components_app NOT NULL,
    component_id                    NUMBER          CONSTRAINT nn_app_components_id NOT NULL,
    component_type                  VARCHAR2(30)    CONSTRAINT nn_app_components_type NOT NULL,
    component_name                  VARCHAR2(256)   CONSTRAINT nn_app_components_name NOT NULL,
    page_id                         NUMBER(8,0),
    role_id                         VARCHAR2(64),
    is_active                       CHAR(1),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_components_active
        CHECK (is_active = 'Y' OR is_active IS NULL),
    --
    CONSTRAINT uq_app_components
        UNIQUE (app_id, component_id, role_id)
) ,
    --
    CONSTRAINT fk_app_components_role
        FOREIGN KEY (app_id, role_id)
        REFERENCES app_roles (app_id, role_id)
        DEFERRABLE INITIALLY DEFERRED,
    --
    CONSTRAINT fk_app_components_page
        FOREIGN KEY (app_id, page_id)
        REFERENCES app_navigation (app_id, page_id)
        DEFERRABLE INITIALLY DEFERRED,
    --
    CONSTRAINT fk_app_components_app
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_components IS '';
--
COMMENT ON COLUMN app_components.app_id             IS '';
COMMENT ON COLUMN app_components.component_id       IS '';
COMMENT ON COLUMN app_components.component_type     IS '';
COMMENT ON COLUMN app_components.component_name     IS '';
COMMENT ON COLUMN app_components.page_id            IS '';
COMMENT ON COLUMN app_components.role_id            IS '';
COMMENT ON COLUMN app_components.is_active          IS '';

