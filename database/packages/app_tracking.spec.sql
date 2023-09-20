CREATE OR REPLACE PACKAGE app_tracking AS

    c_show_days         CONSTANT PLS_INTEGER    := 31;
    c_mv                CONSTANT VARCHAR2(30)   := 'APP_TRC%_MV';



    PROCEDURE init_headers;



    FUNCTION get_offset
    RETURN NUMBER;

END;
/

