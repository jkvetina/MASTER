prompt --application/shared_components/user_interface/lovs/app_page_groups
begin
--   Manifest
--     APP_PAGE_GROUPS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(15549588398414491)  -- LOV: APP_PAGE_GROUPS
,p_lov_name=>'APP_PAGE_GROUPS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'APP_LOV_PAGE_GROUPS_V'
,p_return_column_name=>'PAGE_GROUP'
,p_display_column_name=>'PAGE_GROUP_NAME'
,p_group_column_name=>'GROUP_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ORDER#'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
