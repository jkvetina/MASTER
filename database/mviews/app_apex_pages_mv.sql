BEGIN
    DBMS_UTILITY.EXEC_DDL_STATEMENT('DROP MATERIALIZED VIEW APP_APEX_PAGES_MV');
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- DROP MATERIALIZED VIEW APP_APEX_PAGES_MV, DONE');
    DBMS_OUTPUT.PUT_LINE('--');
EXCEPTION
WHEN OTHERS THEN
    NULL;
END;
/
--
CREATE MATERIALIZED VIEW app_apex_pages_mv
BUILD IMMEDIATE
REFRESH FORCE ON DEMAND
AS
SELECT
    a.workspace,
    a.app_id,
    a.app_alias,
    a.app_owner,
    a.app_group,
    a.app_name,
    a.app_version,
    a.app_auth,
    a.app_desc,
    a.app_prefix,
    --
    p.page_id,
    p.page_name,
    --
    NVL(p.page_title, '-')          AS page_title,
    NVL(p.page_alias, '-')          AS page_alias,
    NVL(p.page_group, '-')          AS page_group,
    NVL(p.page_css_classes, '-')    AS page_css_classes,
    --
    p.page_mode,
    p.page_template,
    --
    NVL(p.authorization_scheme, '-') AS auth_scheme
    --
FROM app_apex_apps_mv a
JOIN apex_application_pages p
    ON p.application_id = a.app_id;
/

