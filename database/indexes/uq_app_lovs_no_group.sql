CREATE UNIQUE INDEX uq_app_lovs_no_group
    ON app_lovs (app_id, lov_id, status_id, treshold)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

