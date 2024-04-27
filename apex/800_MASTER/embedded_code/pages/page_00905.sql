-- ----------------------------------------
-- Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SWITCH_PUSH_NOTIFICATIONS > Action: Execute Server-side Code > Settings > PL/SQL Code

DBMS_SESSION.SLEEP(1);

-- ----------------------------------------
-- Page: 905 - #fa-bell-o Push Notifications > Process: SET_CURRENT_DEVICE > Source > PL/SQL Code

FOR c IN (
    SELECT t.push_subscription_id
    FROM app_users_devices_v t
    WHERE t.subscription_interface LIKE '{"endpoint":"' || APEX_APPLICATION.G_X01 || '%'
) LOOP
    HTP.P(c.push_subscription_id);
END LOOP;


-- ----------------------------------------
-- Page: 905 - #fa-bell-o Push Notifications > Computation: P905_SUBSCRIBED > Computation > SQL Query

SELECT 'Y'
FROM app_users_devices_v
WHERE ROWNUM = 1;

-- ----------------------------------------
-- Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SWITCH_PUSH_NOTIFICATIONS > Action: Execute Server-side Code > Settings > PL/SQL Code

DBMS_SESSION.SLEEP(0.5);

-- ----------------------------------------
-- Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SEND_TEST_NOTIFICATION > Action: Execute Server-side Code > Settings > PL/SQL Code

core.send_push_notification (
    in_title    => 'Test Notification',
    in_message  => 'Message created at ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'),
    in_asap     => TRUE
);


