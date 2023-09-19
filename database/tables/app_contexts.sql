CREATE TABLE app_contexts (
    app_id                          NUMBER(8,0)     CONSTRAINT nn_app_contexts_app NOT NULL,
    context_id                      VARCHAR2(64)    CONSTRAINT nn_app_contexts_name NOT NULL,
    context_name                    VARCHAR2(64),
    context_group                   VARCHAR2(64),
    context_desc                    VARCHAR2(512),
    order#                          NUMBER(4,0),
    updated_by                      VARCHAR2(128),
    updated_at                      DATE,
    --
    CONSTRAINT pk_app_contexts
        PRIMARY KEY (app_id, context_id),
    --
    CONSTRAINT fk_app_contexts_app_id
        FOREIGN KEY (app_id)
        REFERENCES app_applications (app_id)
);
--
COMMENT ON TABLE app_contexts IS '';
--
COMMENT ON COLUMN app_contexts.app_id           IS '';
COMMENT ON COLUMN app_contexts.context_id       IS '';
COMMENT ON COLUMN app_contexts.context_name     IS '';
COMMENT ON COLUMN app_contexts.context_group    IS '';
COMMENT ON COLUMN app_contexts.context_desc     IS '';
COMMENT ON COLUMN app_contexts.order#           IS '';

