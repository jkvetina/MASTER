prompt --application/shared_components/logic/application_computations/p0_ajax_ping_interval
begin
--   Manifest
--     APPLICATION COMPUTATION: P0_AJAX_PING_INTERVAL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(24921631853351813)
,p_computation_sequence=>10
,p_computation_item=>'P0_AJAX_PING_INTERVAL'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CASE WHEN core.get_page_is_modal(:APP_ID, :APP_PAGE_ID) = ''Y''',
'    THEN 0',
'    ELSE 6 END'))
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
