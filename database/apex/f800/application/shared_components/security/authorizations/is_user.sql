prompt --application/shared_components/security/authorizations/is_user
begin
--   Manifest
--     SECURITY SCHEME: IS_USER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(43462402185717150)  -- IS_USER
,p_name=>'IS_USER'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--selct .... app_id = :APP_ID and user = :APP_USER',
'RETURN TRUE;'))
,p_error_message=>'ACCESS_DENIED|USER'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/
