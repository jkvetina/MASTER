CREATE OR REPLACE FORCE VIEW app_lov_all_pages_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        COALESCE (
            core.get_number_item('$APP_ID'),
            core.get_context_app()
        ) AS app_id
    FROM DUAL
)
SELECT
    p.page_id       AS id,
    --
    p.page_id || ' - '
        || LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(p.page_name,
            '([#]fa[-][a-z0-9-]+)', ''),
            '<.+?>', ''
        )) AS display_value,
    --
    p.page_group    AS group_id,
    p.page_id       AS sort#
    --
FROM app_apex_pages_mv p
JOIN x
    ON x.app_id = p.app_id;
/

