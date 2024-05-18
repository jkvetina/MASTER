CREATE OR REPLACE FORCE VIEW app_user_street_credit_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_workspace()    AS workspace,
        core.get_app_id()           AS app_id,
        core.get_user_id()          AS user_id
    FROM DUAL
)
SELECT
    t.requests,
    t.max_requests
FROM (
    SELECT
        t.apex_user             AS user_id,
        COUNT(*)                AS requests,
        MAX(COUNT(*)) OVER ()   AS max_requests
        --
    FROM app_tracking_src_mv t
    JOIN x
        ON x.workspace          = t.workspace
        AND x.app_id            = t.application_id
    WHERE t.apex_user           != 'nobody'
        AND t.page_view_type    IN ('Rendering', 'Processing')
    GROUP BY
        t.apex_user
) t
JOIN x
    ON x.user_id = t.user_id;
/

