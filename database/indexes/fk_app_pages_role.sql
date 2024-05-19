CREATE INDEX fk_app_pages_role
    ON app_pages (
        app_id,
        role_id
    );

