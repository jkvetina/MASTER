prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 801
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>801
,p_default_id_offset=>13873167262449266
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(13911082187706081)
,p_name=>'APP_PREFIX'
,p_value=>'APP_'
,p_is_required=>'Y'
,p_on_upgrade_keep_value=>true
,p_comments=>'Prefix for database objects relevant to this app'
);
wwv_flow_imp.component_end;
end;
/
