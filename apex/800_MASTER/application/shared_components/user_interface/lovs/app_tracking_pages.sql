prompt --application/shared_components/user_interface/lovs/app_tracking_pages
begin
--   Manifest
--     APP_TRACKING_PAGES
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
 p_id=>wwv_flow_imp.id(4797694302391539)  -- LOV: APP_TRACKING_PAGES
,p_lov_name=>'APP_TRACKING_PAGES'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'APP_LOV_TRACKING_PAGES_V'
,p_return_column_name=>'PAGE_ID'
,p_display_column_name=>'PAGE_NAME__'
,p_group_column_name=>'GROUP_NAME'
,p_group_sort_direction=>'ASC_NULLS_FIRST'
,p_default_sort_column_name=>'PAGE_ID'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
