CREATE OR REPLACE TRIGGER app_users__
FOR UPDATE OR INSERT OR DELETE ON app_users
COMPOUND TRIGGER

    c_table_name CONSTANT VARCHAR2(128) := 'APP_USERS';



    BEFORE EACH ROW IS
    BEGIN
        -- populate audit columns
        IF NOT DELETING THEN
            :NEW.updated_by := core.get_user_id();
            :NEW.updated_at := SYSDATE;
            :NEW.created_by := COALESCE(:NEW.created_by, :NEW.updated_by);
            :NEW.created_at := COALESCE(:NEW.created_at, :NEW.updated_at);
            --
            :NEW.user_mail  := LOWER(:NEW.user_mail);
        END IF;

        -- delete related rows
        IF DELETING THEN
            DELETE FROM app_users_map   WHERE user_id = :OLD.user_id;
            DELETE FROM app_roles_map   WHERE user_id = :OLD.user_id;
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

