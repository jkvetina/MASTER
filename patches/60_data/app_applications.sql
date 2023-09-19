BEGIN
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- MERGE ' || UPPER('app_applications'));
    DBMS_OUTPUT.PUT_LINE('--');
END;
/
--
DELETE FROM app_applications
WHERE app_id = 800;
--
MERGE INTO app_applications t
USING (
    SELECT 800 AS app_id, 'Y' AS is_active FROM DUAL
) s
ON (
    t.app_id = s.app_id
)
--WHEN MATCHED THEN
--    UPDATE SET
--        t.is_active = s.is_active
WHEN NOT MATCHED THEN
    INSERT (
        t.app_id,
        t.is_active
    )
    VALUES (
        s.app_id,
        s.is_active
    );
