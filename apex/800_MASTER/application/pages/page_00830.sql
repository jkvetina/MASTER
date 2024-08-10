prompt --application/pages/page_00830
begin
--   Manifest
--     PAGE: 00830
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>830
,p_name=>'Map Components'
,p_alias=>'MAP-COMPONENTS'
,p_step_title=>'Map Components'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(43461648604712360)  -- PAGE GROUP: ADMIN - USERS & ROLES
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.is-readonly span.u-checkbox {',
'    display: none !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(63924538900170215)  -- AUTHORIZATION: IS_ADMIN
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp.component_end;
end;
/
