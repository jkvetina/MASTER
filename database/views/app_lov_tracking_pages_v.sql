CREATE OR REPLACE FORCE VIEW app_lov_tracking_pages_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()                   AS app_id,
        core.get_number_item('$PAGE_ID')    AS page_id,
        core.get_item('$PAGE_GROUP')        AS page_group
    FROM DUAL
),
page_groups AS (
    SELECT /*+ MATERIALIZE */
        p.page_id,
        p.page_name,
        p.page_alias,
        p.page_group
    FROM apex_application_pages p
    JOIN x
        ON x.app_id     = p.application_id
    WHERE p.page_id     > 0
)
--
SELECT
    TO_CHAR(x.app_id)   AS group_name,
    TO_NUMBER(NULL)     AS page_id,
    'All pages'         AS page_name__,
    NULL                AS page_name,
    NULL                AS page_alias,
    NULL                AS page_group
FROM x
--
UNION ALL
SELECT
    TO_CHAR(x.app_id)   AS group_name,
    0                   AS page_id,
    'Used pages only'   AS page_name__,
    NULL                AS page_name,
    NULL                AS page_alias,
    NULL                AS page_group
FROM x
--
UNION ALL
SELECT
    x.app_id ||
    CASE
        WHEN x.app_id IS NOT NULL THEN NVL(RTRIM(' - ' || p.page_group, ' - '), ' [NO GROUP]')
        END ||
    CASE
        WHEN COUNT(t.page_id) = 0 THEN ' [NOT USED]'
        END AS group_name,
    --
    t.page_id,
    RTRIM(t.page_id || ' - ' || t.page_name, ' - ') AS page_name__,
    t.page_name,
    p.page_alias,
    p.page_group
    --
FROM app_tracking_base_v t
LEFT JOIN page_groups p
    ON p.page_id            = t.page_id
CROSS JOIN x
WHERE 1 = 1
    AND t.app_id            = x.app_id
    AND (t.page_id          = x.page_id     OR NULLIF(x.page_id, 0) IS NULL)
    AND (p.page_group       = x.page_group  OR x.page_group IS NULL)
GROUP BY
    x.app_id,
    t.page_id,
    t.page_name,
    p.page_alias,
    p.page_group;
/

