prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
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
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(14547468167324179)  -- __ INTERNAL
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_is_public_y_n=>'Y'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Gateway to all applications. If you don''t have account, you can request one in top right corner.',
''))
,p_page_component_map=>'12'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23521368406581644)
,p_plug_name=>'DISCLAIMER'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p class="DISCLAIMER">Unauthorized access to this system is forbidden and will be',
'prosecuted by law. By accessing this system, you agree that your actions may be monitored if unauthorized usage is suspected. Your IP address, username, browser and other available informations has been logged and has been sent to the server administ'
||'rator. All activities on this system are monitored. Unauthorized access will be fully investigated and reported to the appropriate law enforcement agencies.</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47585583127572946)
,p_plug_name=>'BANNER'
,p_region_name=>'BANNER'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h1>Hey stranger, what is your name?</h1>',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24012554410868744)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(47585583127572946)
,p_button_name=>'LOGIN'
,p_button_static_id=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463978601439167)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23521464747581645)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(47585583127572946)
,p_button_name=>'LOGIN_GOOGLE'
,p_button_static_id=>'LOGIN_GOOGLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(63464158031439167)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign with Google'
,p_button_redirect_url=>'f?p=&APP_ID.:100:&SESSION.:APEX_AUTHENTICATION=GOOGLE:&DEBUG.:::'
,p_icon_css_classes=>'fa-lock-user'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23521694882581647)
,p_name=>'P9999_ERROR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(47585583127572946)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24011339265868741)
,p_name=>'P9999_USERNAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(47585583127572946)
,p_prompt=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(63461560868439163)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24856168136145905)
,p_name=>'P9999_ERROR_MESSAGE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(47585583127572946)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24856686200145910)
,p_name=>'P9999_SUCCESS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(47585583127572946)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24857133286145915)
,p_name=>'P9999_SUCCESS_MESSAGE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(47585583127572946)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(24856252576145906)
,p_computation_sequence=>10
,p_computation_item=>'P9999_ERROR_MESSAGE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CASE :P9999_ERROR',
'    WHEN ''TIMEOUT''              THEN ''Your session has ended.''',
'    WHEN ''INVALID_USER''         THEN ''Invalid username or password.''',
'    WHEN ''ACCOUNT_DISABLED''     THEN ''Your account is disabled.''',
'    ELSE :P9999_ERROR END'))
,p_compute_when=>'P9999_ERROR'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(24857209489145916)
,p_computation_sequence=>20
,p_computation_item=>'P9999_SUCCESS_MESSAGE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CASE :P9999_SUCCESS',
'    WHEN ''ACCOUNT_REQUESTED''    THEN ''Account requested.''',
'    ELSE :P9999_SUCCESS END'))
,p_compute_when=>'P9999_SUCCESS'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(23521787343581648)
,p_name=>'SHOW_ERROR'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P9999_ERROR_MESSAGE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(23521875192581649)
,p_event_id=>wwv_flow_imp.id(23521787343581648)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'show_error(apex.item(''P9999_ERROR_MESSAGE'').getValue());',
'',
'// remove message from browser address',
'let url = new URL(document.location);',
'if (url.searchParams.has(''p9999_error'')) {',
'    url.searchParams.delete(''p9999_error'');',
'    window.history.replaceState(null, null, url.toString().replaceAll(''%3A'', '':'').replaceAll(''%2C'', '',''));',
'}',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24856397678145907)
,p_event_id=>wwv_flow_imp.id(23521787343581648)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9999_ERROR,P9999_ERROR_MESSAGE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24856798669145911)
,p_name=>'SHOW_SUCCESS'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P9999_SUCCESS_MESSAGE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24856862065145912)
,p_event_id=>wwv_flow_imp.id(24856798669145911)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'show_success(apex.item(''P9999_SUCCESS_MESSAGE'').getValue());',
'',
'// remove message from browser address',
'let url = new URL(document.location);',
'if (url.searchParams.has(''p9999_success'')) {',
'    url.searchParams.delete(''p9999_success'');',
'    window.history.replaceState(null, null, url.toString().replaceAll(''%3A'', '':'').replaceAll(''%2C'', '',''));',
'}',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24856906853145913)
,p_event_id=>wwv_flow_imp.id(24856798669145911)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9999_SUCCESS'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24012872872868744)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'LOGIN'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'LOGIN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>24012872872868744
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(24013373708868747)
,p_page_process_id=>wwv_flow_imp.id(24012872872868744)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(24013878408868748)
,p_page_process_id=>wwv_flow_imp.id(24012872872868744)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(24014308043868748)
,p_page_process_id=>wwv_flow_imp.id(24012872872868744)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24016648742868750)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CLEAR_CACHE'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>24016648742868750
);
wwv_flow_imp.component_end;
end;
/
