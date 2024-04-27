prompt --application/shared_components/user_interface/lovs/app_lov_groups
begin
--   Manifest
--     APP_LOV_GROUPS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(5875101171973822)  -- LOV: APP_LOV_GROUPS
,p_lov_name=>'APP_LOV_GROUPS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'    t.lov_group',
'FROM app_lovs t',
'WHERE t.app_id = core.get_app_id();'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'APP_LOVS'
,p_return_column_name=>'LOV_GROUP'
,p_display_column_name=>'LOV_GROUP'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'LOV_GROUP'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
