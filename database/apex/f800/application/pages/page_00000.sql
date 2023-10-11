prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
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
 p_id=>0
,p_name=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(14547468167324179)  -- __ INTERNAL
,p_protection_level=>'D'
,p_page_component_map=>'14'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14690651926436120)
,p_plug_name=>'ITEMS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14690402955436118)
,p_name=>'P0_AJAX_PING_INTERVAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(14690651926436120)
,p_source=>'6'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Interval in seconds to fire AJAX_PING process'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23521964459581650)
,p_name=>'P0_HELP_PAGE_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(14690651926436120)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24148870799647501)
,p_name=>'P0_SESSION_TIMEOUT_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(14690651926436120)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_PAGE.GET_URL (',
'    p_application   => 800,',
'    p_page          => 9999,',
'    p_session       => 0,',
'    p_items         => ''P9999_ERROR'',',
'    p_values        => ''SESSION_TIMEOUT''',
')'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27236160043725549)
,p_name=>'P0_SUCCESS_MESSAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14690651926436120)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'For passing messages from modal dialogs'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27236280189725550)
,p_name=>'DIALOG_CLOSED'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27418381649258601)
,p_event_id=>wwv_flow_imp.id(27236280189725550)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (this.data && this.data.successMessage && this.data.successMessage.text) {',
'    show_success(this.data.successMessage.text);',
'}'))
);
wwv_flow_imp.component_end;
end;
/
