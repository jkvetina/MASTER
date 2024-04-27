-- ----------------------------------------
-- Page: 900 - #USER_NAME# > Page Item: P900_EDIT_IMAGE_HOT > Default > SQL Query

SELECT 't-Button--hot' AS css_class
FROM app_users u
WHERE u.user_id = core.get_user_id()
    AND u.avatar_url IS NULL;

-- ----------------------------------------
-- Page: 900 - #USER_NAME# > Page Item: P900_EDIT_PROFILE_HOT > Default > SQL Query

SELECT 't-Button--hot' AS css_class
FROM app_users u
WHERE u.user_id = core.get_user_id()
    AND (
        u.user_name     IS NULL OR
        u.user_title    IS NULL OR
        u.user_nickname IS NULL OR
        u.user_about    IS NULL
    );

