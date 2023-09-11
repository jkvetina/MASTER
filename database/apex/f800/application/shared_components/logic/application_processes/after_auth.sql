prompt --application/shared_components/logic/application_processes/after_auth
begin
--   Manifest
--     APPLICATION PROCESS: AFTER_AUTH
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(14610014880346487)
,p_process_sequence=>-10
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFTER_AUTH'
,p_process_sql_clob=>'app.after_auth();'
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp.component_end;
end;
/
