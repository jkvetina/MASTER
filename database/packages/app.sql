CREATE OR REPLACE PACKAGE BODY app AS

    PROCEDURE init_defaults
    AS
    BEGIN
        -- set page_id for all standard pages (ignore help page and other modals)
        IF core.get_page_id() != 980 AND core.get_page_is_modal() IS NULL THEN
            core.set_item('P0_HELP_PAGE_ID', core.get_page_id());
        END IF;
        --
        IF UPPER(core.get_user_id()) = 'NOBODY' THEN
            RETURN;
        END IF;

        -- if requested page is a homepage then setup G_APP_ID item
        IF core.get_page_id() = core.get_app_homepage() THEN
            FOR c IN (
                SELECT
                    a.application_id,
                    a.application_name
                FROM apex_applications a
                WHERE a.application_id = core.get_app_id(in_dont_override => 'Y')
            ) LOOP
                core.log_debug('SWITCH_APP_CONTEXT', c.application_id);
                --
                core.set_item(global_app_id,    c.application_id);
                core.set_item(global_app_name,  c.application_name);
            END LOOP;
        END IF;

        -- find init block for specific/current page
        app.call_init_defaults();

        -- init badges in navigation, @TODO: we can probably skip this for modal pages
        -- then it is up to the application to add user/page/app specific badges by calling app_nav.add_badge procedure
        app_nav.init_badges();
        --
        FOR c IN (
            SELECT 800 AS app_id, 850 AS page_id, NULLIF(COUNT(*), 0) AS badge
            FROM app_navigation_grid_v t
            WHERE t.action_name IS NOT NULL
            UNION ALL
            SELECT 800 AS app_id, 806 AS page_id, NULLIF(COUNT(*), 0) AS badge
            FROM app_user_requests t
            WHERE t.accepted_at     IS NULL
                AND t.rejected_at   IS NULL
        ) LOOP
            app_nav.add_badge(c.app_id, c.page_id, c.badge);
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



    FUNCTION get_init_defaults (
        in_app_id               app_pages.app_id%TYPE,
        in_page_id              app_pages.page_id%TYPE
    )
    RETURN VARCHAR2
    RESULT_CACHE
    AS
        c_app_id        CONSTANT NUMBER(10)     := in_app_id;
        c_owner         CONSTANT VARCHAR2(30)   := core.get_app_owner(c_app_id);
        c_prefix        CONSTANT VARCHAR2(30)   := core.get_app_prefix(c_app_id);
        --
        out_procedures          VARCHAR2(2000);
    BEGIN
        SELECT LISTAGG(p.object_name || '.' || p.procedure_name, ',') WITHIN GROUP (ORDER BY p.object_name, p.procedure_name)
        INTO out_procedures
        FROM all_procedures p
        WHERE 1 = 1
            AND p.owner = c_owner
            AND ((
                p.object_name           = c_prefix || 'APP'
                AND p.procedure_name    IN ('INIT_DEFAULTS', 'INIT_DEFAULTS_P' || TO_CHAR(in_page_id))
            )
            OR (
                p.object_name           = c_prefix || 'P' || TO_CHAR(in_page_id)
                AND p.procedure_name    = 'INIT_DEFAULTS'
            ));
        --
        RETURN out_procedures;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE call_init_defaults
    AS
        v_procedures            VARCHAR2(2000);
    BEGIN
        v_procedures := get_init_defaults (
            in_app_id           => core.get_app_id(in_dont_override => 'Y'),
            in_page_id          => core.get_page_id()
        );
        --
        FOR c IN (
            SELECT
                REGEXP_SUBSTR(v_procedures, '[^,]+', 1, LEVEL) AS procedure_name
            FROM DUAL
            CONNECT BY REGEXP_SUBSTR(v_procedures, '[^,]+', 1, LEVEL) IS NOT NULL
        ) LOOP
            IF c.procedure_name IS NOT NULL THEN
                core.log_debug('CALLING_INIT', c.procedure_name);
                --
                EXECUTE IMMEDIATE
                    'BEGIN ' || c.procedure_name || '(); END;';
            END IF;
        END LOOP;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION get_icon_warning (
        in_title                VARCHAR2    := NULL,
        in_style                VARCHAR2    := NULL
    )
    RETURN VARCHAR2
    AS
    BEGIN
        RETURN core.get_icon('fa-warning', in_title, 'color: orange; margin-right: 0.3rem;' || in_style);
    END;



    FUNCTION get_icon_check (
        in_title                VARCHAR2    := NULL,
        in_style                VARCHAR2    := NULL
    )
    RETURN VARCHAR2
    AS
    BEGIN
        RETURN core.get_icon('fa-check', in_title, 'color: #333;' || in_style);
    END;



    FUNCTION get_user_views_text (
        in_view_name            user_views.view_name%TYPE
    )
    RETURN VARCHAR2
    AS
        out_text                user_views.text%TYPE;
    BEGIN
        -- convert LONG to VARCHAR2, output limited for first 4000 chars
        SELECT v.text INTO out_text
        FROM user_views v
        WHERE v.view_name       = in_view_name;
        --
        RETURN out_text;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    END;



    PROCEDURE ajax_ping
    AS
    BEGIN
        APEX_JSON.OPEN_OBJECT();
        --
        -- APEX_APPLICATION.G_X01, APEX_APPLICATION.G_X02, APEX_APPLICATION.G_X03
        --
        FOR c IN (
            SELECT
                m.app_id,
                m.user_id,
                m.message_id,
                m.message_type,
                m.message_payload
            FROM app_user_messages m
            WHERE m.app_id              = core.get_app_id()
                AND m.user_id           = core.get_user_id()
                AND (m.session_id       = core.get_session_id() OR m.session_id IS NULL)
                AND m.delivered_at      IS NULL
            ORDER BY m.created_at DESC
            FETCH FIRST 1 ROWS ONLY
        ) LOOP
            APEX_JSON.WRITE('message',  c.message_payload);
            APEX_JSON.WRITE('status',   c.message_type);        -- 'SUCCESS', ERROR, WARNING
            --
            UPDATE app_user_messages m
            SET m.delivered_at          = SYSDATE
            WHERE m.app_id              = c.app_id
                AND m.user_id           = c.user_id
                AND m.message_id        = c.message_id;
        END LOOP;
        --
        APEX_JSON.CLOSE_OBJECT();
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE ajax_message (
        in_message          app_user_messages.message_payload%TYPE,
        in_type             app_user_messages.message_type%TYPE         := NULL,
        in_user_id          app_user_messages.user_id%TYPE              := NULL,
        in_session_id       app_user_messages.session_id%TYPE           := NULL,
        in_app_id           app_user_messages.app_id%TYPE               := NULL,
        in_message_id       app_user_messages.message_id%TYPE           := NULL
    )
    AS
        rec                 app_user_messages%ROWTYPE;
    BEGIN
        rec.app_id          := COALESCE(in_app_id,      core.get_app_id());
        rec.user_id         := COALESCE(in_user_id,     core.get_user_id());
        rec.message_id      := COALESCE(in_message_id,  REGEXP_REPLACE(SYS_GUID(), '(.{8})(.{4})(.{4})(.{4})(.{12})', '\1-\2-\3-\4-\5'));
        rec.message_type    := COALESCE(in_type,        'SUCCESS');
        rec.message_payload := LTRIM(RTRIM(in_message));
        rec.session_id      := in_session_id;
        rec.created_by      := core.get_user_id();
        rec.created_at      := SYSDATE;
        --
        INSERT INTO app_user_messages VALUES rec;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE refresh_mv_job (
        in_name_like        VARCHAR2,
        in_ping_success     BOOLEAN := TRUE
    )
    AS
        in_start            CONSTANT DATE := SYSDATE;
        --
        out_message         VARCHAR2(512);
    BEGIN
        core.refresh_mviews(in_name_like);
        --
        out_message := 'Refreshed in ' || ROUND((SYSDATE - in_start) * 86400, 0) || ' seconds';
        --
        IF in_ping_success THEN
            app.ajax_message (
                in_user_id      => core.get_user_id(),
                in_message      => out_message,
                in_type         => 'SUCCESS',
                in_session_id   => NULL,--core.get_session_id(),
                in_app_id       => core.get_app_id()
            );
        ELSE
            APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE := out_message;
        END IF;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE refresh_mv (
        in_name_like        VARCHAR2,
        in_wait             BOOLEAN := FALSE
    )
    AS
    BEGIN
        -- create a job to refresh MV on background
        IF in_wait THEN
            app.refresh_mv_job(in_name_like, in_ping_success => FALSE);
        ELSE
            core.create_job (
                in_job_name         => 'REFRESH_MV_' || TRANSLATE(in_name_like, '%\', ''),
                in_statement        => 'app.refresh_mv_job(''' || in_name_like || ''');',
                in_user_id          => core.get_user_id(),
                in_app_id           => core.get_app_id(),
                in_session_id       => NULL
            );
        END IF;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION get_color (
        in_lov_id           app_lovs.lov_id%TYPE,
        in_value            app_lovs.treshold%TYPE,
        in_text             CHAR                        := NULL,
        in_app_id           app_lovs.app_id%TYPE        := NULL
    )
    RETURN app_lovs.color_bg%TYPE
    AS
        out_color           app_lovs.color_bg%TYPE;
    BEGIN
        -- check min value
        BEGIN
            SELECT CASE WHEN in_text IS NULL THEN t.color_bg ELSE t.color_text END INTO out_color
            FROM app_lovs t
            WHERE 1 = 1
                AND t.app_id    = COALESCE(in_app_id, core.get_app_id())
                AND t.lov_id    = in_lov_id
                AND t.treshold  <= in_value
                AND ROWNUM      = 1;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        END;

        -- check max value
        BEGIN
            SELECT CASE WHEN in_text IS NULL THEN t.color_bg ELSE t.color_text END INTO out_color
            FROM app_lovs t
            WHERE 1 = 1
                AND t.app_id    = COALESCE(in_app_id, core.get_app_id())
                AND t.lov_id    = in_lov_id
                AND t.treshold  > in_value
                AND ROWNUM      = 1;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- value is above max treshold
            SELECT MIN(CASE WHEN in_text IS NULL THEN t.color_bg ELSE t.color_text END) KEEP (DENSE_RANK FIRST ORDER BY t.treshold DESC)
            INTO out_color
            FROM app_lovs t
            WHERE 1 = 1
                AND t.app_id    = COALESCE(in_app_id, core.get_app_id())
                AND t.lov_id    = in_lov_id;
            --
            RETURN out_color;
        END;

        -- shortloop for text colors
        IF in_text IS NOT NULL THEN
            SELECT
                MIN(t.color_text) KEEP (DENSE_RANK FIRST ORDER BY t.treshold DESC)
            INTO out_color
            FROM app_lovs t
            WHERE 1 = 1
                AND t.app_id    = COALESCE(in_app_id, core.get_app_id())
                AND t.lov_id    = in_lov_id
                AND t.treshold  <= in_value;
            --
            RETURN out_color;
        END IF;

        -- calculate color in between
        WITH t AS (
            SELECT /*+ MATERIALIZE */
                t.left_treshold,
                t.right_treshold,
                in_value            AS value,
                (in_value - t.left_treshold) / (t.right_treshold - t.left_treshold) AS value_perc,
                --
                TO_NUMBER(SUBSTR(t.left_color,  2, 2), 'XX') AS left_r,
                TO_NUMBER(SUBSTR(t.left_color,  4, 2), 'XX') AS left_g,
                TO_NUMBER(SUBSTR(t.left_color,  6, 2), 'XX') AS left_b,
                TO_NUMBER(SUBSTR(t.right_color, 2, 2), 'XX') AS right_r,
                TO_NUMBER(SUBSTR(t.right_color, 4, 2), 'XX') AS right_g,
                TO_NUMBER(SUBSTR(t.right_color, 6, 2), 'XX') AS right_b
            FROM (
                SELECT
                    MIN(t.color_bg) KEEP (DENSE_RANK FIRST ORDER BY t.treshold DESC)    AS left_color,
                    MIN(t.treshold) KEEP (DENSE_RANK FIRST ORDER BY t.treshold DESC)    AS left_treshold,
                    MIN(r.color_bg) KEEP (DENSE_RANK FIRST ORDER BY r.treshold)         AS right_color,
                    MIN(r.treshold) KEEP (DENSE_RANK FIRST ORDER BY r.treshold)         AS right_treshold
                FROM app_lovs t
                JOIN app_lovs r
                    ON r.app_id     = t.app_id
                    AND r.lov_id    = t.lov_id
                WHERE 1 = 1
                    AND t.app_id    = COALESCE(in_app_id, core.get_app_id())
                    AND t.lov_id    = in_lov_id
                    AND t.treshold  <= in_value
                    AND r.treshold  > in_value
            ) t
        )
        SELECT
            TO_CHAR(GREATEST(LEAST(ROUND((t.right_r - t.left_r) * t.value_perc + t.left_r, 0), 255), 0), 'FM0X') ||
            TO_CHAR(GREATEST(LEAST(ROUND((t.right_g - t.left_g) * t.value_perc + t.left_g, 0), 255), 0), 'FM0X') ||
            TO_CHAR(GREATEST(LEAST(ROUND((t.right_b - t.left_b) * t.value_perc + t.left_b, 0), 255), 0), 'FM0X')
        INTO out_color
        FROM t;
        --
        RETURN '#' || out_color;
    END;



    PROCEDURE favorite_switch (
        in_app_id               app_users_map.app_id%TYPE,
        in_user_id              app_users_map.user_id%TYPE
    )
    AS
        out_favorite            app_users_map.is_favorite%TYPE;
    BEGIN
        UPDATE app_users_map t
        SET t.is_favorite       = CASE WHEN t.is_favorite IS NULL THEN 'Y' END
        WHERE t.app_id          = in_app_id
            AND t.user_id       = in_user_id
        RETURNING t.is_favorite INTO out_favorite;
        --
        core.set_json_message('Application ' || in_app_id || ' ' || CASE WHEN out_favorite = 'Y' THEN 'added to' ELSE 'removed from' END || ' favorites');
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE download_avatar (
        in_user_id              app_users.user_id%TYPE := NULL
    )
    AS
        rec                     app_users%ROWTYPE;
    BEGIN
        BEGIN
            SELECT t.* INTO rec
            FROM app_users t
            WHERE t.user_id     = COALESCE(in_user_id, core.get_user_id());
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            core.raise_error('FILE_NOT_FOUND');
        END;
        --
        core.download_file (
            in_file_name        => rec.avatar_url,
            in_file_mime        => rec.avatar_mime,
            in_file_payload     => rec.avatar_blob
        );
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;

END;
/

