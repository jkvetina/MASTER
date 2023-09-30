prompt --application/pages/page_00900
begin
--   Manifest
--     PAGE: 00900
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
 p_id=>900
,p_name=>'&APP_USER.'
,p_alias=>'USER'
,p_step_title=>'User Profile'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18317012587086665)  -- USER_PROFILE
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-CardView-items--row .has-media {',
'    grid-template-columns: 200px minmax(0,var(--a-cv-icon-spacer,44px)) 1fr minmax(0,auto);',
'}',
'.a-CardView-media--body {',
'    margin: 0;',
'}',
'.a-CardView-items--row .a-CardView-media {',
'    align-items: flex-start;',
'    background: transparent;',
'}',
'.a-CardView-mediaImg {',
'    border-radius: 8px;',
'}',
'.a-CardView-mainContent {',
'}',
'',
'#PUSH_NOTIFICATIONS .t-Region-body {',
'    padding: 0 2rem 0.5rem 0.6rem;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(43462402185717150)  -- IS_USER
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'On this page you can set your profile.',
'- change your name and email address',
'- change your avatar',
'- see the roles you have been assigned on current app',
''))
,p_page_component_map=>'23'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24620825912821111)
,p_plug_name=>'APPLICATION_ROLES'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75653747485463881)
,p_plug_name=>'Roles for &G_APP_NAME.'
,p_parent_plug_id=>wwv_flow_imp.id(24620825912821111)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75654026921463884)
,p_plug_name=>'ROLES [CARDS]'
,p_parent_plug_id=>wwv_flow_imp.id(24620825912821111)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63327898435439081)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'APP_USER_ROLES_V'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(14562200093376435)
,p_region_id=>wwv_flow_imp.id(75654026921463884)
,p_layout_type=>'GRID'
,p_grid_column_count=>2
,p_title_adv_formatting=>false
,p_title_column_name=>'ROLE_NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'ROLE_GROUP'
,p_body_adv_formatting=>false
,p_body_column_name=>'ROLE_DESC'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'CONTEXT_ID'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'ROLE_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24621907041821122)
,p_plug_name=>'PUSH_NOTIFICATIONS'
,p_region_name=>'PUSH_NOTIFICATIONS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>10
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24622108084821124)
,p_plug_name=>'Push Notifications'
,p_parent_plug_id=>wwv_flow_imp.id(24621907041821122)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(48547233909047763)
,p_plug_name=>'Push Notifications'
,p_parent_plug_id=>wwv_flow_imp.id(24621907041821122)
,p_region_css_classes=>'a-pwaPush--subscriptionRegion'
,p_icon_css_classes=>'fa-bell-o'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(63362861151439101)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Push notifications have to be enabled for each device you want to receive the notifications on. The first time you enable push notifications, you will have to grant permission to your browser. This setting can be changed at any time.'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(48605859706387160)
,p_plug_name=>'Push Notifications Not Supported'
,p_parent_plug_id=>wwv_flow_imp.id(24621907041821122)
,p_region_css_classes=>'a-pwaPush--subscriptionRegion--not-supported'
,p_icon_css_classes=>'fa-bell-slash-o'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_region_attributes=>'style="display:none;"'
,p_plug_template=>wwv_flow_imp.id(63362861151439101)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Push notifications are not currently supported in your browser.'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24622294394821125)
,p_plug_name=>'USER_PROFILE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24621546834821118)
,p_plug_name=>'User Profile [CARD]'
,p_parent_plug_id=>wwv_flow_imp.id(24622294394821125)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63327898435439081)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'APP_USERS'
,p_query_where=>'user_id = core.get_user_id()'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(24621670954821119)
,p_region_id=>wwv_flow_imp.id(24621546834821118)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>false
,p_title_column_name=>'USER_NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'USER_TITLE'
,p_body_adv_formatting=>false
,p_body_column_name=>'USER_ABOUT'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'AVATAR_BLOB'
,p_media_display_position=>'BODY'
,p_media_sizing=>'FIT'
,p_pk1_column_name=>'USER_ID'
,p_mime_type_column_name=>'AVATAR_MIME'
,p_last_updated_column_name=>'UPDATED_AT'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(24622444162821127)
,p_card_id=>wwv_flow_imp.id(24621670954821119)
,p_action_type=>'MEDIA'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:902:&SESSION.::&DEBUG.:902::'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(24622587883821128)
,p_card_id=>wwv_flow_imp.id(24621670954821119)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:901::'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24621758124821120)
,p_plug_name=>'User Profile'
,p_parent_plug_id=>wwv_flow_imp.id(24622294394821125)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24149004790647503)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(48547233909047763)
,p_button_name=>'INSTALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(63464158031439167)
,p_button_image_alt=>'Install'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-cloud-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24149324030647506)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(48547233909047763)
,p_button_name=>'SEND_TEST'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463978601439167)
,p_button_image_alt=>'Send Test'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24730493665693512)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(24621758124821120)
,p_button_name=>'EDIT_PROFILE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463317880439166)
,p_button_image_alt=>'Edit Profile'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_redirect_url=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:901::'
,p_icon_css_classes=>'fa-clipboard-edit'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24149759321647510)
,p_name=>'P900_MESSAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(48547233909047763)
,p_item_default=>'''TEST '' || TO_CHAR(SYSDATE, ''YYYY-MM-DD HH24:MI:SS'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48547984357047767)
,p_name=>'P900_ENABLE_PUSH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(48547233909047763)
,p_prompt=>'Enable on this device'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>wwv_flow_imp.id(63461560868439163)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(24619825594821101)
,p_computation_sequence=>10
,p_computation_item=>'P900_ENABLE_PUSH'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Y'' AS is_active',
'FROM apex_appl_push_subscriptions t',
'WHERE t.application_id      = core.get_app_id()',
'    AND t.user_name         = core.get_user_id();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14562952563376436)
,p_name=>'CHANGED_PROJECT'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P900_PROJECT_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14563452990376438)
,p_event_id=>wwv_flow_imp.id(14562952563376436)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24279802208673720)
,p_name=>'SWITCH_PUSH_NOTIFICATIONS'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P900_ENABLE_PUSH'
,p_condition_element=>'P900_ENABLE_PUSH'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24280231939673721)
,p_event_id=>wwv_flow_imp.id(24279802208673720)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Subscribe to push notifications'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.pwa.subscribePushNotifications();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24280734870673721)
,p_event_id=>wwv_flow_imp.id(24279802208673720)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Unsubscribe from push notifications'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.pwa.unsubscribePushNotifications();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24149170987647504)
,p_name=>'INSTALL_PWA'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(24149004790647503)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24149244849647505)
,p_event_id=>wwv_flow_imp.id(24149170987647504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.pwa.openInstallDialog();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24624722752821150)
,p_name=>'ON_MODAL_CLOSE'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24729319809693501)
,p_event_id=>wwv_flow_imp.id(24624722752821150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24621546834821118)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24729464791693502)
,p_event_id=>wwv_flow_imp.id(24624722752821150)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'show_success(''Profile updated'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24149410107647507)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SEND_PUSH_NOTIFICATION'
,p_process_name=>'SEND_PUSH_MESSAGE'
,p_attribute_01=>'&APP_USER.'
,p_attribute_02=>'TITLE'
,p_attribute_03=>'MESSAGE &P900_MESSAGE.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(24149324030647506)
,p_process_success_message=>'Push notification sent'
,p_internal_uid=>24149410107647507
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24149503872647508)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND_PUSH_QUEUE'
,p_process_sql_clob=>'apex_pwa.push_queue();'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(24149324030647506)
,p_internal_uid=>24149503872647508
);
wwv_flow_imp.component_end;
end;
/
