-- ----------------------------------------
-- Page: 850 - #fa-map-signs Navigation > Process: REFRESH_MV > Source > PL/SQL Code

app.refresh_mv(app_nav.c_mv, in_wait => TRUE);
DBMS_SESSION.SLEEP(1);


-- ----------------------------------------
-- Page: 850 - #fa-map-signs Navigation > Process: AUTO_UPDATE > Source > PL/SQL Code

app_nav.autoupdate();


-- ----------------------------------------
-- Page: 850 - #fa-map-signs Navigation > Process: ADD_PAGE > Source > PL/SQL Code

app_nav.add_page (
    in_page_id  => :P850_ADD_PAGE,
    in_app_id   => core.get_app_id()
);

-- ----------------------------------------
-- Page: 850 - #fa-map-signs Navigation > Process: REMOVE_PAGE > Source > PL/SQL Code

app_nav.remove_page (
    in_page_id  => :P850_REMOVE_PAGE,
    in_app_id   => core.get_app_id()
);

