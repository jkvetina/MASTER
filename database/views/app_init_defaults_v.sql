CREATE OR REPLACE FORCE VIEW app_init_defaults_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()       AS app_id,
        core.get_page_id()      AS page_id,
        core.get_app_owner()    AS owner,
        --
        NULLIF(RTRIM(core.get_substitution('APP_PREFIX'), '_') || '_', '_') AS prefix
        --
    FROM DUAL
),
potencial_procedures (sort#, object_name, procedure_name) AS (
    SELECT 1,   x.prefix || 'APP',                  'INIT_DEFAULTS'         FROM x UNION ALL
    SELECT 2,   x.prefix || 'A' || x.app_id,        'INIT_DEFAULTS'         FROM x UNION ALL
    SELECT 3,   x.prefix || 'APP_P' || x.page_id,   'INIT_DEFAULTS'         FROM x UNION ALL
    SELECT 4,   x.prefix || 'APP',                  'INIT_P' || x.page_id   FROM x UNION ALL
    SELECT 5,   x.prefix || 'A' || x.app_id,        'INIT_P' || x.page_id   FROM x
)
SELECT
    x.owner,
    p.object_name,
    p.procedure_name,
    p.sort#,
    a.object_id
    --
FROM potencial_procedures p
CROSS JOIN x
LEFT JOIN all_procedures a
    ON a.owner              = x.owner
    AND a.object_name       = p.object_name
    AND a.procedure_name    = p.procedure_name
--WHERE p.object_id IS NOT NULL
;
/

