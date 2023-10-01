CREATE OR REPLACE TRIGGER app_user_requests__
FOR UPDATE OR INSERT OR DELETE ON app_user_requests
COMPOUND TRIGGER

    c_table_name CONSTANT VARCHAR2(128) := 'APP_USER_REQUESTS';



    BEFORE EACH ROW IS
    BEGIN
        -- populate audit columns
        IF NOT DELETING THEN
            :NEW.user_id    := NVL(:NEW.user_id, :NEW.user_mail);
            :NEW.created_by := core.get_user_id();
            :NEW.created_at := SYSDATE;
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

