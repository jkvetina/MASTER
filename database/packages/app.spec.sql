CREATE OR REPLACE PACKAGE app AS

    -- name of the APEX app items
    global_app_id               CONSTANT VARCHAR2(30) := 'G_APP_ID';
    global_app_name             CONSTANT VARCHAR2(30) := 'G_APP_NAME';
    global_context_id           CONSTANT VARCHAR2(30) := 'G_CONTEXT_ID';
    global_today                CONSTANT VARCHAR2(30) := 'G_TODAY';



    PROCEDURE init_defaults;



    FUNCTION get_init_defaults_procedure (
        in_app_id               app_pages.app_id%TYPE,
        in_page_id              app_pages.page_id%TYPE
    )
    RETURN VARCHAR2
    RESULT_CACHE;



    FUNCTION get_icon_warning (
        in_title                VARCHAR2    := NULL,
        in_style                VARCHAR2    := NULL
    )
    RETURN VARCHAR2;



    FUNCTION get_icon_check (
        in_title                VARCHAR2    := NULL,
        in_style                VARCHAR2    := NULL
    )
    RETURN VARCHAR2;



    FUNCTION get_user_views_text (
        in_view_name            user_views.view_name%TYPE
    )
    RETURN VARCHAR2;



    PROCEDURE ajax_ping;



    PROCEDURE ajax_message (
        in_message          app_user_messages.message_payload%TYPE,
        in_type             app_user_messages.message_type%TYPE         := NULL,
        in_user_id          app_user_messages.user_id%TYPE              := NULL,
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

