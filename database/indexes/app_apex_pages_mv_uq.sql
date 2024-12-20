CREATE UNIQUE INDEX app_apex_pages_mv_uq
    ON app_apex_pages_mv (
        app_id,
        page_id
    )
    TABLESPACE data;

