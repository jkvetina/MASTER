prompt --application/shared_components/security/authorizations/master_is_user
begin
--   Manifest
--     SECURITY SCHEME: MASTER - IS_USER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>707
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(36562980672466496)  -- AUTHORIZATION: MASTER - IS_USER
,p_name=>'MASTER - IS_USER'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN app_auth.is_user() = ''Y'';'
,p_error_message=>'ACCESS_DENIED|IS_USER'
,p_reference_id=>43462402185717150
,p_caching=>'BY_USER_BY_PAGE_VIEW'
,p_comments=>'This needs to be relevant to active application'
);
wwv_flow_imp.component_end;
end;
/
