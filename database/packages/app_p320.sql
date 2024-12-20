CREATE OR REPLACE PACKAGE BODY app_p320 AS

    PROCEDURE init_defaults
    AS
        v_app_name      apex_applications.application_name%TYPE;
        v_badge         NUMBER;
    BEGIN
        -- init button badge and class
        v_badge := get_auto_update_badge();
        --
        core.set_item('$AUTO_UPDATE_HOT',   CASE WHEN v_badge > 0 THEN 'HOT' END);
        core.set_item('$AUTO_UPDATE_BADGE', CASE WHEN v_badge > 0 THEN '<div class="BADGE">' || v_badge || '</div>' END);

        -- get application name
        core.set_item('$APP_NAME', core.get_app_name(core.get_context_app()));
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION get_collection_name (
        in_app_id               app_navigation.app_id%TYPE
    )
    RETURN VARCHAR2
    AS
    BEGIN
        RETURN c_collection_badges || '_' || TO_CHAR(in_app_id);
    END;



    FUNCTION get_auto_update_badge
    RETURN NUMBER
    AS
        v_badge         NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_badge
        FROM app_p320_navigation_grid_v n
        WHERE NVL(n.action_add, n.action_delete) IS NOT NULL;
        --
        RETURN v_badge;
    END;



    PROCEDURE refresh_mview
    AS
    BEGIN
        -- refresh APEX mviews first
        core.refresh_mviews (
            in_name_like    => c_apex_mv_names,
            in_percent      => 100,
            in_method       => 'C'
        );
        --
        core.refresh_mviews (
            in_name_like    => c_navigation_mv_names,
            in_percent      => 100,
            in_method       => 'C'
        );
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
        core.log_start (
            'app_id',           in_app_id,
            'target_app_id',    in_target_app_id,
            'target_page_id',   in_target_page_id
        );

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
        --
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
        in_parent_id            app_navigation.parent_id%TYPE       := NULL,
        in_is_hidden            app_navigation.is_hidden%TYPE       := NULL,
        in_is_reset             app_navigation.is_reset%TYPE        := NULL,
        in_order#               app_navigation.order#%TYPE          := NULL,
        in_col_id               app_navigation.col_id%TYPE          := NULL
    )
    AS
        rec                     app_navigation%ROWTYPE;
    BEGIN
        core.log_start (
            'app_id',           in_app_id,
            'target_app_id',    in_target_app_id,
            'target_page_id',   in_target_page_id,
            'parent_id',        in_parent_id
        );
        --
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
    BEGIN
        IF (core.get_grid_action() = 'D' OR core.get_grid_data('ACTION_DELETE') = 'Y') THEN
            remove_page (
                in_app_id           => core.get_grid_data('APP_ID'),
                in_target_app_id    => core.get_grid_data('TARGET_APP_ID'),
                in_target_page_id   => core.get_grid_data('TARGET_PAGE_ID')
            );
        ELSE
            add_page (
                in_app_id           => core.get_grid_data('APP_ID'),
                in_target_app_id    => core.get_grid_data('TARGET_APP_ID'),
                in_target_page_id   => core.get_grid_data('TARGET_PAGE_ID'),
                in_parent_id        => core.get_grid_data('PARENT_ID'),
                in_is_hidden        => core.get_grid_data('IS_HIDDEN'),
                in_is_reset         => core.get_grid_data('IS_RESET'),
                in_order#           => core.get_grid_data('ORDER#'),
                in_col_id           => core.get_grid_data('COL_ID')
            );
        END IF;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE auto_update
    AS
    BEGIN
        core.log_start();

        -- add/remove marked pages automatically
        FOR c IN (
            SELECT n.*
            FROM app_p320_navigation_grid_v n
            WHERE NVL(n.action_add, n.action_delete) IS NOT NULL
        ) LOOP
            IF c.action_delete = 'Y' THEN
                remove_page (
                    in_app_id           => c.app_id,
                    in_target_app_id    => c.target_app_id,
                    in_target_page_id   => c.target_page_id
                );
                --
            ELSIF c.action_add = 'Y' THEN
                add_page (
                    in_app_id           => c.app_id,
                    in_target_app_id    => c.target_app_id,
                    in_target_page_id   => c.target_page_id,
                    in_parent_id        => c.parent_id,
                    in_is_hidden        => c.is_hidden,
                    in_is_reset         => c.is_reset,
                    in_order#           => c.order#,
                    in_col_id           => c.col_id
                );
            END IF;
        END LOOP;

        -- need to refresh mview for proper page refresh
        refresh_mview();

        -- also reorder siblings
        reorder_siblings();
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE reorder_siblings
    AS
    BEGIN
        core.log_start();

        -- renumber siblings
        UPDATE app_navigation n
        SET n.order#            = NULL
        WHERE n.app_id          = core.get_app_id()
            AND n.is_hidden     = 'Y';
        --
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
                    --
                    ROW_NUMBER() OVER (
                        PARTITION BY
                            m.col_id,
                            n.parent_id
                        ORDER BY
                            m.col_id,
                            n.order# NULLS LAST,
                            n.target_page_id
                    ) * 5 + 5 AS new_order#
                    --
                FROM app_navigation n
                LEFT JOIN app_navigation_map_mv m
                    ON m.app_id             = n.app_id
                    AND m.target_app_id     = n.app_id
                    AND m.target_page_id    = n.parent_id
                WHERE n.app_id              = core.get_app_id()
                    AND n.parent_id         IS NOT NULL
                    AND n.is_hidden         IS NULL
            ) n
            WHERE n.new_order# != n.order#
        ) n
        ON (
            g.app_id                = n.app_id
            AND g.target_app_id     = n.target_app_id
            AND g.target_page_id    = n.target_page_id
        )
        WHEN MATCHED THEN
        UPDATE SET g.order# = n.new_order#;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE init_collection (
        in_app_id               app_navigation.app_id%TYPE
    )
    AS
    BEGIN
        BEGIN
            APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION (
                p_collection_name   => get_collection_name(in_app_id)
            );
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            -- try again
            APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION (
                p_collection_name   => get_collection_name(in_app_id)
            );
        END;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE add_badge (
        in_app_id               app_navigation.app_id%TYPE,
        in_target_app_id        app_navigation.target_app_id%TYPE,
        in_target_page_id       app_navigation.target_page_id%TYPE,
        --
        in_badge                VARCHAR2    := NULL,
        in_badge_class          VARCHAR2    := NULL
    )
    AS
    BEGIN
        APEX_COLLECTION.ADD_MEMBER (
            p_collection_name   => c_collection_badges || '_' || TO_CHAR(in_app_id),
            p_n001              => in_target_app_id,
            p_n002              => in_target_page_id,
            p_c001              => in_badge,
            p_c002              => in_badge_class
        );
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;

END;
/

