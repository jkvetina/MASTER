-- ----------------------------------------
-- Page: 9999 - Login Page > Process: LOGOUT > Source > PL/SQL Code

IF :APP_SESSION > 0 AND APEX_AUTHENTICATION.IS_AUTHENTICATED AND UPPER(:APP_USER) != 'NOBODY' THEN
    BEGIN
        APEX_AUTHENTICATION.LOGOUT (
            p_session_id    => :APP_SESSION,
            p_app_id        => core.get_app_id()
        );
    EXCEPTION
    WHEN OTHERS THEN
        NULL;
    END;
    --
    BEGIN
        APEX_SESSION.DELETE_SESSION(p_session_id => :APP_SESSION);
    EXCEPTION
    WHEN OTHERS THEN
        NULL;
    END;

--    core.redirect('/ords/r/apps/master/login?session=0');
    core.redirect('/ords/f?p=800:9999:0');
--core.raise_error('REDIRECTING');
    --APEX_CUSTOM_AUTH.SET_SESSION_ID_TO_NEXT_VALUE;
END IF;

