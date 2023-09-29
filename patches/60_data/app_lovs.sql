BEGIN
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- MERGE ' || UPPER('app_lovs'));
    DBMS_OUTPUT.PUT_LINE('--');
END;
/
--
DELETE FROM app_lovs
WHERE app_id = 800;
--
MERGE INTO app_lovs t
USING (
    SELECT 800 AS app_id, 'ACTIVITY' AS lov_group, 'METRIC' AS lov_id, 'Metric' AS lov_name, 'ACTIVITY' AS status_id, 'Activity' AS status_name, 'COLOR_ACTIVITY' AS status_value, 10 AS order#, NULL AS treshold, NULL AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY' AS lov_group, 'METRIC' AS lov_id, NULL AS lov_name, 'AVG_TIME' AS status_id, 'Average Time' AS status_name, 'COLOR_TIME' AS status_value, 40 AS order#, NULL AS treshold, NULL AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY' AS lov_group, 'METRIC' AS lov_id, NULL AS lov_name, 'MAX_TIME' AS status_id, 'Max Time' AS status_name, 'COLOR_TIME' AS status_value, 70 AS order#, NULL AS treshold, NULL AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY' AS lov_group, 'METRIC' AS lov_id, NULL AS lov_name, 'MEDIAN_TIME' AS status_id, 'Median Time' AS status_name, 'COLOR_TIME' AS status_value, 50 AS order#, NULL AS treshold, NULL AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY' AS lov_group, 'METRIC' AS lov_id, NULL AS lov_name, 'MIN_TIME' AS status_id, 'Min Time' AS status_name, 'COLOR_TIME' AS status_value, 60 AS order#, NULL AS treshold, NULL AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY' AS lov_group, 'METRIC' AS lov_id, NULL AS lov_name, 'SESSIONS' AS status_id, 'Sessions' AS status_name, 'COLOR_ACTIVITY' AS status_value, 30 AS order#, NULL AS treshold, NULL AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY' AS lov_group, 'METRIC' AS lov_id, NULL AS lov_name, 'USERS' AS status_id, 'Users' AS status_name, 'COLOR_USERS' AS status_value, 20 AS order#, NULL AS treshold, NULL AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_ACTIVITY' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 100 AS treshold, '#b64201' AS color_bg, '#ffffff' AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_ACTIVITY' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 50 AS treshold, '#db8200' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_ACTIVITY' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 20 AS treshold, '#f3b800' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_ACTIVITY' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 10 AS treshold, '#9e8e01' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_ACTIVITY' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 0 AS treshold, '#508104' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_TIME' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 1.5 AS treshold, '#db8200' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_TIME' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 1 AS treshold, '#f3b800' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_TIME' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 2 AS treshold, '#b64201' AS color_bg, '#ffffff' AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_TIME' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 0.5 AS treshold, '#9e8e01' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_TIME' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 0 AS treshold, '#508104' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 2 AS treshold, '#90c7ca' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 1 AS treshold, '#4e7779' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 5 AS treshold, '#c3ba9b' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 10 AS treshold, '#7e6d53' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS_ALT1' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 5 AS treshold, '#a2885e' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS_ALT1' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 2 AS treshold, '#8eb3aa' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS_ALT1' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 3 AS treshold, '#e9cf87' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS_ALT1' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 1 AS treshold, '#235f83' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS_ALT2' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 10 AS treshold, '#ac7e62' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS_ALT2' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 1 AS treshold, '#bbcfd7' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS_ALT2' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 2 AS treshold, '#d2c8bc' AS color_bg, NULL AS color_text FROM DUAL UNION ALL
    SELECT 800 AS app_id, 'ACTIVITY_COLOR' AS lov_group, 'COLOR_USERS_ALT2' AS lov_id, NULL AS lov_name, NULL AS status_id, NULL AS status_name, NULL AS status_value, NULL AS order#, 5 AS treshold, '#ba9a88' AS color_bg, NULL AS color_text FROM DUAL
) s
ON (
    t.app_id = s.app_id
    AND t.app_id = s.app_id
    AND t.lov_group = s.lov_group
    AND t.lov_id = s.lov_id
    AND t.lov_id = s.lov_id
    AND t.status_id = s.status_id
    AND t.status_id = s.status_id
    AND t.treshold = s.treshold
    AND t.treshold = s.treshold
)
--WHEN MATCHED THEN
--    UPDATE SET
--        t.lov_name = s.lov_name,
--        t.status_name = s.status_name,
--        t.status_value = s.status_value,
--        t.order# = s.order#,
--        t.color_bg = s.color_bg,
--        t.color_text = s.color_text
WHEN NOT MATCHED THEN
    INSERT (
        t.app_id,
        t.lov_group,
        t.lov_id,
        t.lov_name,
        t.status_id,
        t.status_name,
        t.status_value,
        t.order#,
        t.treshold,
        t.color_bg,
        t.color_text
    )
    VALUES (
        s.app_id,
        s.lov_group,
        s.lov_id,
        s.lov_name,
        s.status_id,
        s.status_name,
        s.status_value,
        s.order#,
        s.treshold,
        s.color_bg,
        s.color_text
    );
