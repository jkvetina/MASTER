prompt --application/pages/page_00750
begin
--   Manifest
--     PAGE: 00750
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>750
,p_name=>'#fa-bell-o Notifications'
,p_alias=>'NOTIFICATIONS'
,p_step_title=>'Notifications'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(10394053266694708)  -- PAGE GROUP: ADMIN - OTHERS
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(50054064996748712)  -- AUTHORIZATION: IS_ADMIN
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20240101000000'
);
wwv_flow_imp.component_end;
end;
/
