CREATE OR REPLACE TRIGGER app_navigation__
FOR UPDATE OR INSERT OR DELETE ON app_navigation
COMPOUND TRIGGER

    c_table_name CONSTANT VARCHAR2(128) := 'APP_NAVIGATION';



    BEFORE EACH ROW IS
    BEGIN
        -- make sure application exists
        IF INSERTING THEN
            BEGIN
                INSERT INTO app_applications (app_id)
                VALUES (
                    :NEW.app_id
                );
            EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                NULL;
            END;
        END IF;

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
        core.create_job (
            in_job_name     => 'APP_NAVIGATION_MV_?',   -- ? = generate unique postfix
            in_statement    => 'BEGIN core.refresh_mviews(''APP_NAV%_MV''); END;'
        );
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error(c_table_name || '_FOLLOWUP_FAILED');
    END AFTER STATEMENT;

END;
/

