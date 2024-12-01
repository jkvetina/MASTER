CREATE TABLE app_navigation (
    app_id                          NUMBER(8,0)           CONSTRAINT nn_app_navigation_app NOT NULL,
    target_app_id                   NUMBER(8,0)           CONSTRAINT nn_app_navigation_target_app NOT NULL,
    target_page_id                  NUMBER(8,0)           CONSTRAINT nn_app_navigation_target_page NOT NULL,
    parent_id                       NUMBER(8,0),
    is_hidden                       CHAR(1),
    is_reset                        CHAR(1),
    order#                          NUMBER(4,0),
    col_id                          NUMBER(1,0),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT app_navigation_is_hidden
        CHECK (
            is_hidden = 'Y' OR is_hidden IS NULL
        ) ENABLE,
    --
    CONSTRAINT app_navigation_is_reset
        CHECK (
            is_reset = 'Y' OR is_reset IS NULL
        ) ENABLE,
    --
    CONSTRAINT app_navigation_pk
        PRIMARY KEY (
            app_id,
            target_app_id,
            target_page_id
        )
);
--
COMMENT ON TABLE app_navigation IS 'Custom navigation';
--
COMMENT ON COLUMN app_navigation.app_id             IS 'Application where these pages will be visible';
COMMENT ON COLUMN app_navigation.target_app_id      IS 'Application of the target page';
COMMENT ON COLUMN app_navigation.target_page_id     IS 'Target page';
COMMENT ON COLUMN app_navigation.parent_id          IS 'Parent page (in the same app)';
COMMENT ON COLUMN app_navigation.is_hidden          IS 'Mark page invisible in navigation';
COMMENT ON COLUMN app_navigation.is_reset           IS 'Clear cache on page load';
COMMENT ON COLUMN app_navigation.order#             IS 'Order for the same siblings';
COMMENT ON COLUMN app_navigation.col_id             IS 'Specific column in multicolumn menu';

