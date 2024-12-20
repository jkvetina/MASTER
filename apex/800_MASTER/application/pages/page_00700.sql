prompt --application/pages/page_00700
begin
--   Manifest
--     PAGE: 00700
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
 p_id=>700
,p_name=>'QA'
,p_alias=>'QA'
,p_step_title=>'Quality Assurance'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(23033093447426599)  -- PAGE GROUP: QA
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(60089834032939902)  -- AUTHORIZATION: IS_DEVELOPER
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30510142359473125)
,p_plug_name=>'Quality Assurance'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
