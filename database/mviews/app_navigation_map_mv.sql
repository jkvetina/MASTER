BEGIN
    DBMS_UTILITY.EXEC_DDL_STATEMENT('DROP MATERIALIZED VIEW APP_NAVIGATION_MAP_MV');
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- DROP MATERIALIZED VIEW APP_NAVIGATION_MAP_MV, DONE');
    DBMS_OUTPUT.PUT_LINE('--');
EXCEPTION
WHEN OTHERS THEN
    NULL;
END;
/
--
CREATE MATERIALIZED VIEW app_navigation_map_mv
BUILD IMMEDIATE
REFRESH FORCE ON DEMAND
AS
SELECT
    a.workspace,
    a.application_id            AS app_id,
    a.alias                     AS app_alias,
    a.owner                     AS app_owner,
    a.application_group         AS app_group,
    a.application_name          AS app_name,
    a.version                   AS app_version,
    a.authentication_scheme     AS app_auth,
    --
    NVL(s.substitution_value, '-')      AS app_desc,            -- we cant have NULLs in MV
    --
    p.page_id,
    p.page_name,
    NVL(p.page_alias, '-')              AS page_alias,
    NVL(p.page_title, '-')              AS page_title,
    NVL(p.page_group, '-')              AS page_group,
    NVL(p.page_css_classes, '-')        AS page_css_classes,
    --
    p.page_mode,
    p.page_template,
    NVL(p.authorization_scheme, '-')    AS auth_scheme,
    a.home_link
    --
FROM apex_applications a
JOIN apex_application_pages p
    ON p.application_id         = a.application_id
LEFT JOIN apex_application_substitutions s
    ON s.application_id         = a.application_id
    AND s.substitution_string   = 'APP_DESC'                    -- provide application description for Launchpad cards
WHERE 1 = 1
    AND a.workspace             NOT IN ('INTERNAL')
    AND a.workspace             NOT LIKE 'COM.%'
    AND a.application_name      NOT LIKE '%BACKUP%'
    AND (
        a.application_group     NOT IN ('_ MASTER', '__ HIDDEN', 'Sample Apps')
        OR a.alias              LIKE 'MASTER%'                  -- keep Master app for Navigation
    );
/

