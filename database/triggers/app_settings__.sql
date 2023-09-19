CREATE OR REPLACE TRIGGER app_settings__
FOR UPDATE OR INSERT OR DELETE ON app_settings
COMPOUND TRIGGER

    c_table_name CONSTANT VARCHAR2(128) := 'APP_SETTINGS';



    BEFORE EACH ROW IS
    BEGIN
        -- populate audit columns
        IF NOT DELETING THEN
            :NEW.updated_by := core.get_user_id();
            :NEW.updated_at := SYSDATE;
            --:NEW.created_by := COALESCE(:NEW.created_by, :NEW.updated_by);
            --:NEW.created_at := COALESCE(:NEW.created_at, :NEW.updated_at);

            -- check name
            :NEW.setting_name := UPPER(:NEW.setting_name);
            --
            IF NOT REGEXP_LIKE(:NEW.setting_name, '^[A-Z0-9_]{1,27}$') THEN
                core.raise_error('WRONG_NAME', :NEW.setting_name);
            END IF;

            -- check date value
            IF :NEW.is_date = 'Y' THEN
                BEGIN
                    :NEW.setting_value := core.get_date(core.get_date(:NEW.setting_value));
                EXCEPTION
                WHEN OTHERS THEN
                    core.raise_error('WRONG_DATE', :NEW.setting_value);
                END;
            END IF;

            -- check numeric value
            IF :NEW.is_numeric = 'Y' THEN
                BEGIN
                    :NEW.setting_value := TO_NUMBER(REPLACE(:NEW.setting_value, ',', '.'));
                EXCEPTION
                WHEN OTHERS THEN
                    core.raise_error('WRONG_NUMBER', :NEW.setting_value);
                END;
            END IF;
        END IF;
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

