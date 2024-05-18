CREATE OR REPLACE FORCE VIEW app_navigation_badges_v AS
SELECT
    800                 AS app_id,
    850                 AS page_id,
    NULLIF(COUNT(*), 0) AS badge
FROM app_navigation_grid_v t
WHERE t.action_name     IS NOT NULL
UNION ALL
SELECT
    800                 AS app_id,
    806                 AS page_id,
    NULLIF(COUNT(*), 0) AS badge
FROM app_user_requests t
WHERE t.accepted_at     IS NULL
    AND t.rejected_at   IS NULL;
/

