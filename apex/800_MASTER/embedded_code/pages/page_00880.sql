-- ----------------------------------------
-- Page: 880 - #fa-dial-gauge-chart Dashboard > Process: REFRESH_ALL_MV > Source > PL/SQL Code

app.refresh_mv(core.get_app_prefix() || '%_MV');

-- ----------------------------------------
-- Page: 880 - #fa-dial-gauge-chart Dashboard > Process: RECOMPILE > Source > PL/SQL Code

recompile(core.get_app_prefix() || '%');

-- ----------------------------------------
-- Page: 880 - #fa-dial-gauge-chart Dashboard > Process: REFRESH_MV > Source > PL/SQL Code

app.refresh_mv(:P880_REFRESH);

