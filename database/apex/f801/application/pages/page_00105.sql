prompt --application/pages/page_00105
begin
--   Manifest
--     PAGE: 00105
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>801
,p_default_id_offset=>13873167262449266
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>105
,p_name=>'MODAL DIALOG TEMPLATE'
,p_alias=>'MODAL-DIALOG-TEMPLATE'
,p_page_mode=>'MODAL'
,p_step_title=>'MODAL DIALOG TEMPLATE'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42390882959585975)
,p_plug_name=>'&P105_HEADER.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(14035819019276987)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42391038272585976)
,p_plug_name=>'CONTENT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(14002580469276968)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42391082301585977)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(42390882959585975)
,p_button_name=>'CLOSE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(14142008945277056)
,p_button_image_alt=>'Close Dialog'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-pullRight'
,p_icon_css_classes=>'fa-times'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42391446272585980)
,p_name=>'P105_HEADER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(42390882959585975)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(42391554832585981)
,p_computation_sequence=>10
,p_computation_item=>'P105_HEADER'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.page_name',
'FROM apex_application_pages p',
'WHERE p.application_id  = :APP_ID',
'    AND p.page_id       = :APP_PAGE_ID;'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(42391176841585978)
,p_name=>'CLOSE_DIALOG'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(42391082301585977)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42391361725585979)
,p_event_id=>wwv_flow_imp.id(42391176841585978)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp.component_end;
end;
/
