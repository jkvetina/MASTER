prompt --application/shared_components/user_interface/lovs/app_lovs
begin
--   Manifest
--     APP_LOVS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19745855586402324)  -- LOV: APP_LOVS
,p_lov_name=>'APP_LOVS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'    t.lov_group,',
'    t.lov_id',
'FROM app_lovs t',
'WHERE t.app_id          = core.get_app_id()',
'    AND (t.lov_group    = core.get_item(''$LOV_GROUP'') OR core.get_item(''$LOV_GROUP'') IS NULL);'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'LOV_ID'
,p_display_column_name=>'LOV_ID'
,p_group_column_name=>'LOV_GROUP'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'LOV_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
