CREATE OR REPLACE FORCE VIEW app_launchpad_versions_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_session_id()   AS session_id,
        core.get_user_id()      AS user_id,
        'NBL'                   AS workspace
    FROM DUAL
    WHERE core.is_developer_y() = 'Y'   -- just for develoeprs
),
t AS (
    SELECT
        a.application_id,
        a.application_name,
        a.version,
        --
        REGEXP_SUBSTR(a.version, '^(\d{4}-\d{2}-\d{2})', 1, 1, NULL, 1) AS current_version,
        --
        NULLIF (
            TO_CHAR(MAX(GREATEST(a.last_updated_on, p.last_updated_on)), 'YYYY-MM-DD'),
            REGEXP_SUBSTR(a.version, '^(\d{4}-\d{2}-\d{2})', 1, 1, NULL, 1)
        ) AS suggested_version,
        --
        MAX(GREATEST(a.last_updated_on, p.last_updated_on)) AS last_updated_at
        --
    FROM apex_applications a
    JOIN x
        ON x.workspace          = a.workspace
    LEFT JOIN apex_application_pages p
        ON p.application_id     = a.application_id
    WHERE 1 = 1
        AND REGEXP_LIKE(a.version, '^\d{4}-\d{2}-\d{2}')
    GROUP BY
        a.application_id,
        a.application_name,
        a.version,
        a.last_updated_on
)
SELECT
    t.application_id        AS app_id,
    t.application_name      AS app_name,
    t.version               AS app_version,
    --
    CASE WHEN t.current_version < t.suggested_version AND t.suggested_version IS NOT NULL
        THEN t.suggested_version || ' ' || core.get_env()
        END AS suggested_version,
    --
    t.last_updated_at
    --
FROM t;
/

