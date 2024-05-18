CREATE INDEX fk_app_components_page
    ON app_components (
        app_id,
        page_id
    )
    TABLESPACE data;

