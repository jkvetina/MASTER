prompt --application/shared_components/user_interface/lovs/app_contexts
begin
--   Manifest
--     APP_CONTEXTS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19826581500100372)  -- APP_CONTEXTS
,p_lov_name=>'APP_CONTEXTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.*',
'FROM app_contexts t',
'WHERE t.app_id = core.get_app_id();',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'CONTEXT_ID'
,p_display_column_name=>'CONTEXT_NAME'
,p_group_column_name=>'CONTEXT_GROUP'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ORDER#'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
