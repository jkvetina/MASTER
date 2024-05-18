CREATE INDEX app_navigation_map_mv_p1
    ON app_navigation_map_mv (
        app_id,
        page_id
    )
    TABLESPACE data;

