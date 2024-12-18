CREATE OR REPLACE PACKAGE BODY app_nav AS

    PROCEDURE init_defaults
    AS
    BEGIN
        -- init items on page 850
        FOR c IN (
            SELECT
                't-Button--hot'     AS css_class,
                COUNT(*)            AS badge
            FROM app_navigation_grid_v n
            WHERE n.action_name     IS NOT NULL
        ) LOOP
            core.set_item('$AUTO_UPDATE_HOT',   CASE WHEN c.badge > 0 THEN c.css_class END);
            core.set_item('$AUTO_UPDATE_BADGE', CASE WHEN c.badge > 0 THEN '<div class="BADGE">' || c.badge || '</div>' END);
        END LOOP;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE remove_page (
        in_app_id               app_navigation.app_id%TYPE,
        in_target_app_id        app_navigation.target_app_id%TYPE,
        in_target_page_id       app_navigation.target_page_id%TYPE
    )
    AS
    BEGIN
        -- remove pages and references, related rows
        UPDATE app_navigation n
        SET n.parent_id             = NULL
        WHERE n.app_id              = in_app_id
            AND n.target_app_id     = in_target_app_id
            AND n.parent_id         = in_target_page_id;
        --
        DELETE FROM app_navigation n
        WHERE n.app_id              = in_app_id
            AND n.target_app_id     = in_target_app_id
            AND n.target_page_id    = in_target_page_id;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE add_page (
        in_app_id               app_navigation.app_id%TYPE,
        in_target_app_id        app_navigation.target_app_id%TYPE,
        in_target_page_id       app_navigation.target_page_id%TYPE,
        in_parent_id            app_navigation.parent_id%TYPE   := NULL,
        in_is_hidden            app_navigation.is_hidden%TYPE   := NULL,
        in_is_reset             app_navigation.is_reset%TYPE    := NULL,
        in_order#               app_navigation.order#%TYPE      := NULL,
        in_col_id               app_navigation.col_id%TYPE      := NULL
    )
    AS
        rec                     app_navigation%ROWTYPE;
    BEGIN
        rec.app_id              := in_app_id;
        rec.target_app_id       := in_target_app_id;
        rec.target_page_id      := in_target_page_id;
        rec.parent_id           := in_parent_id;
        rec.is_hidden           := in_is_hidden;
        rec.is_reset            := in_is_reset;
        rec.order#              := in_order#;
        rec.col_id              := in_col_id;
        --
        BEGIN
            INSERT INTO app_navigation VALUES rec;
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            UPDATE app_navigation n
            SET ROW = rec
            WHERE n.app_id              = in_app_id
                AND n.target_app_id     = in_target_app_id
                AND n.target_page_id    = in_target_page_id;
        END;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE save_grid
    AS
        v_deleted       PLS_INTEGER;
        v_inserted      PLS_INTEGER;
        v_updated       PLS_INTEGER;
    BEGIN
        IF core.get_grid_action() = 'D' THEN
            app_nav.remove_page (
                in_app_id           => core.get_grid_data('APP_ID'),
                in_target_app_id    => core.get_grid_data('TARGET_APP_ID'),
                in_target_page_id   => core.get_grid_data('TARGET_PAGE_ID')
            );
            --core.raise_error('DEL', core.get_grid_data('APP_ID'), core.get_grid_data('PAGE_ID'));
            app.ajax_message('DEL');
        ELSE
            app_nav.add_page (
                in_app_id           => core.get_grid_data('APP_ID'),
                in_target_app_id    => core.get_grid_data('TARGET_APP_ID'),
                in_target_page_id   => core.get_grid_data('TARGET_PAGE_ID'),
                in_parent_id        => core.get_grid_data('PARENT_ID'),
                in_is_hidden        => core.get_grid_data('IS_HIDDEN'),
                in_is_reset         => core.get_grid_data('IS_RESET'),
                in_order#           => core.get_grid_data('ORDER#'),
                in_col_id           => core.get_grid_data('COL_ID')
            );
            app.ajax_message('ADD');
        END IF;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE autoupdate
    AS
    BEGIN
        -- add/remove pages
        FOR c IN (
            SELECT n.*
            FROM app_navigation_grid_v n
            WHERE n.app_id          = core.get_app_id()
                AND n.action_name   IS NOT NULL
        ) LOOP
            IF UPPER(c.action_link) LIKE '%REMOVE_PAGE%' THEN
                app_nav.remove_page (
                    in_app_id           => c.app_id,
                    in_target_app_id    => c.target_app_id,
                    in_target_page_id   => c.target_page_id
                );
            END IF;
            --
            IF UPPER(c.action_link) LIKE '%ADD_PAGE%' THEN
                app_nav.add_page (
                    in_app_id           => c.app_id,
                    in_target_app_id    => c.target_app_id,
                    in_target_page_id   => c.target_page_id,
                    in_page_id          => c.page_id,
                    in_parent_id        => c.parent_id,
                    in_is_hidden        => c.is_hidden,
                    in_is_reset         => c.is_reset,
                    in_order#           => c.order#,
                    in_col_id           => c.col_id
                );
            END IF;
        END LOOP;

        -- renumber siblings
        MERGE INTO app_navigation g
        USING (
            SELECT
                n.app_id,
                n.target_app_id,
                n.target_page_id,
                n.new_order#
            FROM (
                SELECT
                    n.app_id,
                    n.target_app_id,
                    n.target_page_id,
                    n.order#,
                    ROW_NUMBER() OVER (PARTITION BY n.col_id, n.parent_id ORDER BY n.col_id, n.order#, n.target_page_id) * 5 + 5 AS new_order#
                FROM app_navigation n
                WHERE n.app_id          = core.get_app_id()
                    AND n.parent_id     IS NOT NULL
            ) n
            WHERE n.new_order# != n.order#
        ) n
        ON (
            g.app_id                = n.app_id
            AND g.target_page_id    = n.target_app_id
            AND g.target_page_id    = n.target_page_id
        )
        WHEN MATCHED THEN
        UPDATE SET g.order#     = n.new_order#;

        -- refresh MV
        app.refresh_mv(app_nav.c_mv, in_wait => TRUE);
        APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE := '';     -- remove message from MV refresh
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE init_badges
    AS
    BEGIN
        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION (
            p_collection_name   => c_collection_badges
        );
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        -- @TODO: ignore uniq constraint violated
        core.raise_error();
    END;



    PROCEDURE add_badge (
        in_app_id               app_navigation.app_id%TYPE,
        in_target_app_id        app_navigation.target_app_id%TYPE,
        in_target_page_id       app_navigation.target_page_id%TYPE,
        in_badge                VARCHAR2
    )
    AS
    BEGIN
        APEX_COLLECTION.ADD_MEMBER (
            p_collection_name   => c_collection_badges,
            p_c001              => in_badge,        -- badge payload
            p_c002              => '',              -- badge class, like DECENT
            p_n001              => in_app_id,
            p_n002              => in_target_app_id,
            p_n003              => in_target_page_id
        );
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;

END;
/

