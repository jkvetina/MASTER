prompt --application/pages/page_00980
begin
--   Manifest
--     PAGE: 00980
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
 p_id=>980
,p_name=>'#fa-question-circle'
,p_alias=>'HELP'
,p_page_mode=>'MODAL'
,p_step_title=>'#fa-question-circle'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(14547468167324179)  -- PAGE GROUP: __ INTERNAL
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.CONTENT {',
'  padding               : 1rem 0;',
'}',
'.CONTENT p,',
'.CONTENT ul li,',
'.CONTENT ul li:before {',
'  font-size             : 1rem;',
'  line-height           : 1.5rem;',
'}',
'.CONTENT ul {',
'  list-style-type       : none;',
'  margin                : 0.5rem 0 0.5rem 3rem;',
'}',
'.CONTENT ul li:before {',
'  content               : ''\2014'';  /* mdash */',
'  content               : ''\2013'';  /* ndash */',
'  position              : absolute;',
'  margin                : 0 3rem 0 -1.5rem;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(63289183138439042)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--sm'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23520192747581632)
,p_plug_name=>'[CONTENT]'
,p_region_css_classes=>'CONTENT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>20
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FOR c IN (',
'    SELECT',
'        p.help_text',
'    FROM apex_application_pages p',
'    WHERE p.application_id  = NVL(:P980_APP_ID,     core.get_app_id())',
'        AND p.page_id       = NVL(:P980_PAGE_ID,    core.get_page_id())',
') LOOP',
'    RETURN APEX_MARKDOWN.TO_HTML(APEX_APPLICATION.DO_SUBSTITUTIONS(c.help_text));',
'END LOOP;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P980_APP_ID,P980_PAGE_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38168018527510827)
,p_plug_name=>'&P980_PAGE_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23520285924581633)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(38168018527510827)
,p_button_name=>'CLOSE_DIALOG'
,p_button_static_id=>'CLOSE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463317880439166)
,p_button_image_alt=>'Close Dialog'
,p_button_position=>'UP'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23520543569581636)
,p_name=>'P980_PAGE_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(38168018527510827)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23520666102581637)
,p_name=>'P980_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(38168018527510827)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25477710036860906)
,p_name=>'P980_APP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(38168018527510827)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(23520739686581638)
,p_computation_sequence=>10
,p_computation_item=>'P980_PAGE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT MAX(',
'    ''Help for '' ||',
'    APEX_APPLICATION.DO_SUBSTITUTIONS (',
'        REPLACE (',
'            CASE WHEN p.page_id IN (9999)',
'                THEN p.page_name',
'                ELSE p.page_title END,',
'            ''&'' || ''APP_NAME.'', p.application_name',
'        )',
'    )) AS title',
'FROM apex_application_pages p',
'WHERE p.application_id  = NVL(:P980_APP_ID,     core.get_app_id())',
'    AND p.page_id       = NVL(:P980_PAGE_ID,    core.get_page_id());',
''))
);
wwv_flow_imp.component_end;
end;
/
