BEGIN
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- MERGE ' || UPPER('app_settings'));
    DBMS_OUTPUT.PUT_LINE('--');
END;
/
--
DELETE FROM app_settings
WHERE app_id = 800;
--
MERGE INTO app_settings t
USING (
    SELECT 800 AS app_id, '-' AS context_id, 'TEST' AS setting_name, 'VALUE' AS setting_value, 'TEST' AS setting_group, 'DESC' AS setting_desc, NULL AS is_numeric, NULL AS is_date, NULL AS is_private FROM DUAL
) s
ON (
    t.app_id = s.app_id
    AND t.context_id = s.context_id
    AND t.setting_name = s.setting_name
)
--WHEN MATCHED THEN
--    UPDATE SET
--        t.setting_value = s.setting_value,
--        t.setting_group = s.setting_group,
--        t.setting_desc = s.setting_desc,
--        t.is_numeric = s.is_numeric,
--        t.is_date = s.is_date,
--        t.is_private = s.is_private
WHEN NOT MATCHED THEN
    INSERT (
        t.app_id,
        t.context_id,
        t.setting_name,
        t.setting_value,
        t.setting_group,
        t.setting_desc,
        t.is_numeric,
        t.is_date,
        t.is_private
    )
    VALUES (
        s.app_id,
        s.context_id,
        s.setting_name,
        s.setting_value,
        s.setting_group,
        s.setting_desc,
        s.is_numeric,
        s.is_date,
        s.is_private
    );
