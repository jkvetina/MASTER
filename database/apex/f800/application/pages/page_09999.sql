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
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WELCOME_BANNER {',
'    background      : #615d51;',
'    color           : #fff;',
'    padding         : 2.5rem;',
'    height          : 17rem;',
'    margin-top      : -3rem;  /* to hide white bg on page overscroll */',
'}',
'#WELCOME_BANNER h1 {',
'    font-family     : var(--ut-hero-region-title-font-family), sans-serif;',
'    font-weight     : 300;',
'    font-size       : 2.4rem;',
'    margin          : 3rem 0 0.5rem !important;',
'}',
'#WELCOME_BANNER ::selection {',
'  color             : #fff;',
'  background        : #333;',
'}',
'',
'/* MOVE LOGIN FIELDS INTO BANNER */',
'div#P9999_USERNAME_CONTAINER {',
'    width           : 20rem;',
'    position        : absolute;',
'    left            : 2rem;',
'    top             : 6.5rem;',
'}',
'div#P9999_USERNAME_error {',
'    color           : #fff;',
'}',
'button#LOGIN {',
'    position        : absolute;',
'    left            : 22.5rem;',
'    top             : 7.4rem;',
'}',
'button#LOGIN_GOOGLE {',
'    position        : absolute;',
'    left            : 27.5rem;',
'    top             : 7.4rem;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23521368406581644)
,p_plug_name=>'DISCLAIMER'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p style="line-height: 185%; padding: 1.5rem; color: #555;">Unauthorized access to this system is forbidden and will be',
'prosecuted by law. By accessing this system, you agree that your actions may be monitored if unauthorized usage is suspected. Your IP address, username, browser and other available informations has been logged and has been sent to the server administ'
||'rator. All activities on this system are monitored. Unauthorized access will be fully investigated and reported to the appropriate law enforcement agencies.</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47585583127572946)
,p_plug_name=>'WELCOME'
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="WELCOME_BANNER">',
'<h1>Hey stranger, what is your name?</h1>',
'</div>'))
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
,p_button_redirect_url=>'f?p=&APP_ID.:100:&SESSION.:APEX_AUTHENTICATON=GOOGLE:&DEBUG.:::'
,p_icon_css_classes=>'fa-lock-user'
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
,p_field_template=>wwv_flow_imp.id(63461560868439163)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24011705231868741)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(47585583127572946)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="current-password"'
,p_field_template=>wwv_flow_imp.id(63461237820439162)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(14512796942362028)
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24012123275868743)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(47585583127572946)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(63461237820439162)
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(14512796942362028)
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24014711138868749)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'SEND_LOGIN_USERNAME_COOKIE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>24014711138868749
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(24015279755868749)
,p_page_process_id=>wwv_flow_imp.id(24014711138868749)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(24015755403868749)
,p_page_process_id=>wwv_flow_imp.id(24014711138868749)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24012872872868744)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Login'
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
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
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
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>24016648742868750
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24016261331868750)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>24016261331868750
);
wwv_flow_imp.component_end;
end;
/
