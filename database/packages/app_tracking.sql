CREATE OR REPLACE PACKAGE BODY app_tracking AS

    PROCEDURE init_headers
    AS
        in_page_id      CONSTANT VARCHAR2(8)    := core.get_page_id();
        in_offset       CONSTANT PLS_INTEGER    := get_offset();
        --
        v_last_week     PLS_INTEGER;
    BEGIN
        FOR i IN 0 .. 36 LOOP
            core.set_item (
                'P' || in_page_id || '_HEADER_T' || LPAD(i, 2, '0'),
                CASE WHEN TRUNC(SYSDATE) - i + in_offset <= TRUNC(SYSDATE) AND i + in_offset - 1 <= c_show_days + in_offset
                    THEN '<span title="'
                        || REGEXP_REPLACE(TO_CHAR(TRUNC(SYSDATE) - i + in_offset, 'Day, FMMonth ddth'), '\s+,', ',') || '">'
                        || TO_CHAR(TRUNC(SYSDATE) - i + in_offset, 'fmdd')
                        || '</span>'
                    END
            );
            --
            IF SUBSTR(TO_CHAR(TRUNC(SYSDATE) - i + in_offset, 'Dy'), 1, 1) = 'M' THEN
                v_last_week := NVL(v_last_week, 0) + 1;
                core.set_item (
                    'P' || in_page_id || '_WEEK_' || v_last_week,
                    REGEXP_REPLACE(TO_CHAR(TRUNC(SYSDATE) - i + in_offset, 'Month [IW]'), '\s+,', ',')
                );
            END IF;
        END LOOP;

        -- default LOVs
        core.set_item('$METRIC', NVL(core.get_item('$METRIC'), 'ACTIVITY'));
        core.set_item('$SOURCE', NVL(core.get_item('$SOURCE'), 'rendering:'));
    END;



    FUNCTION get_offset
    RETURN NUMBER
    AS
    BEGIN
        RETURN 7 - TO_NUMBER(TO_CHAR(TRUNC(SYSDATE), 'D')) + 1;
    END;

END;
/

