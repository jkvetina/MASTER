prompt --application/pages/page_00905
begin
--   Manifest
--     PAGE: 00905
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>905
,p_name=>'#fa-bell-o Push Notifications'
,p_alias=>'PUSH-NOTIFICATIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Push Notifications'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18317012587086665)  -- USER_PROFILE
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* FIX TEXT ALIGNMENT */',
'#PUSH_NOTIFICATIONS .t-Region-body {',
'    padding: 0 2rem 0.5rem 0.6rem;',
'}',
'',
'/* KEEP CARDS AS TWO COLUMNS */',
'.a-CardView-items--grid2col {',
'    grid-template-columns: repeat(2,minmax(0,1fr)) !important;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(63289183138439042)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--sm'
,p_required_role=>wwv_flow_imp.id(43462402185717150)  -- IS_USER
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24938768455469330)
,p_plug_name=>'Subscribed Devices'
,p_region_css_classes=>'SECOND'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>30
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P905_SUBSCRIBED'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24938887202469331)
,p_plug_name=>'Subscribed Devices [DATA]'
,p_region_name=>'SUBSCRIPTIONS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63327898435439081)
,p_plug_display_sequence=>40
,p_query_type=>'TABLE'
,p_query_table=>'APP_USERS_DEVICES_V'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P905_SUBSCRIBED'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(24940186668469344)
,p_region_id=>wwv_flow_imp.id(24938887202469331)
,p_layout_type=>'GRID'
,p_grid_column_count=>2
,p_title_adv_formatting=>false
,p_title_column_name=>'DEVICE_ID'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CREATED_AT'
,p_body_adv_formatting=>false
,p_body_column_name=>'DOMAIN'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_pk1_column_name=>'PUSH_SUBSCRIPTION_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49627157919894318)
,p_plug_name=>'PUSH_NOTIFICATIONS'
,p_region_name=>'PUSH_NOTIFICATIONS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>20
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(73552484787120959)
,p_plug_name=>'Push Notifications'
,p_parent_plug_id=>wwv_flow_imp.id(49627157919894318)
,p_region_css_classes=>'a-pwaPush--subscriptionRegion'
,p_icon_css_classes=>'fa-bell-o'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(63362861151439101)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Push notifications have to be enabled for each device you want to receive the notifications on. The first time you enable push notifications, you will have to grant permission to your browser. This setting can be changed at any time.'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(73611110584460356)
,p_plug_name=>'Push Notifications Not Supported'
,p_parent_plug_id=>wwv_flow_imp.id(49627157919894318)
,p_region_css_classes=>'a-pwaPush--subscriptionRegion--not-supported'
,p_icon_css_classes=>'fa-bell-slash-o'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_region_attributes=>'style="display:none;"'
,p_plug_template=>wwv_flow_imp.id(63362861151439101)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Push notifications are not currently supported in your browser.'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87142237557933358)
,p_plug_name=>'Push Notifications'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25006313014073201)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(73552484787120959)
,p_button_name=>'INSTALL_PWA'
,p_button_static_id=>'INSTALL_PWA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(63464158031439167)
,p_button_image_alt=>'Install'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-cloud-download'
,p_button_cattributes=>'style="display: none;"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25006777932073202)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(73552484787120959)
,p_button_name=>'SEND_TEST'
,p_button_static_id=>'SEND_TEST'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463978601439167)
,p_button_image_alt=>'Send Test'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P905_SUBSCRIBED'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25003463964006280)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(87142237557933358)
,p_button_name=>'CLOSE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463317880439166)
,p_button_image_alt=>'Close Dialog'
,p_button_position=>'UP'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-pullRight'
,p_icon_css_classes=>'fa-times'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25063447918730014)
,p_name=>'P905_SUBSCRIBED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(87142237557933358)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49156876603720712)
,p_name=>'P905_MESSAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(73552484787120959)
,p_item_default=>'''TEST '' || TO_CHAR(SYSDATE, ''YYYY-MM-DD HH24:MI:SS'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(73555101639120969)
,p_name=>'P905_ENABLE_PUSH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(73552484787120959)
,p_prompt=>'Enable on this device'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>wwv_flow_imp.id(63461560868439163)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(25063529601730015)
,p_computation_sequence=>10
,p_computation_item=>'P905_SUBSCRIBED'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Y''',
'FROM app_users_devices_v',
'WHERE ROWNUM = 1;'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25004083955006299)
,p_name=>'CLOSE_DIALOG'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(25003463964006280)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25004510478006301)
,p_event_id=>wwv_flow_imp.id(25004083955006299)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24940268978469345)
,p_name=>'SEND_TEST_NOTIFICATION'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(25006777932073202)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24940320224469346)
,p_event_id=>wwv_flow_imp.id(24940268978469345)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'core.send_push_notification (',
'    in_title    => ''Test Notification'',',
'    in_message  => ''Message created at '' || TO_CHAR(SYSDATE, ''YYYY-MM-DD HH24:MI''),',
'    in_asap     => TRUE',
');',
''))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24940404504469347)
,p_event_id=>wwv_flow_imp.id(24940268978469345)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#SEND_TEST'').blur();',
'show_success(''Push notification sent.'');',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24940572292469348)
,p_name=>'INSTALL_PWA'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(25006313014073201)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24940681547469349)
,p_event_id=>wwv_flow_imp.id(24940572292469348)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.pwa.openInstallDialog();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25059550714716922)
,p_name=>'SWITCH_PUSH_NOTIFICATIONS'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P905_ENABLE_PUSH'
,p_condition_element=>'P905_ENABLE_PUSH'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25059939640716929)
,p_event_id=>wwv_flow_imp.id(25059550714716922)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Subscribe to push notifications'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.pwa.subscribePushNotifications();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25060490420716930)
,p_event_id=>wwv_flow_imp.id(25059550714716922)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Unsubscribe from push notifications'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.pwa.unsubscribePushNotifications();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25062256531730002)
,p_event_id=>wwv_flow_imp.id(25059550714716922)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'DBMS_SESSION.SLEEP(1);'
,p_attribute_02=>'P905_ENABLE_PUSH'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25062353560730003)
,p_event_id=>wwv_flow_imp.id(25059550714716922)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'DBMS_SESSION.SLEEP(0.5);'
,p_attribute_02=>'P905_ENABLE_PUSH'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24940795482469350)
,p_event_id=>wwv_flow_imp.id(25059550714716922)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24938887202469331)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P905_SUBSCRIBED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25062184738730001)
,p_event_id=>wwv_flow_imp.id(25059550714716922)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24938887202469331)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25063353905730013)
,p_event_id=>wwv_flow_imp.id(25059550714716922)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let add_badge = async () => {',
'    // add red badge to the last card',
'    var $el = $(''#SUBSCRIPTIONS'').find(''li.a-CardView-item:last'');',
'    var badge = ''<div class="a-CardView-badge" style="background: red; color: #fff;" title=""><span class="a-CardView-badgeValue">CURRENT</span></div>'';',
'    $(badge).insertAfter($el.find(''.a-CardView-headerBody''));',
'};',
'delay(250).then(() => add_badge());',
''))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P905_SUBSCRIBED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25063660573730016)
,p_event_id=>wwv_flow_imp.id(25059550714716922)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'location.reload();'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P905_SUBSCRIBED'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25062827562730008)
,p_name=>'SHOW_INSTALL_PWA'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25062998650730009)
,p_event_id=>wwv_flow_imp.id(25062827562730008)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on(''apexreadyend'', function(e) {',
'    let check_install = async () => {',
'        const is_installable = await apex.pwa.isInstallable();',
'        console.log(''INSTALLABLE'', is_installable);',
'        if (is_installable) {',
'            $(''#INSTALL_PWA'').show();',
'        }',
'    };',
'    delay(500).then(() => check_install());',
'});',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25063096140730010)
,p_name=>'SHOW_PUSH_STATUS'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25063195862730011)
,p_event_id=>wwv_flow_imp.id(25063096140730010)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on(''apexreadyend'', function(e) {',
'    let check_push_status = async () => {',
'        let subscription = await apex.pwa.getPushSubscription();',
'        if (subscription) {',
'            // get push_id from server',
'            apex.server.process(''SET_CURRENT_DEVICE'',',
'                {',
'                    x01: subscription.endpoint',
'                },',
'                {',
'                    dataType: ''text'',',
'                    success: function(push_id) {',
'                        push_id = push_id.trim();',
'                        if (push_id) {',
'                            // add red badge',
'                            var $el = $(''#SUBSCRIPTIONS'').find(''li.a-CardView-item[data-id="'' + push_id + ''"]'');',
'                            var badge = ''<div class="a-CardView-badge" style="background: red; color: #fff;" title=""><span class="a-CardView-badgeValue">CURRENT</span></div>'';',
'                            $(badge).insertAfter($el.find(''.a-CardView-headerBody''));',
'',
'                            // make checkbox selected',
'                            $(''#P905_ENABLE_PUSH'').prop(''checked'', ''checked'');',
'                        }',
'                    }',
'                }',
'            );',
'        }',
'    };',
'    delay(200).then(() => check_push_status());',
'});',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25063225985730012)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_CURRENT_DEVICE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FOR c IN (',
'    SELECT t.push_subscription_id',
'    FROM app_users_devices_v t',
'    WHERE t.subscription_interface LIKE ''{"endpoint":"'' || APEX_APPLICATION.G_X01 || ''%''',
') LOOP',
'    HTP.P(c.push_subscription_id);',
'END LOOP;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>25063225985730012
);
wwv_flow_imp.component_end;
end;
/
