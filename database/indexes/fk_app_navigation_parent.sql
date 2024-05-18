CREATE INDEX fk_app_navigation_parent
    ON app_navigation (
        app_id,
        parent_id
    )
    TABLESPACE data;

