-- ----------------------------------------
-- Page: 980 - #fa-question-circle > Computation: P980_PAGE_NAME > Computation > SQL Query

SELECT MAX(
    'Help for ' ||
    APEX_APPLICATION.DO_SUBSTITUTIONS (
        REPLACE (
            CASE WHEN p.page_id IN (9999)
                THEN p.page_name
                ELSE p.page_title END,
            '&' || 'APP_NAME.', p.application_name
        )
    )) AS title
FROM apex_application_pages p
WHERE p.application_id  = NVL(:P980_APP_ID,     core.get_app_id())
    AND p.page_id       = NVL(:P980_PAGE_ID,    core.get_page_id());

