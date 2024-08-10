prompt --application/shared_components/user_interface/lovs/app_tracking_metrics
begin
--   Manifest
--     APP_TRACKING_METRICS
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
 p_id=>wwv_flow_imp.id(18667581296813041)  -- LOV: APP_TRACKING_METRICS
,p_lov_name=>'APP_TRACKING_METRICS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'APP_LOV_TRACKING_METRICS_V'
,p_return_column_name=>'ID'
,p_display_column_name=>'NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ORDER#'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
