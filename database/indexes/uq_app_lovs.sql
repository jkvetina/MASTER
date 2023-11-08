CREATE UNIQUE INDEX uq_app_lovs
    ON app_lovs (app_id, lov_group, lov_id, status_id, treshold)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

