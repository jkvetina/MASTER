prompt --application/shared_components/user_interface/lovs/master_lov_users
begin
--   Manifest
--     MASTER - LOV_USERS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>801
,p_default_id_offset=>13873167262449266
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(33802590721448041)  -- MASTER - LOV_USERS
,p_lov_name=>'MASTER - LOV_USERS'
,p_reference_id=>18781697091885858
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'INT_USERS'
,p_return_column_name=>'USER_ID'
,p_display_column_name=>'USER_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'USER_NAME'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
