prompt --application/shared_components/user_interface/lovs/app_tracking_users
begin
--   Manifest
--     APP_TRACKING_USERS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(18669935827813045)  -- APP_TRACKING_USERS
,p_lov_name=>'APP_TRACKING_USERS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'APP_LOV_TRACKING_USERS_V'
,p_return_column_name=>'ID'
,p_display_column_name=>'NAME'
,p_group_column_name=>'GROUP_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ORDER#'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
