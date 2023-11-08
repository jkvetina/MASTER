CREATE UNIQUE INDEX pk_app_contexts
    ON app_contexts (app_id, context_id)
    COMPUTE STATISTICS
    TABLESPACE "DATA";

