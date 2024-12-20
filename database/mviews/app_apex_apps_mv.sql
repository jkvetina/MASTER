BEGIN
    DBMS_UTILITY.EXEC_DDL_STATEMENT('DROP MATERIALIZED VIEW APP_APEX_APPS_MV');
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- DROP MATERIALIZED VIEW APP_APEX_APPS_MV, DONE');
    DBMS_OUTPUT.PUT_LINE('--');
EXCEPTION
WHEN OTHERS THEN
    NULL;
END;
/
--
CREATE MATERIALIZED VIEW app_apex_apps_mv
BUILD IMMEDIATE
REFRESH FORCE ON DEMAND
AS
SELECT
    a.workspace,
    a.workspace_id,
    --
    a.application_id                AS app_id,
    a.alias                         AS app_alias,
    a.owner                         AS app_owner,
    a.application_group             AS app_group,
    a.application_name              AS app_name,
    a.version                       AS app_version,
    a.authentication_scheme         AS app_auth,
    --
    NVL(s.substitution_value, '-')  AS app_desc,        -- we cant have NULL values in MV
    NVL(s.substitution_value, '-')  AS app_prefix       -- we cant have NULL values in MV
    --
    /*
    a.home_link             AS home_url,
    a.login_url,
    a.logout_url
    */
FROM apex_applications a
LEFT JOIN apex_application_substitutions s
    ON s.application_id         = a.application_id
    AND s.substitution_string   = 'APP_DESC'            -- provide application description for Launchpad cards
LEFT JOIN apex_application_substitutions f
    ON f.application_id         = a.application_id
    AND f.substitution_string   = 'APP_PREFIX'          -- provide objects prefix
WHERE 1 = 1
    AND a.workspace             NOT IN ('INTERNAL')     -- skip Oracle stuff
    AND a.workspace             NOT LIKE 'COM.%'        -- skip Oracle stuff
    AND a.application_name      NOT LIKE '%BACKUP%'     -- skip backups
    AND (
        a.application_group     NOT IN (
            '_ MASTER',         -- hide group with Master apps
            '__ HIDDEN',        -- hide all apps in Hidden group
            'Sample Apps'       -- hide all Sample apps
        )
        OR a.alias              LIKE 'MASTER%'          -- keep Master app for Navigation
    );
/

