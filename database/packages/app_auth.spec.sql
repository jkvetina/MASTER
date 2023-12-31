CREATE OR REPLACE PACKAGE app_auth AS

    PROCEDURE after_auth;



    PROCEDURE request_account (
        in_user_mail        app_user_requests.user_mail%TYPE,
        in_user_name        app_user_requests.user_name%TYPE,
        in_user_notes       app_user_requests.user_notes%TYPE,
        in_agreement        app_user_requests.is_agreement%TYPE
    );



    PROCEDURE create_user (
        in_user_id          app_users.user_id%TYPE,
        in_user_name        app_users.user_name%TYPE        := NULL,
        in_user_mail        app_users.user_mail%TYPE        := NULL
    );



    PROCEDURE update_user (
        in_user_id          app_users.user_id%TYPE,
        in_user_name        app_users.user_name%TYPE        := NULL,
        in_user_mail        app_users.user_mail%TYPE        := NULL,
        in_user_nickname    app_users.user_nickname%TYPE    := NULL,
        in_user_title       app_users.user_title%TYPE       := NULL,
        in_user_about       app_users.user_about%TYPE       := NULL
    );



    PROCEDURE update_user_avatar (
        in_file_name        VARCHAR2
    );



    FUNCTION get_auth_function (
        in_app_id               app_pages.app_id%TYPE,
        in_auth_scheme          VARCHAR2
    )
    RETURN VARCHAR2
    RESULT_CACHE;



    FUNCTION is_admin
    RETURN CHAR;



    FUNCTION is_user (
        in_app_id               app_roles_map.app_id%TYPE       := NULL,
        in_page_id              app_pages.page_id%TYPE          := NULL,
        in_user_id              app_roles_map.user_id%TYPE      := NULL,
        in_context_id           app_roles_map.context_id%TYPE   := NULL
    )
    RETURN CHAR;



    FUNCTION is_user_component (
        in_component_id         app_components.component_id%TYPE,
        in_component_type       app_components.component_type%TYPE,
        in_component_name       app_components.component_name%TYPE,
        in_action               CHAR,
        in_context_id           app_roles_map.context_id%TYPE   := NULL
    )
    RETURN CHAR;



    FUNCTION is_user_component (
        in_app_id               app_roles_map.app_id%TYPE,
        in_user_id              app_roles_map.user_id%TYPE,
        in_page_id              app_pages.page_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE,
        in_component_id         app_components.component_id%TYPE,
        in_component_type       app_components.component_type%TYPE,
        in_component_name       app_components.component_name%TYPE,
        in_action               CHAR
    )
    RETURN CHAR;



    FUNCTION is_user_role (
        in_role_id              app_roles_map.role_id%TYPE,
        in_user_id              app_roles_map.user_id%TYPE      := NULL,
        in_app_id               app_roles_map.app_id%TYPE       := NULL,
        in_context_id           app_roles_map.context_id%TYPE   := NULL
    )
    RETURN CHAR;



    FUNCTION is_page_available (
        -- pass args so we can cache the result
        in_user_id              app_roles_map.user_id%TYPE,
        in_app_id               app_roles.app_id%TYPE,
        in_page_id              app_pages.page_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE,
        in_auth_scheme          VARCHAR2,
        in_procedure_name       VARCHAR2
    )
    RETURN CHAR;



    FUNCTION get_component_type (
        in_component_type       app_components.component_type%TYPE
    )
    RETURN app_components.component_type%TYPE;



    PROCEDURE discover_component (
        in_user_id              app_roles_map.user_id%TYPE,
        in_page_id              app_pages.page_id%TYPE,
        in_component_id         app_components.component_id%TYPE,
        in_component_type       app_components.component_type%TYPE,
        in_component_name       app_components.component_name%TYPE
    );



    PROCEDURE check_allowed_dml (
        in_table_name           app_tables.table_name%TYPE,
        in_action               CHAR,
        in_user_id              app_roles_map.user_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE       := NULL
    );



    FUNCTION is_allowed_dml (
        in_table_name           app_tables.table_name%TYPE,
        in_action               CHAR,
        in_user_id              app_roles_map.user_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE       := NULL
    )
    RETURN BOOLEAN;



    PROCEDURE check_executable (
        in_procedure_name       VARCHAR2,
        in_user_id              app_roles_map.user_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE       := NULL
    );



    PROCEDURE check_executable;



    FUNCTION is_executable (
        in_object_name          app_procedures.object_name%TYPE,
        in_procedure_name       app_procedures.object_name%TYPE,
        in_user_id              app_roles_map.user_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE       := NULL
    )
    RETURN BOOLEAN;



    PROCEDURE set_context (
        in_app_id               app_contexts_map.app_id%TYPE,
        in_user_id              app_contexts_map.user_id%TYPE,
        in_page_id              app_contexts_map.page_id%TYPE,
        in_context_id           app_contexts_map.context_id%TYPE
    );



    FUNCTION check_context (
        in_app_id               app_contexts_map.app_id%TYPE,
        in_user_id              app_contexts_map.user_id%TYPE,
        in_page_id              app_contexts_map.page_id%TYPE,
        in_context_id           app_contexts_map.context_id%TYPE
    )
    RETURN CHAR;

END;
/

