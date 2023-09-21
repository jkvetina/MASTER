CREATE OR REPLACE FORCE VIEW app_lov_tracking_source_v AS
SELECT ':' AS id,               'Any'  AS name              FROM DUAL UNION ALL
SELECT 'rendering:',            'Rendering'                 FROM DUAL UNION ALL
SELECT 'processing:',           'Processing'                FROM DUAL UNION ALL
SELECT 'processing:rendering:', 'Processing + Rendering'    FROM DUAL UNION ALL
SELECT 'ajax:',                 'AJAX'                      FROM DUAL UNION ALL
SELECT 'auth:',                 'Auth Callback'             FROM DUAL;
--
COMMENT ON TABLE app_lov_tracking_source_v IS '';

