CREATE TABLE app_pages (
    app_id                          NUMBER(8,0)           CONSTRAINT nn_app_pages_app NOT NULL,
    page_id                         NUMBER(8,0)           CONSTRAINT nn_app_pages_page NOT NULL,
    role_id                         VARCHAR2(64)          CONSTRAINT nn_app_pages_role NOT NULL,
    is_active                       CHAR(1),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT ch_app_pages_active
        CHECK (
            is_active = 'Y' OR is_active IS NULL
        ),
    --
    CONSTRAINT pk_app_pages
        PRIMARY KEY (
            app_id,
            page_id,
            role_id
        )
  )  ENABLE,
    --
    CONSTRAINT fk_app_pages_role
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
    CONSTRAINT fk_app_pages_nav
        FOREIGN KEY (
            app_id,
            page_id
        )
        REFERENCES app_navigation (
            app_id,
            page_id
        )
        DEFERRABLE INITIALLY DEFERRED,
    --
    CONSTRAINT fk_app_pages_app
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id)
        DEFERRABLE INITIALLY DEFERRED
);
--
COMMENT ON TABLE app_pages IS '';
--
COMMENT ON COLUMN app_pages.app_id      IS '';
COMMENT ON COLUMN app_pages.page_id     IS '';
COMMENT ON COLUMN app_pages.role_id     IS '';
COMMENT ON COLUMN app_pages.is_active   IS '';

