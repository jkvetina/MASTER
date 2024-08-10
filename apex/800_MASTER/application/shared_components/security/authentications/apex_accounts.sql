prompt --application/shared_components/security/authentications/apex_accounts
begin
--   Manifest
--     AUTHENTICATION: APEX_ACCOUNTS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(63288166491439030)
,p_name=>'APEX_ACCOUNTS'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'/ords/f?p=800:9999:0::::P9999_ERROR:SESSION_INVALID'
,p_logout_url=>'/ords/f?p=800:9999:0'
,p_post_auth_process=>'app_auth.after_auth'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
