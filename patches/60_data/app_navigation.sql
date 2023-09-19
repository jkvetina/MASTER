BEGIN
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- MERGE ' || UPPER('app_navigation'));
    DBMS_OUTPUT.PUT_LINE('--');
END;
/
--
DELETE FROM app_navigation
WHERE app_id = 800;
--
MERGE INTO app_navigation t
USING (
    SELECT 800 AS app_id, 0 AS page_id, NULL AS parent_id, NULL AS is_hidden, NULL AS is_reset, 666 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 100 AS page_id, NULL AS parent_id, NULL AS is_hidden, NULL AS is_reset, 0 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 800 AS page_id, NULL AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 800 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 810 AS page_id, 800 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 10 AS order#, 2 AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 815 AS page_id, 810 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 10 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 820 AS page_id, 800 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 20 AS order#, 2 AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 825 AS page_id, 820 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 10 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 830 AS page_id, 820 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 20 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 835 AS page_id, 820 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 30 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 840 AS page_id, 820 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 40 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 850 AS page_id, 800 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 20 AS order#, 3 AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 860 AS page_id, 800 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 20 AS order#, 3 AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 862 AS page_id, 860 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 20 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 865 AS page_id, 800 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 10 AS order#, 3 AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 880 AS page_id, 800 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 10 AS order#, 1 AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 885 AS page_id, 880 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 10 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 888 AS page_id, 880 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 20 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 890 AS page_id, 880 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 30 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 895 AS page_id, 880 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 40 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 900 AS page_id, NULL AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 990 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 980 AS page_id, NULL AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 980 AS order#, NULL AS col_id FROM DUAL UNION ALL
    SELECT 800 AS app_id, 9999 AS page_id, 900 AS parent_id, NULL AS is_hidden, NULL AS is_reset, 999 AS order#, NULL AS col_id FROM DUAL
) s
ON (
    t.app_id = s.app_id
    AND t.page_id = s.page_id
)
--WHEN MATCHED THEN
--    UPDATE SET
--        t.parent_id = s.parent_id,
--        t.is_hidden = s.is_hidden,
--        t.is_reset = s.is_reset,
--        t.order# = s.order#,
--        t.col_id = s.col_id
WHEN NOT MATCHED THEN
    INSERT (
        t.app_id,
        t.page_id,
        t.parent_id,
        t.is_hidden,
        t.is_reset,
        t.order#,
        t.col_id
    )
    VALUES (
        s.app_id,
        s.page_id,
        s.parent_id,
        s.is_hidden,
        s.is_reset,
        s.order#,
        s.col_id
    );
