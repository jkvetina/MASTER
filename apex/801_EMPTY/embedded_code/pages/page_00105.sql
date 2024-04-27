-- ----------------------------------------
-- Page: 105 - TEMPLATE - Modal Dialog > Computation: P105_HEADER > Computation > SQL Query

SELECT p.page_name
FROM apex_application_pages p
WHERE p.application_id  = :APP_ID
    AND p.page_id       = :APP_PAGE_ID;

