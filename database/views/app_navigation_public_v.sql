CREATE OR REPLACE FORCE VIEW app_navigation_public_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()       AS app_id,
        core.get_page_id()      AS page_id,
        800                     AS master_app_id
    FROM DUAL
    WHERE UPPER(core.get_user_id()) IN ('NOBODY', USER)
),
public_pages AS (
    SELECT
        800     AS app_id,
        9999    AS page_id,
        1       AS lvl,
        --
        '<a href="' || APEX_PAGE.GET_URL (
            p_application   => x.master_app_id,
            p_page          => 9999,
            p_session       => 0
        ) || '" style="background: #222;"><img src="#APP_FILES#icons/app-icon-192.png?v=#APP_VERSION#" alt="" style="width: 2rem; height: 2rem; margin: -0.5rem -0.5rem;" /></a>' AS attribute01,
        --
        '/0.000/' AS order#
    FROM x
    UNION ALL
    --
    SELECT
        800 AS app_id,
        9999 AS page_id,
        1 AS lvl,
        '</li></ul><ul class="RIGHT"><li style="display: none;">' AS attribute01,
        '/0.666/' AS order#
    FROM x
    UNION ALL
    --
    SELECT
        800     AS app_id,
        980     AS page_id,
        1       AS lvl,
        --
        '<a href="' || APEX_PAGE.GET_URL (
            p_application   => x.master_app_id,
            p_page          => 980,
            p_items         => 'P980_APP_ID,P980_PAGE_ID',
            p_values        => '800,9999'
        ) || '">' || core.get_page_name(in_app_id => x.master_app_id, in_page_id => 980) || '</a>' AS attribute01,
        --
        '/0.980/' AS order#
    FROM x
    UNION ALL
    --
    SELECT
        800     AS app_id,
        9995    AS page_id,
        1       AS lvl,
        --
        '<a href="' || APEX_PAGE.GET_URL (
            p_application   => x.master_app_id,
            p_page          => 9995
        ) || '">' || core.get_page_name(in_app_id => x.master_app_id, in_page_id => 9995) || '</a>' AS attribute01,
        --
        '/0.999/' AS order#
    FROM x
)
--
SELECT
    p.app_id,
    p.page_id,
    p.lvl,
    p.attribute01,
    --
    NULL AS attribute02,
    NULL AS attribute03,
    NULL AS attribute04,
    NULL AS attribute05,
    NULL AS attribute06,
    NULL AS attribute07,
    NULL AS attribute08,
    NULL AS attribute09,
    NULL AS attribute10,
    --
    p.order#
    --
FROM public_pages p;
--
COMMENT ON TABLE app_navigation_public_v IS '';

