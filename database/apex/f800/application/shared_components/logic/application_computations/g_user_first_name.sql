prompt --application/shared_components/logic/application_computations/g_user_first_name
begin
--   Manifest
--     APPLICATION COMPUTATION: G_USER_FIRST_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(24820593777754818)
,p_computation_sequence=>20
,p_computation_item=>'G_USER_FIRST_NAME'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COALESCE (',
'        u.user_nickname,',
'        SUBSTR(u.user_name, 1, INSTR(u.user_name, '' '') - 1)',
'    ) AS first_name',
'FROM app_users u',
'WHERE u.user_id = core.get_user_id();',
''))
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp.component_end;
end;
/
