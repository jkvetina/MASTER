CREATE UNIQUE INDEX app_navigation_map_mv_uq
    ON app_navigation_map_mv (
        app_id,
        page_id
    )
    TABLESPACE data;

