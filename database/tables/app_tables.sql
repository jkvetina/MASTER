CREATE TABLE app_tables (
    app_id                          NUMBER(8,0)     CONSTRAINT nn_app_tables_app NOT NULL,
    table_name                      VARCHAR2(64)    CONSTRAINT nn_app_tables_name NOT NULL,
    role_id                         VARCHAR2(64),
    is_allowed_create               CHAR(1),
    is_allowed_update               CHAR(1),
    is_allowed_delete               CHAR(1),
    is_active                       CHAR(1),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_tables_active
        CHECK (is_active = 'Y' OR is_active IS NULL),
    --
    CONSTRAINT ch_app_tables_create
        CHECK (is_allowed_create = 'Y' OR is_allowed_create IS NULL),
    --
    CONSTRAINT ch_app_tables_update
        CHECK (is_allowed_update = 'Y' OR is_allowed_update IS NULL),
    --
    CONSTRAINT ch_app_tables_delete
        CHECK (is_allowed_delete = 'Y' OR is_allowed_delete IS NULL),
    --
    CONSTRAINT pk_app_tables
        PRIMARY KEY (app_id, table_name, role_id),
    --
    CONSTRAINT nn_app_tables_role
        CHECK (role_id IS NOT NULL    ),
    --
    CONSTRAINT fk_app_tables_role
        FOREIGN KEY (app_id, role_id)
        REFERENCES app_roles (app_id, role_id)
        DEFERRABLE INITIALLY DEFERRED,
    --
    CONSTRAINT fk_app_tables_app
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_tables IS '';
--
COMMENT ON COLUMN app_tables.app_id                 IS '';
COMMENT ON COLUMN app_tables.table_name             IS '';
COMMENT ON COLUMN app_tables.role_id                IS '';
COMMENT ON COLUMN app_tables.is_allowed_create      IS '';
COMMENT ON COLUMN app_tables.is_allowed_update      IS '';
COMMENT ON COLUMN app_tables.is_allowed_delete      IS '';
COMMENT ON COLUMN app_tables.is_active              IS '';

