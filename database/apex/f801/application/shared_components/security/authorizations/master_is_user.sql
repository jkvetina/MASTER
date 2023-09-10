prompt --application/shared_components/security/authorizations/master_is_user
begin
--   Manifest
--     SECURITY SCHEME: MASTER - IS_USER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>801
,p_default_id_offset=>13873167262449266
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(50436147934915762)  -- MASTER - IS_USER
,p_name=>'MASTER - IS_USER'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--selct .... app_id = :APP_ID and user = :APP_USER',
'RETURN TRUE;'))
,p_error_message=>'ACCESS_DENIED|USER'
,p_reference_id=>18075374317600391
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/
