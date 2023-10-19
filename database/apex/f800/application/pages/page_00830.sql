prompt --application/pages/page_00830
begin
--   Manifest
--     PAGE: 00830
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>830
,p_name=>'Map Components'
,p_alias=>'MAP-COMPONENTS'
,p_step_title=>'Map Components'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(43461648604712360)  -- ADMIN - USERS & ROLES
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.is-readonly span.u-checkbox {',
'    display: none !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(63924538900170215)  -- IS_ADMIN
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp.component_end;
end;
/
