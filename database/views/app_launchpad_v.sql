CREATE OR REPLACE FORCE VIEW app_launchpad_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_session_id()   AS session_id
    FROM DUAL
),
t AS (
    -- deduplicate because we need just list of apps, not pages
    SELECT
        t.workspace,
        t.app_id,
        t.app_alias,
        t.app_name,
        --
        NULLIF(t.app_desc, '-') AS app_desc,
        --
        t.app_version,
        t.app_group,
        t.app_auth,
        t.home_link
    FROM app_navigation_map_mv t
    WHERE 1 = 1
        AND t.app_alias NOT LIKE 'MASTER%'  -- ignore Master apps
    GROUP BY
        t.workspace,
        t.app_id,
        t.app_alias,
        t.app_name,
        t.app_desc,
        t.app_version,
        t.app_group,
        t.app_auth,
        t.home_link
)
SELECT
    t.workspace,
    t.app_id,
    t.app_alias,
    t.app_name,
    t.app_desc,
    t.app_version,
    t.app_group,
    t.app_auth,
    --
    LTRIM(REPLACE(t.app_group, ' ', ''), '_') AS app_group_id,
    --
    REPLACE(REPLACE(REPLACE(REPLACE(t.home_link,
        '&' || 'APP_ID.',       t.app_id),
        '&' || 'APP_SESSION.',  x.session_id),
        '&' || 'SESSION.',      x.session_id),
        '&' || 'DEBUG.',        ''
        ) AS app_link,
    --
    /*
    CASE WHEN t.is_favorite = 'Y'
        THEN 'fa-heart RED'
        ELSE 'fa-heart-o'
        END AS badge_icon,
        */
    --
    NULL AS badge_icon,
    NULL AS is_favorite,
    --
    ROW_NUMBER() OVER (ORDER BY t.workspace, t.app_name) AS sort#
    --
FROM t
CROSS JOIN x;
/

