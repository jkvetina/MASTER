prompt --application/shared_components/logic/application_processes/get_avatar
begin
--   Manifest
--     APPLICATION PROCESS: GET_AVATAR
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
 p_id=>wwv_flow_imp.id(24674842651897136)
,p_process_sequence=>0
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_AVATAR'
,p_process_sql_clob=>'app.download_avatar();'
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_imp.component_end;
end;
/
