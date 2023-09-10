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
        DBMS_LOB.SUBSTR(a.application_comment, 2000) AS app_desc,
        --
        NVL(s.value, b.substitution_value) AS app_prefix,
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
    LEFT JOIN apex_application_settings s
        ON s.application_id         = a.application_id
        AND s.name                  = 'APP_PREFIX'
    LEFT JOIN apex_application_substitutions b
        ON b.application_id         = a.application_id
        AND b.substitution_string   = 'APP_PREFIX'
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
    NULLIF(MIN(s.owner || '.' || s.object_name || '.' || s.procedure_name), '..') AS procedure_name,
    --
    p.page_css_classes,
    p.page_mode,
    p.page_template
    --
FROM p
LEFT JOIN all_procedures s
    ON s.owner                  = p.app_owner
    AND s.object_name           IN ('AUTH', p.app_prefix || 'AUTH')
    AND s.procedure_name        = REGEXP_SUBSTR(p.auth_scheme, '\S+$')
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

