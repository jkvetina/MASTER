prompt --application/shared_components/user_interface/lovs/app_applications
begin
--   Manifest
--     APP_APPLICATIONS
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
 p_id=>wwv_flow_imp.id(35274887131559187)  -- LOV: APP_APPLICATIONS
,p_lov_name=>'APP_APPLICATIONS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'APP_LOV_APPLICATIONS_V'
,p_return_column_name=>'APP_ID'
,p_display_column_name=>'APP_NAME'
,p_group_column_name=>'APP_GROUP'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'APP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
