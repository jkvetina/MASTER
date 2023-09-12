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
    SELECT 800 AS app_id, 100 AS page_id, NULL AS parent_id, NULL AS is_hidden, NULL AS is_reset, 0 AS order# FROM DUAL UNION ALL
    SELECT 800 AS app_id, 800 AS page_id, NULL AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 800 AS order# FROM DUAL UNION ALL
    SELECT 800 AS app_id, 810 AS page_id, 800 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 10 AS order# FROM DUAL UNION ALL
    SELECT 800 AS app_id, 815 AS page_id, 810 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 10 AS order# FROM DUAL UNION ALL
    SELECT 800 AS app_id, 820 AS page_id, 800 AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 20 AS order# FROM DUAL UNION ALL
    SELECT 800 AS app_id, 900 AS page_id, NULL AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 990 AS order# FROM DUAL UNION ALL
    SELECT 800 AS app_id, 980 AS page_id, NULL AS parent_id, NULL AS is_hidden, 'Y' AS is_reset, 980 AS order# FROM DUAL UNION ALL
    SELECT 800 AS app_id, 9999 AS page_id, 900 AS parent_id, NULL AS is_hidden, NULL AS is_reset, 999 AS order# FROM DUAL
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
--        t.order# = s.order#
WHEN NOT MATCHED THEN
    INSERT (
        t.app_id,
        t.page_id,
        t.parent_id,
        t.is_hidden,
        t.is_reset,
        t.order#
    )
    VALUES (
        s.app_id,
        s.page_id,
        s.parent_id,
        s.is_hidden,
        s.is_reset,
        s.order#
    );
