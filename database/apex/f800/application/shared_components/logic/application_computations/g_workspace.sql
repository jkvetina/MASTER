prompt --application/shared_components/logic/application_computations/g_workspace
begin
--   Manifest
--     APPLICATION COMPUTATION: G_WORKSPACE
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
 p_id=>wwv_flow_imp.id(24820243305751455)
,p_computation_sequence=>10
,p_computation_item=>'G_WORKSPACE'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'core.get_app_workspace()'
);
wwv_flow_imp.component_end;
end;
/
