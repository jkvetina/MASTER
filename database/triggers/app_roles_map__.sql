CREATE OR REPLACE TRIGGER app_roles_map__
FOR UPDATE OR INSERT OR DELETE ON app_roles_map
COMPOUND TRIGGER

    c_table_name CONSTANT VARCHAR2(128) := 'APP_ROLES_MAP';



    BEFORE EACH ROW IS
    BEGIN
        -- populate audit columns
        IF NOT DELETING THEN
            :NEW.updated_by := core.get_user_id();
            :NEW.updated_at := SYSDATE;
            --:NEW.created_by := COALESCE(:NEW.created_by, :NEW.updated_by);
            --:NEW.created_at := COALESCE(:NEW.created_at, :NEW.updated_at);
        END IF;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error(c_table_name || '_UPSERT_FAILED');
    END BEFORE EACH ROW;



    AFTER STATEMENT IS
    BEGIN
        NULL;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error(c_table_name || '_FOLLOWUP_FAILED');
    END AFTER STATEMENT;

END;
/

