CREATE TABLE app_roles (
    app_id                          NUMBER(8,0)           CONSTRAINT nn_app_roles_app NOT NULL,
    role_id                         VARCHAR2(64)          CONSTRAINT nn_app_roles_role NOT NULL,
    role_name                       VARCHAR2(64),
    role_group                      VARCHAR2(64),
    role_desc                       VARCHAR2(512),
    order#                          NUMBER(4,0),
    is_active                       CHAR(1),
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_roles_active
        CHECK (
            is_active = 'Y' OR is_active IS NULL
        ),
    --
    CONSTRAINT pk_app_roles
        PRIMARY KEY (
            app_id,
            role_id
        ),
    --
    CONSTRAINT fk_app_roles_app
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_roles IS '';
--
COMMENT ON COLUMN app_roles.app_id          IS '';
COMMENT ON COLUMN app_roles.role_id         IS '';
COMMENT ON COLUMN app_roles.role_name       IS '';
COMMENT ON COLUMN app_roles.role_group      IS '';
COMMENT ON COLUMN app_roles.role_desc       IS '';
COMMENT ON COLUMN app_roles.order#          IS '';
COMMENT ON COLUMN app_roles.is_active       IS '';

