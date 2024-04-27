prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
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
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11010629449224046)
,p_name=>'ACCOUNT_DISABLED'
,p_message_text=>'Your account is disabled.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11009962966209690)
,p_name=>'ACCOUNT_REQUESTED'
,p_message_text=>'Account requested.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11009622488201146)
,p_name=>'ACCOUNT_REQUEST_EXISTS'
,p_message_text=>'Request already exists.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11009269350188386)
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
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11009818540202516)
,p_name=>'INVALID_EMAIL'
,p_message_text=>'E-mail is not valid.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11010445035222657)
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
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(14809398022093802)
,p_name=>'SESSION_INVALID'
,p_message_text=>'Your session has expired.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11010249028218491)
,p_name=>'SESSION_TIMEOUT'
,p_message_text=>'Your session has ended.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
