prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
null;
wwv_flow_imp.component_end;
end;
/
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24881103352645549)
,p_name=>'ACCOUNT_DISABLED'
,p_message_text=>'Your account is disabled.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24880436869631193)
,p_name=>'ACCOUNT_REQUESTED'
,p_message_text=>'Account requested.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24880096391622649)
,p_name=>'ACCOUNT_REQUEST_EXISTS'
,p_message_text=>'Request already exists.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24879743253609889)
,p_name=>'ACCOUNT_REQUEST_INVALID'
,p_message_text=>'Request invalid.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24880292443624019)
,p_name=>'INVALID_EMAIL'
,p_message_text=>'E-mail is not valid.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24880918938644160)
,p_name=>'INVALID_USER'
,p_message_text=>'Invalid username or password.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28679871925515305)
,p_name=>'SESSION_INVALID'
,p_message_text=>'Your session has expired.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24880722931639994)
,p_name=>'SESSION_TIMEOUT'
,p_message_text=>'Your session has ended.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
