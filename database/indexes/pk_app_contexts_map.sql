CREATE UNIQUE INDEX pk_app_contexts_map
    ON app_contexts_map (app_id, user_id, page_id, context_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

