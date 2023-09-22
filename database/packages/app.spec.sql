CREATE OR REPLACE PACKAGE app AS

    -- name of the APEX app items
    global_app_id               CONSTANT VARCHAR2(30) := 'G_APP_ID';
    global_app_name             CONSTANT VARCHAR2(30) := 'G_APP_NAME';
    global_context_id           CONSTANT VARCHAR2(30) := 'G_CONTEXT_ID';
    global_today                CONSTANT VARCHAR2(30) := 'G_TODAY';



    PROCEDURE after_auth;



    PROCEDURE init_defaults;



    FUNCTION get_init_defaults_procedure (
        in_app_id               app_pages.app_id%TYPE,
        in_page_id              app_pages.page_id%TYPE
    )
    RETURN VARCHAR2
    RESULT_CACHE;



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



    PROCEDURE ajax_ping;



    PROCEDURE ajax_message (
        in_user_id          app_user_messages.user_id%TYPE,
        in_message          app_user_messages.message_payload%TYPE,
        in_type             app_user_messages.message_type%TYPE         := NULL,
        in_session_id       app_user_messages.session_id%TYPE           := NULL,
        in_app_id           app_user_messages.app_id%TYPE               := NULL,
        in_message_id       app_user_messages.message_id%TYPE           := NULL
    );



    PROCEDURE refresh_mv_job (
        in_name_like        VARCHAR2,
        in_ping_success     BOOLEAN := TRUE
    );



    PROCEDURE refresh_mv (
        in_name_like        VARCHAR2,
        in_wait             BOOLEAN := FALSE
    );



    FUNCTION get_color (
        in_lov_id           app_lovs.lov_id%TYPE,
        in_value            app_lovs.treshold%TYPE,
        in_text             CHAR                        := NULL,
        in_app_id           app_lovs.app_id%TYPE        := NULL
    )
    RETURN app_lovs.color_bg%TYPE;



    PROCEDURE favorite_switch (
        in_app_id               app_users_map.app_id%TYPE,
        in_user_id              app_users_map.user_id%TYPE
    );

END;
/

