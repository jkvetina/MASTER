CREATE OR REPLACE PACKAGE app_nav AS

    c_mv                        CONSTANT VARCHAR2(30)   := 'APP_NAV%_MV';



    PROCEDURE remove_page (
        in_app_id               app_navigation.app_id%TYPE,
        in_page_id              app_navigation.page_id%TYPE
    );



    PROCEDURE add_page (
        in_app_id               app_navigation.app_id%TYPE,
        in_page_id              app_navigation.page_id%TYPE,
        in_parent_id            app_navigation.parent_id%TYPE   := NULL,
        in_is_hidden            app_navigation.is_hidden%TYPE   := NULL,
        in_is_reset             app_navigation.is_reset%TYPE    := NULL,
        in_order#               app_navigation.order#%TYPE      := NULL,
        in_col_id               app_navigation.col_id%TYPE      := NULL
    );



    PROCEDURE autoupdate;



    FUNCTION get_autoupdate_hot
    RETURN VARCHAR2;

END;
/

