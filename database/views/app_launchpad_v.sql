CREATE OR REPLACE FORCE VIEW app_launchpad_v AS
SELECT
    a.workspace,
    a.app_id,
    a.app_alias,
    a.app_prefix,
    a.app_name,
    a.app_desc,
    --
    APEX_PAGE.GET_URL (
        p_session       => core.get_session_id(),
        p_application   => a.app_id,
        p_page          => 'HOME'           -- get real homepage
    ) AS app_link
    --
FROM app_navigation_map_mv a
WHERE a.app_group       = 'LAUNCHPAD'
GROUP BY
    a.workspace,
    a.app_id,
    a.app_alias,
    a.app_prefix,
    a.app_name,
    a.app_desc
ORDER BY
    a.workspace,
    a.app_name;
--
COMMENT ON TABLE app_launchpad_v IS '';

