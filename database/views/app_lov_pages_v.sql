CREATE OR REPLACE FORCE VIEW app_lov_pages_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()               AS app_id,
        core.get_item('$PAGE_GROUP')    AS page_group
    FROM DUAL
)
SELECT
    t.page_id,
    t.page_name,
    t.page_id       || ' - ' || REGEXP_REPLACE(t.page_name, '<.+?>')    AS page,
    g.group_name    || ' - ' || g.page_group_name                       AS page_group,
    t.page_group                                                        AS page_group_raw,
    --
    LAG(t.page_id)  OVER (ORDER BY t.page_id) AS prev_page,
    LEAD(t.page_id) OVER (ORDER BY t.page_id) AS next_page
    --
FROM app_navigation_map_mv t
JOIN x
    ON t.app_id             = x.app_id
JOIN app_lov_page_groups_v g
    ON g.page_group         = t.page_group
WHERE 1 = 1
    AND (x.page_group       = t.page_group OR x.page_group IS NULL);
--
COMMENT ON TABLE app_lov_pages_v IS '';

