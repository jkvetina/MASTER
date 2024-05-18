prompt --application/shared_components/logic/application_processes/init_defaults
begin
--   Manifest
--     APPLICATION PROCESS: INIT_DEFAULTS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(14610248066357632)
,p_process_sequence=>-10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INIT_DEFAULTS'
,p_process_sql_clob=>'app.init_defaults();'
,p_process_clob_language=>'PLSQL'
,p_version_scn=>41112155962801
);
wwv_flow_imp.component_end;
end;
/
