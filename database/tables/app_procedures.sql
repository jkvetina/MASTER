CREATE TABLE app_procedures (
    app_id                          NUMBER(8,0)           CONSTRAINT nn_app_procedures_app NOT NULL,
    object_name                     VARCHAR2(30)          CONSTRAINT nn_app_procedures_object NOT NULL,
    procedure_name                  VARCHAR2(30)          CONSTRAINT nn_app_procedures_proc NOT NULL,
    table_name                      VARCHAR2(64),
    role_id                         VARCHAR2(64),
    is_active                       CHAR(1),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_procedures_active
        CHECK (
            is_active = 'Y' OR is_active IS NULL
        ),
    --
    CONSTRAINT uq_app_procedures
        UNIQUE (
            app_id,
            object_name,
            procedure_name,
            role_id
        )
  )  ENABLE,
    --
    CONSTRAINT fk_app_procedures_role
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
    CONSTRAINT fk_app_procedures_app
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_procedures IS '';
--
COMMENT ON COLUMN app_procedures.app_id             IS '';
COMMENT ON COLUMN app_procedures.object_name        IS '';
COMMENT ON COLUMN app_procedures.procedure_name     IS '';
COMMENT ON COLUMN app_procedures.table_name         IS '';
COMMENT ON COLUMN app_procedures.role_id            IS '';
COMMENT ON COLUMN app_procedures.is_active          IS '';

