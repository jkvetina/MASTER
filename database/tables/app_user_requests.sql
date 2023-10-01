CREATE TABLE app_user_requests (
    user_id                         VARCHAR2(128)   CONSTRAINT nn_app_user_requests_id NOT NULL,
    user_mail                       VARCHAR2(128)   CONSTRAINT nn_app_user_requests_mail NOT NULL,
    user_name                       VARCHAR2(64)    CONSTRAINT nn_app_user_requests_name NOT NULL,
    user_notes                      VARCHAR2(512),
    is_agreement                    CHAR(1)         CONSTRAINT nn_app_user_requests_agree NOT NULL,
    created_by                      VARCHAR2(128),
    created_at                      DATE,
    accepted_by                     VARCHAR2(128),
    accepted_at                     DATE,
    rejected_by                     VARCHAR2(128),
    rejected_at                     DATE,
    --
    CONSTRAINT ch_app_user_requests_agree
        CHECK (is_agreement = 'Y' OR is_agreement IS NULL),
    --
    CONSTRAINT pk_app_user_requests
        PRIMARY KEY (user_mail)
);
--
COMMENT ON TABLE app_user_requests IS '';
--
COMMENT ON COLUMN app_user_requests.user_id         IS '';
COMMENT ON COLUMN app_user_requests.user_mail       IS '';
COMMENT ON COLUMN app_user_requests.user_name       IS '';
COMMENT ON COLUMN app_user_requests.user_notes      IS '';
COMMENT ON COLUMN app_user_requests.is_agreement    IS '';
COMMENT ON COLUMN app_user_requests.accepted_by     IS '';
COMMENT ON COLUMN app_user_requests.accepted_at     IS '';
COMMENT ON COLUMN app_user_requests.rejected_by     IS '';
COMMENT ON COLUMN app_user_requests.rejected_at     IS '';

