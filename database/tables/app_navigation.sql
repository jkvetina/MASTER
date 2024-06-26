CREATE TABLE app_navigation (
    app_id                          NUMBER(8,0)           CONSTRAINT nn_app_navigation_app NOT NULL,
    page_id                         NUMBER(8,0)           CONSTRAINT nn_app_navigation_page NOT NULL,
    parent_id                       NUMBER(8,0),
    is_hidden                       CHAR(1),
    is_reset                        CHAR(1),
    order#                          NUMBER(4,0),
    col_id                          NUMBER(1,0),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_navigation_is_hidden
        CHECK (
            is_hidden = 'Y' OR is_hidden IS NULL
        ),
    --
    CONSTRAINT ch_app_navigation_is_reset
        CHECK (
            is_reset = 'Y' OR is_reset IS NULL
        ),
    --
    CONSTRAINT pk_app_navigation
        PRIMARY KEY (
            app_id,
            page_id
        ),
    --
    CONSTRAINT fk_app_navigation_parent
        FOREIGN KEY (
            app_id,
            parent_id
        )
        REFERENCES app_navigation (
            app_id,
            page_id
        )
        DEFERRABLE INITIALLY DEFERRED,
    --
    CONSTRAINT fk_app_navigation_app
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_navigation IS '';
--
COMMENT ON COLUMN app_navigation.app_id         IS '';
COMMENT ON COLUMN app_navigation.page_id        IS '';
COMMENT ON COLUMN app_navigation.parent_id      IS '';
COMMENT ON COLUMN app_navigation.is_hidden      IS '';
COMMENT ON COLUMN app_navigation.is_reset       IS '';
COMMENT ON COLUMN app_navigation.order#         IS '';
COMMENT ON COLUMN app_navigation.col_id         IS '';

