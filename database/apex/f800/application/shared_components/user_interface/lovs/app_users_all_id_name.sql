prompt --application/shared_components/user_interface/lovs/app_users_all_id_name
begin
--   Manifest
--     APP_USERS_ALL #ID-NAME
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
 p_id=>wwv_flow_imp.id(18270447043617252)  -- APP_USERS_ALL #ID-NAME
,p_lov_name=>'APP_USERS_ALL #ID-NAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'APP_LOV_USERS_ALL_V'
,p_return_column_name=>'USER_ID'
,p_display_column_name=>'USER_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'USER_NAME'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
