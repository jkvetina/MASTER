CREATE OR REPLACE PACKAGE BODY app_auth AS

    PROCEDURE after_auth
    AS
        rec                 app_users%ROWTYPE;
    BEGIN
        -- convert email address to the login if needed
        BEGIN
            SELECT u.* INTO rec
            FROM app_users u
            WHERE (
                u.user_mail     = LOWER(SYS_CONTEXT('APEX$SESSION', 'APP_USER'))
                OR u.user_id    = UPPER(SYS_CONTEXT('APEX$SESSION', 'APP_USER'))
            );

            -- check if account is active
            IF rec.is_active IS NULL THEN
                core.log_error('ACCOUNT_DISABLED');
                core.redirect(
                    in_page_id      => 9999,
                    in_names        => 'P9999_ERROR',
                    in_values       => 'ACCOUNT_DISABLED'
                );
            END IF;

            -- change user_mail to user_id
            IF rec.user_id != NVL(rec.user_mail, '-') THEN
                APEX_CUSTOM_AUTH.SET_USER (
                    p_user => rec.user_id
                );
            END IF;

            -- update account
            rec.updated_by      := core.get_user_id();
            rec.updated_at      := SYSDATE;
            --
            UPDATE app_users u
            SET u.updated_by    = rec.updated_by,
                u.updated_at    = rec.updated_at
            WHERE u.user_id     = rec.user_id;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            core.log_error('INVALID_USER');
            core.redirect(
                in_page_id      => 9999,
                in_names        => 'P9999_ERROR',
                in_values       => 'INVALID_USER'
            );
        END;

        -- setup format strings for APEX
        core.set_item('G_FORMAT_DATE',              core.c_format_date);
        core.set_item('G_FORMAT_DATE_TIME',         core.c_format_date_time);
        core.set_item('G_FORMAT_DATE_SHORT',        core.c_format_date_short);
        core.set_item('G_FORMAT_TIME',              core.c_format_time);
        core.set_item('G_FORMAT_TIME_SHORT',        core.c_format_time_short);
        core.set_item('G_FORMAT_NUMBER',            core.c_format_number);
        core.set_item('G_FORMAT_NUMBER_CURRENCY',   core.c_format_number_currency);
        core.set_item('G_FORMAT_INTEGER',           core.c_format_integer);
        core.set_item('G_FORMAT_INTEGER_CURRENCY',  core.c_format_integer_currency);
        --
        core.set_item(app.global_env,               SUBSTR(SYS_CONTEXT('USERENV', 'DB_NAME'), INSTR(SYS_CONTEXT('USERENV', 'DB_NAME'), '_') + 1));
        core.set_item(app.global_workspace,         core.get_app_workspace());
        --
        FOR c IN (
            SELECT
                COALESCE(u.user_name, u.user_mail) AS user_name,
                COALESCE(u.user_nickname, SUBSTR(u.user_name, 1, INSTR(u.user_name, ' ') - 1)) AS first_name
            FROM app_users u
            WHERE u.user_id = core.get_user_id()
        ) LOOP
            core.set_item(app.global_user_name,         c.user_name);
            core.set_item(app.global_user_first_name,   c.first_name);
        END LOOP;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN APEX_APPLICATION.E_STOP_APEX_ENGINE THEN
        NULL;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE request_account (
        in_user_mail        app_user_requests.user_mail%TYPE,
        in_user_name        app_user_requests.user_name%TYPE,
        in_user_notes       app_user_requests.user_notes%TYPE,
        in_agreement        app_user_requests.is_agreement%TYPE
    )
    AS
        rec                 app_user_requests%ROWTYPE;
    BEGIN
        rec.user_name       := in_user_name;
        rec.user_mail       := in_user_mail;
        rec.user_notes      := in_user_notes;
        rec.is_agreement    := in_agreement;
        rec.created_by      := USER;
        rec.created_at      := SYSDATE;

        -- check for valid email
        IF rec.user_mail NOT LIKE '%@%.%' THEN      -- @TODO: room for improvement
            core.raise_error('INVALID_EMAIL');
        END IF;

        -- check existing users
        FOR c IN (
            SELECT 1
            FROM app_users t
            WHERE (
                t.user_mail     = rec.user_mail
                OR t.user_id    = rec.user_mail
            )
        ) LOOP
            core.raise_error('ACCOUNT_REQUEST_INVALID');    -- account already exists
        END LOOP;

        -- check existing requests
        BEGIN
            INSERT INTO app_user_requests VALUES rec;
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            core.raise_error('ACCOUNT_REQUEST_EXISTS');
        END;

        -- notify administrators
        FOR c IN (
            SELECT u.user_id
            FROM app_users u
            JOIN app_users_map t
                ON t.app_id         = core.get_app_id(in_dont_override => 'Y')
                AND t.user_id       = u.user_id
            WHERE u.is_active       = 'Y'
                AND u.is_admin      = 'Y'
        ) LOOP
            core.send_push_notification (
                in_title        => 'New account requested',
                in_message      => 'User: ' || rec.user_mail,
                in_user_id      => c.user_id,
                in_asap         => TRUE
            );
        END LOOP;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE create_user (
        in_user_id          app_users.user_id%TYPE,
        in_user_name        app_users.user_name%TYPE        := NULL,
        in_user_mail        app_users.user_mail%TYPE        := NULL
    )
    AS
        rec                 app_users%ROWTYPE;
    BEGIN
        rec.user_id         := COALESCE(in_user_id, core.get_user_id());
        rec.user_name       := in_user_name;
        rec.user_mail       := COALESCE(in_user_mail, core.get_user_id());
        rec.is_active       := 'Y';
        rec.updated_by      := USER;
        rec.updated_at      := SYSDATE;
        --
        IF rec.user_mail NOT LIKE '%@%' THEN
            core.raise_error('INVALID_EMAIL');
        END IF;
        --
        BEGIN
            INSERT INTO app_users VALUES rec;
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            core.raise_error('USER_EXISTS');
        END;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE update_user (
        in_user_id          app_users.user_id%TYPE,
        in_user_name        app_users.user_name%TYPE        := NULL,
        in_user_mail        app_users.user_mail%TYPE        := NULL,
        in_user_nickname    app_users.user_nickname%TYPE    := NULL,
        in_user_title       app_users.user_title%TYPE       := NULL,
        in_user_about       app_users.user_about%TYPE       := NULL
    )
    AS
    BEGIN
        UPDATE app_users u
        SET u.user_name         = in_user_name,
            u.user_mail         = in_user_mail,
            u.user_nickname     = in_user_nickname,
            u.user_title        = in_user_title,
            u.user_about        = in_user_about
        WHERE u.user_id         = in_user_id;
        --
        core.set_item('P0_SUCCESS_MESSAGE', CASE WHEN SQL%ROWCOUNT = 1 THEN 'Profile updated.' END);
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE update_user_avatar (
        in_file_name        VARCHAR2
    )
    AS
    BEGIN
        FOR c IN (
            SELECT
                f.name,
                f.blob_content,
                f.mime_type
            FROM apex_application_temp_files f
            WHERE f.name = in_file_name
        ) LOOP
            --
            UPDATE app_users t
            SET t.avatar_blob   = c.blob_content,
                t.avatar_url    = 'avatar' || REGEXP_SUBSTR(c.name, '(\.[^\.])^', 1, 1, NULL, 1),  -- APEX_STRING_UTIL.GET_FILE_EXTENTION
                t.avatar_mime   = c.mime_type
            WHERE t.user_id     = core.get_user_id();
            --
            core.set_item('P0_SUCCESS_MESSAGE', CASE WHEN SQL%ROWCOUNT = 1 THEN 'Profile image updated.' END);
            --
        END LOOP;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION get_auth_function (
        in_app_id               app_pages.app_id%TYPE,
        in_auth_scheme          VARCHAR2
    )
    RETURN VARCHAR2
    RESULT_CACHE
    AS
        out_procedure   VARCHAR2(256);
    BEGIN
        BEGIN
            SELECT UPPER(REGEXP_SUBSTR(a.attribute_01, '\s([^(]+)', 1, 1, NULL, 1))
            INTO out_procedure
            FROM apex_application_authorization a
            WHERE a.application_id              = in_app_id
                AND a.authorization_scheme_name = in_auth_scheme;
            --
            SELECT t.object_name || '.' || t.procedure_name     -- verify that procedure exists
            INTO out_procedure
            FROM all_procedures t
            WHERE t.owner               = core.get_app_owner(in_app_id)
                AND t.object_name       = SUBSTR(out_procedure, 1, INSTR(out_procedure, '.') - 1)
                AND t.procedure_name    = SUBSTR(out_procedure,    INSTR(out_procedure, '.') + 1);
            --
            RETURN out_procedure;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
        END;
        --
        RETURN NULL;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION is_admin
    RETURN CHAR
    AS
        out_flag CHAR;
    BEGIN
        BEGIN
            SELECT 'Y'
            INTO out_flag
            FROM app_users u
            WHERE u.user_id         = core.get_user_id()
                AND u.is_active     = 'Y'
                AND u.is_admin      = 'Y';
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            BEGIN
                SELECT 'Y'
                INTO out_flag
                FROM app_users_map u
                WHERE u.app_id          = core.get_app_id()
                    AND u.user_id       = core.get_user_id()
                    AND u.is_active     = 'Y'
                    AND u.is_admin      = 'Y';
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL;
            END;
        END;
        --
        RETURN out_flag;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION is_user (
        in_app_id               app_roles_map.app_id%TYPE       := NULL,
        in_page_id              app_pages.page_id%TYPE          := NULL,
        in_user_id              app_roles_map.user_id%TYPE      := NULL,
        in_context_id           app_roles_map.context_id%TYPE   := NULL
    )
    RETURN CHAR
    AS
        out_flag CHAR;
    BEGIN
        IF app_auth.is_admin() = 'Y' THEN
            RETURN 'Y';
        END IF;
        --
        SELECT MAX('Y')
        INTO out_flag
        FROM app_auth_pages_v t
        WHERE t.user_id         = COALESCE(in_user_id,  core.get_user_id())
            AND t.app_id        = COALESCE(in_app_id,   core.get_app_id())
            AND t.page_id       = COALESCE(in_page_id,  core.get_page_id())
            AND (
                t.context_id    IS NULL
                OR t.context_id IN (in_context_id, SUBSTR(in_context_id, 1, INSTR(in_context_id, '|') - 1))
            );
        --
        RETURN out_flag;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION is_user_component (
        in_component_id         app_components.component_id%TYPE,
        in_component_type       app_components.component_type%TYPE,
        in_component_name       app_components.component_name%TYPE,
        in_action               CHAR,
        in_context_id           app_roles_map.context_id%TYPE   := NULL
    )
    RETURN CHAR
    AS
    BEGIN
        RETURN app_auth.is_user_component (
            in_app_id           => core.get_app_id(),
            in_user_id          => core.get_user_id(),
            in_page_id          => core.get_page_id(),
            in_context_id       => COALESCE(in_context_id, core.get_item(app.global_context_id)),
            in_component_id     => in_component_id,
            in_component_type   => in_component_type,
            in_component_name   => in_component_name,
            in_action           => in_action
        );
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION is_user_component (
        in_app_id               app_roles_map.app_id%TYPE,
        in_user_id              app_roles_map.user_id%TYPE,
        in_page_id              app_pages.page_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE,
        in_component_id         app_components.component_id%TYPE,
        in_component_type       app_components.component_type%TYPE,
        in_component_name       app_components.component_name%TYPE,
        in_action               CHAR
    )
    RETURN CHAR
    --RESULT_CACHE
    AS
        v_authorized            CHAR;
        v_authorized_row#       PLS_INTEGER;
    BEGIN
        -- check access to the component
        v_authorized_row# := $$PLSQL_LINE;

        -- check access to page component for users roles
        SELECT MAX('Y') INTO v_authorized
        FROM app_auth_components_v t
        WHERE t.user_id         = in_user_id
            AND t.app_id        = in_app_id
            AND t.component_id  = in_component_id;
        --
        -- @TODO: if this fails, we could evaluate IS_USER_U action on the related component
        -- so you can set IS_USER_U|D roles on grid columns
        --

        -- we can access page, we can access component
        IF v_authorized = 'Y' THEN
            v_authorized_row# := $$PLSQL_LINE;
            /*
            -- can we do requested operation too?
            IF in_action IS NOT NULL THEN
                v_authorized := NULL;
                --
                FOR c IN (
                    -- check if region is listed as grid and has valid auth setup
                    SELECT t.table_name
                    FROM app_auth_grids_v t
                    WHERE t.page_id         = in_page_id
                        AND t.region_id     = in_component_id
                        AND t.table_name    IS NOT NULL
                        AND t.auth_process  = 'Y'
                        AND (
                            (in_action = 'C' AND t.auth_c = 'Y') OR
                            (in_action = 'U' AND t.auth_u = 'Y') OR
                            (in_action = 'D' AND t.auth_d = 'Y')
                        )
                ) LOOP
                    -- check if current user is allowed to do requested action
                    v_authorized_row# := $$PLSQL_LINE;
                    IF app_auth.is_allowed_dml (
                        in_table_name       => c.table_name,
                        in_action           => in_action,
                        in_user_id          => in_user_id,
                        in_client_id        => in_client_id,
                        in_project_id       => in_project_id
                    )
                    THEN
                        v_authorized := 'Y';
                        EXIT;
                    END IF;
                END LOOP;
            END IF;
            */
        ELSE
            -- on failure add component to the list
            app_auth.discover_component (
                in_user_id          => in_user_id,
                in_page_id          => in_page_id,
                in_component_id     => in_component_id,
                in_component_type   => in_component_type,
                in_component_name   => in_component_name
            );
        END IF;
        --
        /*
            --core.log_warning();
            APEX_DEBUG.WARN (RTRIM(CASE WHEN v_authorized = 'Y' THEN 'IS_' ELSE 'NOT_' END || 'AUTHORIZED|IS_USER_' || in_action, '_')
                || ' #' || v_authorized_row#
                || ' |USER='     || in_user_id
                || ' |PAGE='     || in_page_id
                || ' |CLIENT='   || in_client_id
                || ' |PROJECT='  || in_project_id
                || CASE WHEN in_component_type IS NOT NULL
                    THEN ' |' || get_component_type(in_component_type) || '=' || in_component_id || '=' || in_component_name END
            );
        */
        --
        RETURN v_authorized;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION is_user_role (
        in_role_id              app_roles_map.role_id%TYPE,
        in_user_id              app_roles_map.user_id%TYPE      := NULL,
        in_app_id               app_roles_map.app_id%TYPE       := NULL,
        in_context_id           app_roles_map.context_id%TYPE   := NULL
    )
    RETURN CHAR
    AS
        out_flag CHAR;
    BEGIN
        SELECT MAX('Y')
        INTO out_flag
        FROM app_roles_map r
        WHERE r.app_id          = COALESCE(in_app_id,   core.get_app_id())
            AND r.user_id       = COALESCE(in_user_id,  core.get_user_id())
            AND r.role_id       = in_role_id
            AND (
                r.context_id    IS NULL
                OR r.context_id IN (in_context_id, SUBSTR(in_context_id, 1, INSTR(in_context_id, '|') - 1))
            )
            AND r.is_active     = 'Y';
        --
        RETURN out_flag;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION is_page_available (
        -- pass args so we can cache the result
        in_user_id              app_roles_map.user_id%TYPE,
        in_app_id               app_roles.app_id%TYPE,
        in_page_id              app_pages.page_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE,
        in_auth_scheme          VARCHAR2,
        in_procedure_name       VARCHAR2
    )
    RETURN CHAR
    --RESULT_CACHE
    AS
        out_result              CHAR;
        --
        PRAGMA UDF;             -- SQL only
    BEGIN
        -- skip global page and login/logout page
        IF in_page_id IN (0, 9999) THEN
            RETURN 'Y';  -- always show
        END IF;

        -- check scheme and procedure
        IF in_auth_scheme IS NULL OR in_auth_scheme = 'MUST_NOT_BE_PUBLIC_USER' THEN
            RETURN 'Y';  -- no authorization or public access
        END IF;

        -- check auth procedure
        IF in_procedure_name IS NULL THEN
            RETURN 'N';  -- hide, auth function is set on page but missing in AUTH package
        END IF;

        -- call procedure
        IF in_auth_scheme = 'IS_DEVELOPER' THEN
            RETURN NVL(core.is_developer_y(), 'N');
            --
        ELSIF in_auth_scheme LIKE 'IS_USER%' THEN
            EXECUTE IMMEDIATE
                'BEGIN :out_result := ' || in_procedure_name || '(in_app_id => :app_id, in_page_id => :page_id, in_user_id => :user_id, in_context_id => :context_id); END;'
                USING OUT out_result,
                    IN in_app_id, IN in_page_id, IN in_user_id, IN in_context_id;
        ELSE
            EXECUTE IMMEDIATE
                'BEGIN :out_result := ' || in_procedure_name || '(); END;'
                USING OUT out_result;
        END IF;
        --
        --core.log_debug('AUTHORIZED_PAGE', out_result, in_procedure_name, in_app_id, in_page_id, in_user_id, in_context_id);
        --
        RETURN NVL(out_result, 'N');
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION get_component_type (
        in_component_type       app_components.component_type%TYPE
    )
    RETURN app_components.component_type%TYPE
    AS
    BEGIN
        /*
            SELECT
                d.apex_view_name,
                MAX(n.comments) AS comments
            FROM apex_dictionary d
            JOIN apex_dictionary n
                ON n.apex_view_name = d.apex_view_name
                AND n.column_id     = 0
            WHERE d.column_name     IN ('AUTHORIZATION_SCHEME_ID', 'PAGE_ID')
            GROUP BY d.apex_view_name
            HAVING COUNT(d.column_name) = 2
            ORDER BY 1;
         */
        -- make component types more readable
        RETURN CASE in_component_type
            WHEN 'APEX_APPLICATION_PAGES'           THEN 'PAGE'
            WHEN 'APEX_APPLICATION_PAGE_BRANCHES'   THEN 'BRANCH'
            WHEN 'APEX_APPLICATION_PAGE_BUTTONS'    THEN 'BUTTON'
            WHEN 'APEX_APPLICATION_PAGE_CHART_S'    THEN 'CHART_SERIE'
            WHEN 'APEX_APPLICATION_PAGE_COMP'       THEN 'COMPUTATION'
            WHEN 'APEX_APPLICATION_PAGE_DA'         THEN 'ACTION'
            WHEN 'APEX_APPLICATION_PAGE_DA_ACTS'    THEN 'ACTION_ROW'
            WHEN 'APEX_APPLICATION_PAGE_IR_COL'     THEN 'IR_COLUMN'
            WHEN 'APEX_APPLICATION_PAGE_ITEMS'      THEN 'ITEM'
            WHEN 'APEX_APPLICATION_PAGE_PROC'       THEN 'PROCESS'
            WHEN 'APEX_APPLICATION_PAGE_REGIONS'    THEN 'REGION'
            WHEN 'APEX_APPLICATION_PAGE_REG_COLS'   THEN 'REG_COLUMN'
            WHEN 'APEX_APPLICATION_PAGE_RPT_COLS'   THEN 'REP_COLUMN'
            WHEN 'APEX_APPLICATION_PAGE_VAL'        THEN 'VALIDATION'
            WHEN 'APEX_APPL_PAGE_CARD_ACTIONS'      THEN 'CARD_ACTION'
            WHEN 'APEX_APPL_PAGE_FILTERS'           THEN 'FILTER'
            WHEN 'APEX_APPL_PAGE_FILTER_GROUPS'     THEN 'FILTER_GROUP'
            WHEN 'APEX_APPL_PAGE_IG_COLUMNS'        THEN 'GRID_COLUMN'
            WHEN 'APEX_APPL_PAGE_IG_RPTS'           THEN 'GRID_REPORT'
            WHEN 'APEX_APPL_PAGE_MAP_LAYERS'        THEN 'MAP_LAYER'
            ELSE in_component_type END;
    END;



    PROCEDURE discover_component (
        in_user_id              app_roles_map.user_id%TYPE,
        in_page_id              app_pages.page_id%TYPE,
        in_component_id         app_components.component_id%TYPE,
        in_component_type       app_components.component_type%TYPE,
        in_component_name       app_components.component_name%TYPE
    )
    AS
        PRAGMA AUTONOMOUS_TRANSACTION;
        --
        rec                     app_components%ROWTYPE;
    BEGIN
        IF in_component_type IN (
            'APEX_APPLICATION_PAGES'  -- dont track pages
        )
        THEN
            RETURN;
        END IF;
        --
        rec.app_id              := core.get_app_id();
        rec.component_id        := in_component_id;
        rec.component_type      := get_component_type(in_component_type);
        rec.component_name      := in_component_name;
        rec.page_id             := in_page_id;
        rec.role_id             := NULL;
        rec.is_active           := 'Y';
        rec.updated_by          := in_user_id;
        rec.updated_at          := SYSDATE;

        -- add component to the list
        BEGIN
            INSERT INTO app_components VALUES rec;
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
        END;
        --
        COMMIT;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        ROLLBACK;
        core.raise_error();
    END;



    PROCEDURE check_allowed_dml (
        in_table_name           app_tables.table_name%TYPE,
        in_action               CHAR,
        in_user_id              app_roles_map.user_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE       := NULL
    )
    AS
    BEGIN
        IF NOT app_auth.is_allowed_dml (
                in_table_name       => in_table_name,
                in_action           => in_action,
                in_user_id          => in_user_id,
                in_context_id       => in_context_id
            )
        THEN
            core.raise_error('NOT_AUTH_' || in_action, REPLACE(in_table_name, core.get_app_prefix(), ''), in_user_id, in_context_id);
        END IF;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION is_allowed_dml (
        in_table_name           app_tables.table_name%TYPE,
        in_action               CHAR,
        in_user_id              app_roles_map.user_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE       := NULL
    )
    RETURN BOOLEAN
    AS
        v_authorized            CHAR;
    BEGIN
        /*
        SELECT MAX('Y')
        INTO v_authorized
        FROM app_tables t
        JOIN app_roles_map r
            ON r.client_id      = in_client_id
            AND (r.project_id   = in_project_id OR r.project_id IS NULL)
            AND r.user_id       = in_user_id
            AND r.role_id       = t.role_id
            AND r.is_active     = 'Y'
        JOIN app_users_map a
            ON a.user_id        = r.user_id
            AND a.client_id     = r.client_id
            AND a.is_active     = 'Y'
        JOIN app_users u
            ON u.user_id        = r.user_id
            AND u.is_active     = 'Y'
        WHERE t.table_name      = in_table_name
            AND t.is_active     = 'Y'
            AND (
                (t.is_allowed_create = 'Y' AND NULLIF(in_action, 'C') IS NULL) OR
                (t.is_allowed_update = 'Y' AND NULLIF(in_action, 'U') IS NULL) OR
                (t.is_allowed_delete = 'Y' AND NULLIF(in_action, 'D') IS NULL)
            );
        */
        --
        RETURN (v_authorized = 'Y');
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE check_executable (
        in_procedure_name       VARCHAR2,
        in_user_id              app_roles_map.user_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE       := NULL
    )
    --RESULT_CACHE
    AS
    BEGIN
        IF NOT app_auth.is_executable (
                in_object_name          => SUBSTR(in_procedure_name, 1, INSTR(in_procedure_name, '.') - 1),
                in_procedure_name       => SUBSTR(in_procedure_name, INSTR(in_procedure_name, '.') + 1),
                in_user_id              => in_user_id,
                in_context_id           => in_context_id
            )
        THEN
            core.raise_error('NOT_AUTH_PROC_' || in_procedure_name);
        END IF;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE check_executable
    AS
        v_procedure_name        VARCHAR2(96);
    BEGIN
        v_procedure_name        := core.get_caller_name(3);
        --
        IF NOT app_auth.is_executable (
                in_object_name          => SUBSTR(v_procedure_name, 1, INSTR(v_procedure_name, '.') - 1),
                in_procedure_name       => SUBSTR(v_procedure_name, INSTR(v_procedure_name, '.') + 1),
                in_user_id              => core.get_user_id(),
                in_context_id           => core.get_item(app.global_context_id)
            )
        THEN
            core.raise_error('NOT_AUTH_PROC_' || v_procedure_name);
        END IF;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION is_executable (
        in_object_name          app_procedures.object_name%TYPE,
        in_procedure_name       app_procedures.object_name%TYPE,
        in_user_id              app_roles_map.user_id%TYPE,
        in_context_id           app_roles_map.context_id%TYPE       := NULL
    )
    RETURN BOOLEAN
    AS
        v_authorized            CHAR;
    BEGIN
        /*
        SELECT MAX('Y')
        INTO v_authorized
        FROM app_procedures t
        JOIN app_roles_map r
            ON r.client_id      = in_client_id
            AND (r.project_id   = in_project_id OR r.project_id IS NULL)
            AND r.user_id       = in_user_id
            AND r.role_id       = t.role_id
            AND r.is_active     = 'Y'
        JOIN app_users_map a
            ON a.user_id        = r.user_id
            AND a.is_active     = 'Y'
        JOIN app_users u
            ON u.user_id            = r.user_id
            AND u.is_active         = 'Y'
        WHERE t.object_name         = in_object_name
            AND t.procedure_name    = in_procedure_name
            AND t.is_active         = 'Y';
        */
        --
        RETURN (v_authorized = 'Y');
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE set_context (
        in_app_id               app_contexts_map.app_id%TYPE,
        in_user_id              app_contexts_map.user_id%TYPE,
        in_page_id              app_contexts_map.page_id%TYPE,
        in_context_id           app_contexts_map.context_id%TYPE
    )
    AS
        rec                     app_contexts_map%ROWTYPE;
    BEGIN
        rec.app_id              := in_app_id;
        rec.user_id             := in_user_id;
        rec.page_id             := in_page_id;
        rec.context_id          := in_context_id;
        rec.is_active           := 'Y';
        --
        BEGIN
            INSERT INTO app_contexts_map
            VALUES rec;
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            UPDATE app_contexts_map t
            SET ROW                 = rec
            WHERE t.app_id          = rec.app_id
                AND t.user_id       = rec.user_id
                AND t.page_id       = rec.page_id
                AND t.context_id    = rec.context_id;
        END;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION check_context (
        in_app_id               app_contexts_map.app_id%TYPE,
        in_user_id              app_contexts_map.user_id%TYPE,
        in_page_id              app_contexts_map.page_id%TYPE,
        in_context_id           app_contexts_map.context_id%TYPE
    )
    RETURN CHAR
    AS
        out_flag    CHAR;
    BEGIN
        SELECT 'Y' INTO out_flag
        FROM app_contexts_map t
        WHERE t.app_id          = in_app_id
            AND t.user_id       = in_user_id
            AND t.page_id       = in_page_id
            AND t.context_id    = in_context_id;
        --
        RETURN out_flag;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;

END;
/

