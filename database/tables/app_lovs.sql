CREATE TABLE app_lovs (
    app_id                          NUMBER(8,0)     CONSTRAINT nn_app_lovs_app NOT NULL,
    lov_group                       VARCHAR2(64)    CONSTRAINT nn_app_lovs_group NOT NULL,
    lov_id                          VARCHAR2(64)    CONSTRAINT nn_app_lovs_id NOT NULL,
    lov_name                        VARCHAR2(64),
    status_id                       VARCHAR2(64),
    status_name                     VARCHAR2(64),
    order#                          NUMBER(4,0),
    treshold                        NUMBER,
    color_bg                        VARCHAR2(32),
    color_text                      VARCHAR2(32),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    status_value                    VARCHAR2(64),
    --
    CONSTRAINT uq_app_lovs
        UNIQUE (app_id, lov_group, lov_id, status_id, treshold),
    --
    CONSTRAINT uq_app_lovs_no_group
        UNIQUE (app_id, lov_id, status_id, treshold),
    --
    CONSTRAINT fk_app_lovs_app
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_lovs IS '';
--
COMMENT ON COLUMN app_lovs.app_id           IS '';
COMMENT ON COLUMN app_lovs.lov_group        IS '';
COMMENT ON COLUMN app_lovs.lov_id           IS '';
COMMENT ON COLUMN app_lovs.lov_name         IS '';
COMMENT ON COLUMN app_lovs.status_id        IS '';
COMMENT ON COLUMN app_lovs.status_name      IS '';
COMMENT ON COLUMN app_lovs.order#           IS '';
COMMENT ON COLUMN app_lovs.treshold         IS '';
COMMENT ON COLUMN app_lovs.color_bg         IS '';
COMMENT ON COLUMN app_lovs.color_text       IS '';
COMMENT ON COLUMN app_lovs.status_value     IS '';

