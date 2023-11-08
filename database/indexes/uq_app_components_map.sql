CREATE UNIQUE INDEX uq_app_components_map
    ON app_components (app_id, component_id, role_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

