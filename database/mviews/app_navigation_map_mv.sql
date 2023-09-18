BEGIN
    DBMS_UTILITY.EXEC_DDL_STATEMENT('DROP MATERIALIZED VIEW APP_NAVIGATION_MAP_MV');
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- MATERIALIZED VIEW APP_NAVIGATION_MAP_MV DROPPED');
    DBMS_OUTPUT.PUT_LINE('--');
EXCEPTION
WHEN OTHERS THEN
    NULL;
END;
/
--
CREATE MATERIALIZED VIEW app_navigation_map_mv
TABLESPACE "DATA"
BUILD IMMEDIATE
REFRESH FORCE ON DEMAND
AS
WITH p AS (
    SELECT /*+ MATERIALIZE */
        a.workspace,
        a.application_id            AS app_id,
        a.alias                     AS app_alias,
        a.owner                     AS app_owner,
        a.application_group         AS app_group,
        a.application_name          AS app_name,
        --
        COALESCE (
            s.substitution_value,                           -- APP_DESC substitution
            DBMS_LOB.SUBSTR(a.application_comment, 2000)    -- application comment
        ) AS app_desc,
        --
        core.get_app_prefix(in_app_id => a.application_id) AS app_prefix,
        --
        p.page_id,
        p.page_alias,
        p.page_name,
        p.page_title,
        p.page_group,
        p.authorization_scheme      AS auth_scheme,
        p.page_css_classes,
        p.page_mode,
        p.page_template
        --
    FROM apex_applications a
    JOIN apex_application_pages p
        ON p.application_id         = a.application_id
    LEFT JOIN apex_application_substitutions s
        ON s.application_id         = a.application_id
        AND s.substitution_string   = 'APP_DESC'
    WHERE a.workspace               NOT IN ('INTERNAL')
        AND a.workspace             NOT LIKE 'COM.%'
)
SELECT
    p.workspace,
    p.app_id,
    p.app_alias,
    p.app_owner,
    p.app_group,
    p.app_prefix,
    p.app_name,
    p.app_desc,
    --
    p.page_id,
    p.page_alias,
    p.page_name,
    p.page_title,
    p.page_group,
    p.auth_scheme,

    -- find procedures handling authorization on each page
    app.get_auth_function (
        in_app_id       => p.app_id,
        in_auth_scheme  => p.auth_scheme
    ) AS procedure_name,
    --
    p.page_css_classes,
    p.page_mode,
    p.page_template
    --
FROM p
GROUP BY
    p.workspace,
    p.app_id,
    p.app_alias,
    p.app_owner,
    p.app_group,
    p.app_prefix,
    p.app_name,
    p.app_desc,
    p.page_id,
    p.page_alias,
    p.page_name,
    p.page_title,
    p.page_group,
    p.auth_scheme,
    p.page_css_classes,
    p.page_mode,
    p.page_template;
--

