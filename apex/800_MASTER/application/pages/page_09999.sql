prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>0
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
,p_group_id=>wwv_flow_imp.id(14547468167324179)  -- PAGE GROUP: __ INTERNAL
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'div#P9999_USERNAME_error {',
'    color           : #fff;',
'}',
'button#LOGIN,',
'button#LOGIN_GOOGLE {',
'    margin-top      : 0.8rem;',
'    margin-right    : 0.25rem;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_is_public_y_n=>'Y'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Gateway to all applications. Login options are available depending on your role and location.',
'',
'If you don''t have account, you can request one in top right corner.',
''))
,p_page_component_map=>'12'
,p_last_updated_by=>'JAN.KVETINA@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20231102194843'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(37391842310003147)
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
 p_id=>wwv_flow_imp.id(61456057030994449)
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
 p_id=>wwv_flow_imp.id(37883028314290247)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(61456057030994449)
,p_button_name=>'LOGIN'
,p_button_static_id=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463978601439167)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_imp.id(60089834032939902)  -- AUTHORIZATION: IS_DEVELOPER
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(37391938651003148)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(61456057030994449)
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
 p_id=>wwv_flow_imp.id(37392168786003150)
,p_name=>'P9999_ERROR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(61456057030994449)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(37881813169290244)
,p_name=>'P9999_USERNAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61456057030994449)
,p_prompt=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(63461560868439163)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_security_scheme=>wwv_flow_imp.id(60089834032939902)  -- AUTHORIZATION: IS_DEVELOPER
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38726642039567408)
,p_name=>'P9999_ERROR_MESSAGE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(61456057030994449)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38727160103567413)
,p_name=>'P9999_SUCCESS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(61456057030994449)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38727607189567418)
,p_name=>'P9999_SUCCESS_MESSAGE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(61456057030994449)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(38726726479567409)
,p_computation_sequence=>10
,p_computation_item=>'P9999_ERROR_MESSAGE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'APEX_LANG.MESSAGE(:P9999_ERROR)'
,p_compute_when=>'P9999_ERROR'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(38727683392567419)
,p_computation_sequence=>20
,p_computation_item=>'P9999_SUCCESS_MESSAGE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'APEX_LANG.MESSAGE(:P9999_SUCCESS)'
,p_compute_when=>'P9999_SUCCESS'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37392261247003151)
,p_name=>'SHOW_ERROR'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P9999_ERROR_MESSAGE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37392349096003152)
,p_event_id=>wwv_flow_imp.id(37392261247003151)
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
'else {',
'    // remove oldschool args',
'    window.history.replaceState(null, null, url.toString().split('':P9999_ERROR:'')[0]);',
'}',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38726871581567410)
,p_event_id=>wwv_flow_imp.id(37392261247003151)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9999_ERROR,P9999_ERROR_MESSAGE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38727272572567414)
,p_name=>'SHOW_SUCCESS'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P9999_SUCCESS_MESSAGE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38727335968567415)
,p_event_id=>wwv_flow_imp.id(38727272572567414)
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
 p_id=>wwv_flow_imp.id(38727380756567416)
,p_event_id=>wwv_flow_imp.id(38727272572567414)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9999_SUCCESS'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(37883346776290247)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'LOGIN'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'LOGIN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_security_scheme=>wwv_flow_imp.id(60089834032939902)  -- AUTHORIZATION: IS_DEVELOPER
,p_internal_uid=>24012872872868744
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(37883847612290250)
,p_page_process_id=>wwv_flow_imp.id(37883346776290247)
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
 p_id=>wwv_flow_imp.id(37884352312290251)
,p_page_process_id=>wwv_flow_imp.id(37883346776290247)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(37884781947290251)
,p_page_process_id=>wwv_flow_imp.id(37883346776290247)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(37887122646290253)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CLEAR_CACHE'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>24016648742868750
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28428595267964214)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LOGOUT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APP_SESSION > 0 AND APEX_AUTHENTICATION.IS_AUTHENTICATED AND UPPER(:APP_USER) != ''NOBODY'' THEN',
'    BEGIN',
'        APEX_AUTHENTICATION.LOGOUT (',
'            p_session_id    => :APP_SESSION,',
'            p_app_id        => core.get_app_id()',
'        );',
'    EXCEPTION',
'    WHEN OTHERS THEN',
'        NULL;',
'    END;',
'    --',
'    BEGIN',
'        APEX_SESSION.DELETE_SESSION(p_session_id => :APP_SESSION);',
'    EXCEPTION',
'    WHEN OTHERS THEN',
'        NULL;',
'    END;',
'',
'--    core.redirect(''/ords/r/apps/master/login?session=0'');',
'    core.redirect(''/ords/f?p=800:9999:0'');',
'--core.raise_error(''REDIRECTING'');',
'    --APEX_CUSTOM_AUTH.SET_SESSION_ID_TO_NEXT_VALUE;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>28428595267964214
);
wwv_flow_imp.component_end;
end;
/
