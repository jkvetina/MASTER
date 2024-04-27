prompt --application/shared_components/logic/application_processes/fix_first_message
begin
--   Manifest
--     APPLICATION PROCESS: FIX_FIRST_MESSAGE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(22800528879850651)
,p_process_sequence=>-11
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FIX_FIRST_MESSAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- intercept message injected on page (typically after page submit)',
'APEX_JAVASCRIPT.ADD_INLINE_CODE (',
'    p_code => ''',
'var message = $("#APEX_SUCCESS_MESSAGE .t-Alert-content h2.t-Alert-title").text();',
'console.log("MESSAGE INTERCEPTED", message);',
'$("#APEX_SUCCESS_MESSAGE").html("");',
'apex.jQuery(window).on("theme42ready", function() {',
'    show_message(message);',
'});''',
');'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>41112155995571
);
wwv_flow_imp.component_end;
end;
/
