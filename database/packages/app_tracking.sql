CREATE OR REPLACE PACKAGE BODY app_tracking AS

    PROCEDURE init_headers
    AS
        v_offset        CONSTANT PLS_INTEGER := get_offset();
        v_last_week     PLS_INTEGER;
    BEGIN
        FOR i IN 0 .. 36 LOOP
            core.set_item (
                'P100_HEADER_T' || LPAD(i, 2, '0'),
                CASE WHEN TRUNC(SYSDATE) - i + v_offset <= TRUNC(SYSDATE) AND i + v_offset - 1 <= c_show_days + v_offset
                    THEN '<span title="'
                        || REGEXP_REPLACE(TO_CHAR(TRUNC(SYSDATE) - i + v_offset, 'Day, FMMonth ddth'), '\s+,', ',') || '">'
                        || TO_CHAR(TRUNC(SYSDATE) - i + v_offset, 'fmdd')
                        || '</span>'
                    END
            );
            --
            IF SUBSTR(TO_CHAR(TRUNC(SYSDATE) - i + v_offset, 'Dy'), 1, 1) = 'M' THEN
                v_last_week := NVL(v_last_week, 0) + 1;
                core.set_item('P100_WEEK_' || v_last_week, REGEXP_REPLACE(TO_CHAR(TRUNC(SYSDATE) - i + v_offset, 'Month [IW]'), '\s+,', ','));
            END IF;
        END LOOP;
    END;



    FUNCTION get_offset
    RETURN NUMBER
    AS
    BEGIN
        RETURN 7 - TO_NUMBER(TO_CHAR(TRUNC(SYSDATE), 'D')) + 1;
    END;

END;
/

