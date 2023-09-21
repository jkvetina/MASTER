CREATE OR REPLACE FORCE VIEW app_tracking_chart_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        core.get_app_id()                   AS app_id,
        core.get_number_item('$PAGE_ID')    AS page_id,
        core.get_item('$USER_ID')           AS user_id,
        core.get_number_item('$SESSION_ID') AS session_id,
        core.get_item('$METRIC')            AS metric,
        TRUNC(SYSDATE)                      AS today,
        app_tracking.get_offset()           AS day_offset,  -- to align with week days
        800                                 AS master_id,
        --
        NVL(m.color_name, 'COLOR_' || core.get_item('$METRIC')) AS color_name
        --
    FROM DUAL
    LEFT JOIN app_lov_tracking_metrics_v m
        ON m.id = core.get_item('$METRIC')
),
s AS (
    SELECT /*+ MATERIALIZE */
        p.page_id,
        p.page_name,
        p.page_alias,
        p.page_group,
        a.view_date,
        --
        CASE x.metric
            WHEN 'ACTIVITY'     THEN COUNT(a.page_id)
            WHEN 'USERS'        THEN COUNT(DISTINCT a.apex_user)
            WHEN 'SESSIONS'     THEN COUNT(DISTINCT a.apex_session_id)
            WHEN 'AVG_TIME'     THEN ROUND(AVG(a.elapsed_time), 2)
            WHEN 'MEDIAN_TIME'  THEN ROUND(MIN(a.elapsed_time), 2)
            WHEN 'MIN_TIME'     THEN ROUND(MIN(a.elapsed_time), 2)
            WHEN 'MAX_TIME'     THEN ROUND(MAX(a.elapsed_time), 2)
            END AS value
        --
    FROM app_lov_tracking_pages_v p
    CROSS JOIN x
    LEFT JOIN app_tracking_base_v a
        ON a.page_id        = p.page_id
    WHERE 1 = 1
        AND (x.page_id      = p.page_id OR NULLIF(x.page_id, 0) IS NULL)
    GROUP BY
        p.page_id,
        p.page_name,
        p.page_alias,
        p.page_group,
        a.view_date,
        x.metric,
        x.page_id
    HAVING (
        (x.page_id          = 0 AND COUNT(a.page_id) > 0)
        OR (p.page_id       = NULLIF(x.page_id, 0))
        OR x.page_id        IS NULL
    )
),
t AS (
    SELECT
        s.page_id,
        s.page_name,
        s.page_alias,
        s.page_group,
        --
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today      + day_offset THEN s.value END, 0)), 0) AS t00,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today -  1 + day_offset THEN s.value END, 0)), 0) AS t01,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today -  2 + day_offset THEN s.value END, 0)), 0) AS t02,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today -  3 + day_offset THEN s.value END, 0)), 0) AS t03,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today -  4 + day_offset THEN s.value END, 0)), 0) AS t04,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today -  5 + day_offset THEN s.value END, 0)), 0) AS t05,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today -  6 + day_offset THEN s.value END, 0)), 0) AS t06,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today -  7 + day_offset THEN s.value END, 0)), 0) AS t07,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today -  8 + day_offset THEN s.value END, 0)), 0) AS t08,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today -  9 + day_offset THEN s.value END, 0)), 0) AS t09,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 10 + day_offset THEN s.value END, 0)), 0) AS t10,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 11 + day_offset THEN s.value END, 0)), 0) AS t11,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 12 + day_offset THEN s.value END, 0)), 0) AS t12,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 13 + day_offset THEN s.value END, 0)), 0) AS t13,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 14 + day_offset THEN s.value END, 0)), 0) AS t14,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 15 + day_offset THEN s.value END, 0)), 0) AS t15,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 16 + day_offset THEN s.value END, 0)), 0) AS t16,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 17 + day_offset THEN s.value END, 0)), 0) AS t17,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 18 + day_offset THEN s.value END, 0)), 0) AS t18,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 19 + day_offset THEN s.value END, 0)), 0) AS t19,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 20 + day_offset THEN s.value END, 0)), 0) AS t20,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 21 + day_offset THEN s.value END, 0)), 0) AS t21,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 22 + day_offset THEN s.value END, 0)), 0) AS t22,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 23 + day_offset THEN s.value END, 0)), 0) AS t23,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 24 + day_offset THEN s.value END, 0)), 0) AS t24,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 25 + day_offset THEN s.value END, 0)), 0) AS t25,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 26 + day_offset THEN s.value END, 0)), 0) AS t26,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 27 + day_offset THEN s.value END, 0)), 0) AS t27,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 28 + day_offset THEN s.value END, 0)), 0) AS t28,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 29 + day_offset THEN s.value END, 0)), 0) AS t29,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 30 + day_offset THEN s.value END, 0)), 0) AS t30,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 31 + day_offset THEN s.value END, 0)), 0) AS t31,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 32 + day_offset THEN s.value END, 0)), 0) AS t32,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 33 + day_offset THEN s.value END, 0)), 0) AS t33,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 34 + day_offset THEN s.value END, 0)), 0) AS t34,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 35 + day_offset THEN s.value END, 0)), 0) AS t35,
        NULLIF(SUM(NVL(CASE WHEN s.view_date = x.today - 36 + day_offset THEN s.value END, 0)), 0) AS t36
    FROM s
    CROSS JOIN x
    WHERE s.page_id > 0
    GROUP BY
        s.page_id,
        s.page_name,
        s.page_alias,
        s.page_group
)
SELECT
    t.page_id,
    t.page_name,
    t.page_alias,
    t.page_group,
    --
    core.get_page_url (
        in_app_id       => x.app_id,
        in_page_id      => t.page_id,
        in_plain        => NULL
    ) AS page_link,
    --
    t.t00, t.t01, t.t02, t.t03, t.t04, t.t05, t.t06, t.t07, t.t08, t.t09,
    t.t10, t.t11, t.t12, t.t13, t.t14, t.t15, t.t16, t.t17, t.t18, t.t19,
    t.t20, t.t21, t.t22, t.t23, t.t24, t.t25, t.t26, t.t27, t.t28, t.t29,
    t.t30, t.t31, t.t32, t.t33, t.t34, t.t35, t.t36,
    --
    app.get_color(x.color_name, t.t00, in_app_id => x.master_id) AS t00_color,  app.get_color(x.color_name, t.t00, 'Y', in_app_id => x.master_id) AS t00_text,
    app.get_color(x.color_name, t.t01, in_app_id => x.master_id) AS t01_color,  app.get_color(x.color_name, t.t01, 'Y', in_app_id => x.master_id) AS t01_text,
    app.get_color(x.color_name, t.t02, in_app_id => x.master_id) AS t02_color,  app.get_color(x.color_name, t.t02, 'Y', in_app_id => x.master_id) AS t02_text,
    app.get_color(x.color_name, t.t03, in_app_id => x.master_id) AS t03_color,  app.get_color(x.color_name, t.t03, 'Y', in_app_id => x.master_id) AS t03_text,
    app.get_color(x.color_name, t.t04, in_app_id => x.master_id) AS t04_color,  app.get_color(x.color_name, t.t04, 'Y', in_app_id => x.master_id) AS t04_text,
    app.get_color(x.color_name, t.t05, in_app_id => x.master_id) AS t05_color,  app.get_color(x.color_name, t.t05, 'Y', in_app_id => x.master_id) AS t05_text,
    app.get_color(x.color_name, t.t06, in_app_id => x.master_id) AS t06_color,  app.get_color(x.color_name, t.t06, 'Y', in_app_id => x.master_id) AS t06_text,
    app.get_color(x.color_name, t.t07, in_app_id => x.master_id) AS t07_color,  app.get_color(x.color_name, t.t07, 'Y', in_app_id => x.master_id) AS t07_text,
    app.get_color(x.color_name, t.t08, in_app_id => x.master_id) AS t08_color,  app.get_color(x.color_name, t.t08, 'Y', in_app_id => x.master_id) AS t08_text,
    app.get_color(x.color_name, t.t09, in_app_id => x.master_id) AS t09_color,  app.get_color(x.color_name, t.t09, 'Y', in_app_id => x.master_id) AS t09_text,
    app.get_color(x.color_name, t.t10, in_app_id => x.master_id) AS t10_color,  app.get_color(x.color_name, t.t10, 'Y', in_app_id => x.master_id) AS t10_text,
    app.get_color(x.color_name, t.t11, in_app_id => x.master_id) AS t11_color,  app.get_color(x.color_name, t.t11, 'Y', in_app_id => x.master_id) AS t11_text,
    app.get_color(x.color_name, t.t12, in_app_id => x.master_id) AS t12_color,  app.get_color(x.color_name, t.t12, 'Y', in_app_id => x.master_id) AS t12_text,
    app.get_color(x.color_name, t.t13, in_app_id => x.master_id) AS t13_color,  app.get_color(x.color_name, t.t13, 'Y', in_app_id => x.master_id) AS t13_text,
    app.get_color(x.color_name, t.t14, in_app_id => x.master_id) AS t14_color,  app.get_color(x.color_name, t.t14, 'Y', in_app_id => x.master_id) AS t14_text,
    app.get_color(x.color_name, t.t15, in_app_id => x.master_id) AS t15_color,  app.get_color(x.color_name, t.t15, 'Y', in_app_id => x.master_id) AS t15_text,
    app.get_color(x.color_name, t.t16, in_app_id => x.master_id) AS t16_color,  app.get_color(x.color_name, t.t16, 'Y', in_app_id => x.master_id) AS t16_text,
    app.get_color(x.color_name, t.t17, in_app_id => x.master_id) AS t17_color,  app.get_color(x.color_name, t.t17, 'Y', in_app_id => x.master_id) AS t17_text,
    app.get_color(x.color_name, t.t18, in_app_id => x.master_id) AS t18_color,  app.get_color(x.color_name, t.t18, 'Y', in_app_id => x.master_id) AS t18_text,
    app.get_color(x.color_name, t.t19, in_app_id => x.master_id) AS t19_color,  app.get_color(x.color_name, t.t19, 'Y', in_app_id => x.master_id) AS t19_text,
    app.get_color(x.color_name, t.t20, in_app_id => x.master_id) AS t20_color,  app.get_color(x.color_name, t.t20, 'Y', in_app_id => x.master_id) AS t20_text,
    app.get_color(x.color_name, t.t21, in_app_id => x.master_id) AS t21_color,  app.get_color(x.color_name, t.t21, 'Y', in_app_id => x.master_id) AS t21_text,
    app.get_color(x.color_name, t.t22, in_app_id => x.master_id) AS t22_color,  app.get_color(x.color_name, t.t22, 'Y', in_app_id => x.master_id) AS t22_text,
    app.get_color(x.color_name, t.t23, in_app_id => x.master_id) AS t23_color,  app.get_color(x.color_name, t.t23, 'Y', in_app_id => x.master_id) AS t23_text,
    app.get_color(x.color_name, t.t24, in_app_id => x.master_id) AS t24_color,  app.get_color(x.color_name, t.t24, 'Y', in_app_id => x.master_id) AS t24_text,
    app.get_color(x.color_name, t.t25, in_app_id => x.master_id) AS t25_color,  app.get_color(x.color_name, t.t25, 'Y', in_app_id => x.master_id) AS t25_text,
    app.get_color(x.color_name, t.t26, in_app_id => x.master_id) AS t26_color,  app.get_color(x.color_name, t.t26, 'Y', in_app_id => x.master_id) AS t26_text,
    app.get_color(x.color_name, t.t27, in_app_id => x.master_id) AS t27_color,  app.get_color(x.color_name, t.t27, 'Y', in_app_id => x.master_id) AS t27_text,
    app.get_color(x.color_name, t.t28, in_app_id => x.master_id) AS t28_color,  app.get_color(x.color_name, t.t28, 'Y', in_app_id => x.master_id) AS t28_text,
    app.get_color(x.color_name, t.t29, in_app_id => x.master_id) AS t29_color,  app.get_color(x.color_name, t.t29, 'Y', in_app_id => x.master_id) AS t29_text,
    app.get_color(x.color_name, t.t30, in_app_id => x.master_id) AS t30_color,  app.get_color(x.color_name, t.t30, 'Y', in_app_id => x.master_id) AS t30_text,
    app.get_color(x.color_name, t.t31, in_app_id => x.master_id) AS t31_color,  app.get_color(x.color_name, t.t31, 'Y', in_app_id => x.master_id) AS t31_text,
    app.get_color(x.color_name, t.t32, in_app_id => x.master_id) AS t32_color,  app.get_color(x.color_name, t.t32, 'Y', in_app_id => x.master_id) AS t32_text,
    app.get_color(x.color_name, t.t33, in_app_id => x.master_id) AS t33_color,  app.get_color(x.color_name, t.t33, 'Y', in_app_id => x.master_id) AS t33_text,
    app.get_color(x.color_name, t.t34, in_app_id => x.master_id) AS t34_color,  app.get_color(x.color_name, t.t34, 'Y', in_app_id => x.master_id) AS t34_text,
    app.get_color(x.color_name, t.t35, in_app_id => x.master_id) AS t35_color,  app.get_color(x.color_name, t.t35, 'Y', in_app_id => x.master_id) AS t35_text,
    app.get_color(x.color_name, t.t36, in_app_id => x.master_id) AS t36_color,  app.get_color(x.color_name, t.t36, 'Y', in_app_id => x.master_id) AS t36_text
FROM t
CROSS JOIN x;
--
COMMENT ON TABLE app_tracking_chart_v IS '';

