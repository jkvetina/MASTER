CREATE OR REPLACE PACKAGE app_nav AS

    c_mv                        CONSTANT VARCHAR2(30)   := 'APP_NAV%_MV';
    c_collection_badges         CONSTANT VARCHAR2(30)   := 'APP_NAVIGATION_BADGES';     -- also used in nav view



    PROCEDURE init_defaults;



    PROCEDURE remove_page (
        in_app_id               app_navigation.app_id%TYPE,
        in_target_app_id        app_navigation.target_app_id%TYPE,
        in_target_page_id       app_navigation.target_page_id%TYPE
    );



    PROCEDURE add_page (
        in_app_id               app_navigation.app_id%TYPE,
        in_target_app_id        app_navigation.target_app_id%TYPE,
        in_target_page_id       app_navigation.target_page_id%TYPE,
        in_parent_id            app_navigation.parent_id%TYPE   := NULL,
        in_is_hidden            app_navigation.is_hidden%TYPE   := NULL,
        in_is_reset             app_navigation.is_reset%TYPE    := NULL,
        in_order#               app_navigation.order#%TYPE      := NULL,
        in_col_id               app_navigation.col_id%TYPE      := NULL
    );



    PROCEDURE save_grid;



    PROCEDURE autoupdate;



    PROCEDURE init_badges;



    PROCEDURE add_badge (
        in_app_id               app_navigation.app_id%TYPE,
        in_target_app_id        app_navigation.target_app_id%TYPE,
        in_target_page_id       app_navigation.target_page_id%TYPE,
        in_badge                VARCHAR2
    );

END;
/

