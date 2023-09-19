CREATE OR REPLACE PACKAGE BODY app_nav AS

    PROCEDURE remove_page (
        in_app_id               app_navigation.app_id%TYPE,
        in_page_id              app_navigation.page_id%TYPE
    )
    AS
    BEGIN
        -- remove pages and references, related rows
        UPDATE app_navigation n
        SET n.parent_id         = NULL
        WHERE n.app_id          = in_app_id
            AND n.parent_id     = in_page_id;
        --
        DELETE FROM app_navigation n
        WHERE n.app_id          = in_app_id
            AND n.page_id       = in_page_id;
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    PROCEDURE add_page (
        in_app_id               app_navigation.app_id%TYPE,
        in_page_id              app_navigation.page_id%TYPE,
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
        rec.page_id             := in_page_id;
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
            WHERE n.app_id      = in_app_id
                AND n.page_id   = in_page_id;
        END;
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
                    in_app_id       => c.app_id,
                    in_page_id      => c.page_id
                );
            END IF;
            --
            IF UPPER(c.action_link) LIKE '%ADD_PAGE%' THEN
                app_nav.add_page (
                    in_app_id       => c.app_id,
                    in_page_id      => c.page_id,
                    in_parent_id    => c.parent_id,
                    in_is_hidden    => c.is_hidden,
                    in_is_reset     => c.is_reset,
                    in_order#       => c.order#,
                    in_col_id       => c.col_id
                );
            END IF;
        END LOOP;

        -- renumber siblings
        MERGE INTO app_navigation g
        USING (
            SELECT n.app_id, n.page_id, n.new_order#
            FROM (
                SELECT
                    n.app_id,
                    n.page_id,
                    n.order#,
                    ROW_NUMBER() OVER (PARTITION BY n.col_id, n.parent_id ORDER BY n.col_id, n.order#, n.page_id) * 5 + 5 AS new_order#
                FROM app_navigation n
                WHERE n.app_id          = core.get_app_id()
                    AND n.parent_id     IS NOT NULL
            ) n
            WHERE n.new_order# != n.order#
        ) n
        ON (
            g.app_id            = n.app_id
            AND g.page_id       = n.page_id
        )
        WHEN MATCHED THEN
        UPDATE SET g.order#     = n.new_order#;

        -- refresh MV
        app.refresh_mv(app_nav.c_mv, in_wait => TRUE);
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error();
    END;



    FUNCTION get_autoupdate_hot
    RETURN VARCHAR2
    AS
        out_css_class VARCHAR2(16);
    BEGIN
        SELECT 't-Button--hot'
        INTO out_css_class
        FROM app_navigation_grid_v n
        WHERE n.action_name IS NOT NULL
            AND ROWNUM = 1;
        --
        RETURN out_css_class;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    END;

END;
/
