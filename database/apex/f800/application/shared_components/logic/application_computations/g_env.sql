prompt --application/shared_components/logic/application_computations/g_env
begin
--   Manifest
--     APPLICATION COMPUTATION: G_ENV
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
 p_id=>wwv_flow_imp.id(24822088789772975)
,p_computation_sequence=>10
,p_computation_item=>'G_ENV'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'SQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'SUBSTR(SYS_CONTEXT(''USERENV'', ''DB_NAME''), INSTR(SYS_CONTEXT(''USERENV'', ''DB_NAME''), ''_'') + 1)'
);
wwv_flow_imp.component_end;
end;
/
