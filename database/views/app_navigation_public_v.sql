CREATE OR REPLACE FORCE VIEW app_navigation_public_v AS
WITH curr AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()       AS app_id,
        core.get_page_id()      AS page_id,
        800                     AS master_app_id
    FROM DUAL
    WHERE UPPER(core.get_user_id()) IN ('NOBODY', USER)
)
--
SELECT
    NULL AS app_id,                   -- some extra columns for FE
    NULL AS page_id,
    NULL AS parent_id,
    NULL AS page_root_id,
    NULL AS auth_scheme,
    NULL AS procedure_name,
    NULL AS label__,
    --
    1 AS lvl,
    --
    '<img src="#APP_FILES#icons/app-icon-192.png?v=#APP_VERSION#" alt="" style="width: 2rem; height: 2rem; margin: -0.5rem -0.5rem;" />' AS label,
    --
    APEX_PAGE.GET_URL (
        p_application   => curr.master_app_id,
        p_page          => 9999,
        p_session       => 0
    ) AS target,
    --
    NULL AS is_current_list_entry,
    NULL AS image,
    NULL AS image_attribute,
    NULL AS image_alt_attribute,
    --
    '" style="background: #222;' AS attribute01,  -- <li class="...">
    --
    NULL AS attribute02,              -- <li>...<a>
    NULL AS attribute03,              -- <a class="..."
    NULL AS attribute04,              -- <a title="..."
    NULL AS attribute05,              -- <a ...> // javascript onclick
    NULL AS attribute06,              -- <a>... #TEXT</a>
    NULL AS attribute07,              -- <a>#TEXT ...</a>
    NULL AS attribute08,              -- </a>...
    NULL AS attribute09,              -- <ul class="...">
    NULL AS attribute10,
    --
    '000' AS order#
    --
FROM curr
UNION ALL
--
SELECT
    NULL AS app_id,                   -- left/right splitter
    NULL AS page_id,
    NULL AS parent_id,
    NULL AS page_root_id,
    NULL AS auth_scheme,
    NULL AS procedure_name,
    NULL AS label__,
    --
    1 AS lvl,
    --
    '</span></a></li></ul>'   || CHR(10) ||
    '<ul class="EMPTY"></ul>' || CHR(10) ||
    '<ul class="RIGHT"><li style="display: none;"><a href=""><span>'  -- a trick to split nav menu to left and right
        AS label,
    --
    NULL AS target,
    NULL AS is_current_list_entry,
    NULL AS image,
    NULL AS image_attribute,
    NULL AS image_alt_attribute,
    --
    'HIDDEN'                    AS attribute01,
    NULL                        AS attribute02,
    '" style="display: none;'   AS attribute03,
    --
    NULL AS attribute04,
    NULL AS attribute05,
    NULL AS attribute06,
    NULL AS attribute07,
    NULL AS attribute08,
    NULL AS attribute09,
    NULL AS attribute10,
    --
    '666' AS order#
    --
FROM curr
UNION ALL
--
SELECT
    800  AS app_id,                   -- some extra columns for FE
    980  AS page_id,
    NULL AS parent_id,
    NULL AS page_root_id,
    NULL AS auth_scheme,
    NULL AS procedure_name,
    NULL AS label__,
    --
    1 AS lvl,
    --
    core.get_page_name(in_app_id => curr.master_app_id, in_page_id => 980) AS label,
    --
    APEX_PAGE.GET_URL (
        p_application   => curr.master_app_id,
        p_page          => 980
    ) AS target,
    --
    NULL AS is_current_list_entry,
    NULL AS image,
    NULL AS image_attribute,
    NULL AS image_alt_attribute,
    NULL AS attribute01,              -- <li class="...">
    NULL AS attribute02,              -- <li>...<a>
    NULL AS attribute03,              -- <a class="..."
    NULL AS attribute04,              -- <a title="..."
    NULL AS attribute05,              -- <a ...> // javascript onclick
    NULL AS attribute06,              -- <a>... #TEXT</a>
    NULL AS attribute07,              -- <a>#TEXT ...</a>
    NULL AS attribute08,              -- </a>...
    NULL AS attribute09,              -- <ul class="...">
    NULL AS attribute10,
    --
    '980' AS order#
    --
FROM curr
UNION ALL
--
SELECT
    800  AS app_id,
    9995 AS page_id,
    NULL AS parent_id,
    NULL AS page_root_id,
    NULL AS auth_scheme,
    NULL AS procedure_name,
    NULL AS label__,
    --
    1 AS lvl,
    --
    core.get_page_name(in_app_id => curr.master_app_id, in_page_id => 9995) AS label,
    --
    APEX_PAGE.GET_URL (
        p_application   => curr.master_app_id,
        p_page          => 9995
    ) AS target,
    --
    NULL AS is_current_list_entry,
    NULL AS image,
    NULL AS image_attribute,
    NULL AS image_alt_attribute,
    NULL AS attribute01,              -- <li class="...">
    NULL AS attribute02,              -- <li>...<a>
    NULL AS attribute03,              -- <a class="..."
    NULL AS attribute04,              -- <a title="..."
    NULL AS attribute05,              -- <a ...> // javascript onclick
    NULL AS attribute06,              -- <a>... #TEXT</a>
    NULL AS attribute07,              -- <a>#TEXT ...</a>
    NULL AS attribute08,              -- </a>...
    NULL AS attribute09,              -- <ul class="...">
    NULL AS attribute10,
    --
    '999' AS order#
    --
FROM curr;
--
COMMENT ON TABLE app_navigation_public_v IS '';

