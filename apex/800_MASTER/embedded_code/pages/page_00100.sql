-- ----------------------------------------
-- Page: 100 - #fa-navicon > Process: REFRESH_MV > Source > PL/SQL Code

app.refresh_mv('APP_NAV%_MV', in_wait => TRUE);

-- ----------------------------------------
-- Page: 100 - #fa-navicon > Process: FAVORITE_SWITCH > Source > PL/SQL Code

app.favorite_switch (
    in_app_id   => APEX_APPLICATION.G_X01,
    in_user_id  => core.get_user_id()
);

