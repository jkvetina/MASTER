prompt --application/shared_components/security/authorizations/is_developer
begin
--   Manifest
--     SECURITY SCHEME: IS_DEVELOPER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(60089834032939902)  -- IS_DEVELOPER
,p_name=>'IS_DEVELOPER'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN core.is_developer();'
,p_error_message=>'ACCESS_DENIED|IS_DEVELOPER'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
