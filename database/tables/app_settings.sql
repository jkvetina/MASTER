CREATE TABLE app_settings (
    app_id                          NUMBER(8,0)     CONSTRAINT nn_app_settings_app NOT NULL,
    context_id                      VARCHAR2(64)    CONSTRAINT nn_app_settings_context NOT NULL,
    setting_name                    VARCHAR2(30)    CONSTRAINT nn_app_settings NOT NULL,
    setting_value                   VARCHAR2(256),
    setting_group                   VARCHAR2(64),
    setting_desc                    VARCHAR2(512),
    is_numeric                      CHAR(1),
    is_date                         CHAR(1),
    is_private                      CHAR(1),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_settings_is_active
        CHECK ((is_numeric = 'Y' AND is_date IS NULL) OR is_numeric IS NULL),
    --
    CONSTRAINT ch_app_settings_is_date
        CHECK ((is_date = 'Y' AND is_numeric IS NULL) OR is_date IS NULL),
    --
    CONSTRAINT ch_app_settings_is_private
        CHECK (is_private = 'Y' OR is_private IS NULL),
    --
    CONSTRAINT pk_app_settings
        PRIMARY KEY (app_id, context_id, setting_name),
    --
    CONSTRAINT fk_app_settings_app_id
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id),
    --
    CONSTRAINT fk_app_settings_context_id
        FOREIGN KEY (app_id, context_id)
        REFERENCES app_contexts (app_id, context_id)
);
--
COMMENT ON TABLE app_settings IS '';
--
COMMENT ON COLUMN app_settings.app_id           IS '';
COMMENT ON COLUMN app_settings.context_id       IS '';
COMMENT ON COLUMN app_settings.setting_name     IS '';
COMMENT ON COLUMN app_settings.setting_value    IS '';
COMMENT ON COLUMN app_settings.setting_group    IS '';
COMMENT ON COLUMN app_settings.setting_desc     IS '';
COMMENT ON COLUMN app_settings.is_numeric       IS '';
COMMENT ON COLUMN app_settings.is_date          IS '';
COMMENT ON COLUMN app_settings.is_private       IS '';

