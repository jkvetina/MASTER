prompt --application/pages/page_00980
begin
--   Manifest
--     PAGE: 00980
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>980
,p_name=>'#fa-question-circle'
,p_alias=>'HELP'
,p_page_mode=>'MODAL'
,p_step_title=>'#fa-question-circle'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18317012587086665)  -- USER_PROFILE
,p_step_template=>wwv_flow_imp.id(63289183138439042)
,p_page_css_classes=>'DRAWER'
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--sm'
,p_required_role=>wwv_flow_imp.id(43462402185717150)  -- IS_USER
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'25'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23520192747581632)
,p_plug_name=>'[CONTENT]'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding-left: 0.5rem;"'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>20
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FOR c IN (',
'    SELECT',
'        p.help_text',
'    FROM apex_application_pages p',
'    WHERE p.application_id  = :APP_ID',
'        AND p.page_id       = :P980_PAGE_ID',
') LOOP',
'    RETURN APEX_MARKDOWN.TO_HTML(APEX_APPLICATION.DO_SUBSTITUTIONS(c.help_text));',
'END LOOP;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P980_PAGE_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38168018527510827)
,p_plug_name=>'Help for &P980_PAGE_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23520285924581633)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(38168018527510827)
,p_button_name=>'CLOSE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463317880439166)
,p_button_image_alt=>'Close Dialog'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-pullRight'
,p_icon_css_classes=>'fa-times'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23520543569581636)
,p_name=>'P980_PAGE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(38168018527510827)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23520666102581637)
,p_name=>'P980_PAGE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(38168018527510827)
,p_item_default=>'900'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(23520848535581639)
,p_computation_sequence=>10
,p_computation_item=>'P980_PAGE_ID'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P0_HELP_PAGE_ID'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(23520739686581638)
,p_computation_sequence=>20
,p_computation_item=>'P980_PAGE_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    APEX_APPLICATION.DO_SUBSTITUTIONS(p.page_title) AS title',
'FROM apex_application_pages p',
'WHERE p.application_id  = :APP_ID',
'    AND p.page_id       = :P980_PAGE_ID',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(23520338887581634)
,p_name=>'CLOSE_DIALOG'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(23520285924581633)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(23520416020581635)
,p_event_id=>wwv_flow_imp.id(23520338887581634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp.component_end;
end;
/
