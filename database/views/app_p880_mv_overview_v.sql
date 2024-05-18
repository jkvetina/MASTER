CREATE OR REPLACE FORCE VIEW app_p880_mv_overview_v AS
SELECT
    m.owner,
    m.mview_name,
    'REFRESH' AS action_refresh,
    --
    TO_CHAR(m.last_refresh_end_time, 'YYYY-MM-DD HH24:MI')          AS last_refreshed_at,
    CEIL(86400 * (m.last_refresh_end_time - m.last_refresh_date))   AS last_refreshed_timer,
    m.staleness,
    m.compile_state,
    --
    t.num_rows,
    i.count_indexes,
    --
    CASE WHEN t.cache = 'Y'         THEN 'Y' END AS is_cached,
    CASE WHEN t.partitioned = 'YES' THEN 'Y' END AS is_partitioned
    --
FROM all_mviews m
JOIN all_tables t
    ON t.owner          = m.owner
    AND t.table_name    = m.mview_name
LEFT JOIN (
    SELECT
        i.table_name,
        COUNT(*)            AS count_indexes
    FROM all_indexes i
    WHERE i.owner           = core.get_app_owner()
        AND i.table_name    LIKE core.get_app_prefix() || '%'
    GROUP BY
        i.table_name
) i
    ON i.table_name     = m.mview_name
WHERE m.owner           = core.get_app_owner()
    AND m.mview_name    LIKE core.get_app_prefix() || '%';
/

