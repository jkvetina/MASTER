-- ----------------------------------------
-- Page: 890 - Tracking > Dynamic Action: CHANGED_FILTERS > Action: Execute Server-side Code > Settings > PL/SQL Code

NULL;

-- ----------------------------------------
-- Page: 890 - Tracking > Process: REFRESH_MV > Source > PL/SQL Code

--app.refresh_mv(app_nav.c_mv);
app.refresh_mv('APP_TRACKING_%MV');

-- ----------------------------------------
-- Page: 890 - Tracking > Process: INIT_HEADERS > Source > PL/SQL Code

app_tracking.init_headers();

