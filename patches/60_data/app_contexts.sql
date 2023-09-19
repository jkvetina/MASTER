BEGIN
    DBMS_OUTPUT.PUT_LINE('--');
    DBMS_OUTPUT.PUT_LINE('-- MERGE ' || UPPER('app_contexts'));
    DBMS_OUTPUT.PUT_LINE('--');
END;
/
--
DELETE FROM app_contexts
WHERE app_id = 800;
--
MERGE INTO app_contexts t
USING (
    SELECT 800 AS app_id, '-' AS context_id, '-' AS context_name, 'DEFAULT' AS context_group, 'Default/no context' AS context_desc, 0 AS order# FROM DUAL
) s
ON (
    t.app_id = s.app_id
    AND t.context_id = s.context_id
)
--WHEN MATCHED THEN
--    UPDATE SET
--        t.context_name = s.context_name,
--        t.context_group = s.context_group,
--        t.context_desc = s.context_desc,
--        t.order# = s.order#
WHEN NOT MATCHED THEN
    INSERT (
        t.app_id,
        t.context_id,
        t.context_name,
        t.context_group,
        t.context_desc,
        t.order#
    )
    VALUES (
        s.app_id,
        s.context_id,
        s.context_name,
        s.context_group,
        s.context_desc,
        s.order#
    );
