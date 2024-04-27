// ----------------------------------------
// Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SWITCH_PUSH_NOTIFICATIONS > Action: Execute JavaScript Code > Settings > Code

location.reload();

// ----------------------------------------
// Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: INSTALL_PWA > Action: Execute JavaScript Code > Settings > Code

apex.pwa.openInstallDialog();

// ----------------------------------------
// Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SWITCH_PUSH_NOTIFICATIONS > Action: Subscribe to push notifications > Settings > Code

apex.pwa.subscribePushNotifications();

// ----------------------------------------
// Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SEND_TEST_NOTIFICATION > Action: Execute JavaScript Code > Settings > Code

$('#SEND_TEST').blur();
show_success('Push notification sent.');


// ----------------------------------------
// Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SWITCH_PUSH_NOTIFICATIONS > Action: Execute JavaScript Code > Settings > Code

let add_badge = async () => {
    // add red badge to the last card
    var $el = $('#SUBSCRIPTIONS').find('li.a-CardView-item:last');
    var badge = '<div class="a-CardView-badge" style="background: red; color: #fff;" title=""><span class="a-CardView-badgeValue">CURRENT</span></div>';
    $(badge).insertAfter($el.find('.a-CardView-headerBody'));
};
delay(250).then(() => add_badge());


// ----------------------------------------
// Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SWITCH_PUSH_NOTIFICATIONS > Action: Unsubscribe from push notifications > Settings > Code

apex.pwa.unsubscribePushNotifications();

// ----------------------------------------
// Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SHOW_PUSH_STATUS > Action: Execute JavaScript Code > Settings > Code

apex.jQuery(apex.gPageContext$).on('apexreadyend', function(e) {
    let check_push_status = async () => {
        let subscription = await apex.pwa.getPushSubscription();
        if (subscription) {
            // get push_id from server
            apex.server.process('SET_CURRENT_DEVICE',
                {
                    x01: subscription.endpoint
                },
                {
                    dataType: 'text',
                    success: function(push_id) {
                        push_id = push_id.trim();
                        if (push_id) {
                            // add red badge
                            var $el = $('#SUBSCRIPTIONS').find('li.a-CardView-item[data-id="' + push_id + '"]');
                            var badge = '<div class="a-CardView-badge" style="background: red; color: #fff;" title=""><span class="a-CardView-badgeValue">CURRENT</span></div>';
                            $(badge).insertAfter($el.find('.a-CardView-headerBody'));

                            // make checkbox selected
                            $('#P905_ENABLE_PUSH').prop('checked', 'checked');
                        }
                    }
                }
            );
        }
    };
    delay(200).then(() => check_push_status());
});


// ----------------------------------------
// Page: 905 - #fa-bell-o Push Notifications > Dynamic Action: SHOW_INSTALL_PWA > Action: Execute JavaScript Code > Settings > Code

apex.jQuery(apex.gPageContext$).on('apexreadyend', function(e) {
    let check_install = async () => {
        const is_installable = await apex.pwa.isInstallable();
        console.log('INSTALLABLE', is_installable);
        if (is_installable) {
            $('#INSTALL_PWA').show();
        }
    };
    delay(500).then(() => check_install());
});


