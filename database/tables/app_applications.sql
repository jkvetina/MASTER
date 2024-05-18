CREATE TABLE app_applications (
    app_id                          NUMBER(8,0)           CONSTRAINT nn_app_applications_app NOT NULL,
    is_active                       CHAR(1),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_applications_is_active
        CHECK (
            is_active='Y' OR is_active IS NULL
        ),
    --
    CONSTRAINT pk_app_applications
        PRIMARY KEY (app_id)
);
--
COMMENT ON TABLE app_applications IS '';
--
COMMENT ON COLUMN app_applications.app_id       IS '';
COMMENT ON COLUMN app_applications.is_active    IS '';

