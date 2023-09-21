prompt --application/pages/page_00100
begin
--   Manifest
--     PAGE: 00100
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
 p_id=>100
,p_name=>'#fa-navicon'
,p_alias=>'LAUNCHPAD'
,p_step_title=>'&APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(43461472849711906)  --  MAIN
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-CardView-headerBody h2 {',
'  margin: 0;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(43462402185717150)  -- IS_USER
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7475275434048504)
,p_plug_name=>'Applications'
,p_region_css_classes=>'FILTERS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7475317403048505)
,p_plug_name=>'Applications [CARDS]'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63327898435439081)
,p_plug_display_sequence=>20
,p_query_type=>'TABLE'
,p_query_table=>'APP_LAUNCHPAD_V'
,p_query_where=>'workspace = :P100_WORKSPACE'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P100_WORKSPACE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(7475420236048506)
,p_region_id=>wwv_flow_imp.id(7475317403048505)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>true
,p_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="float: right; align-items: flex-start; margin-top: 0.2rem;"><button style="background: transparent; border: 0; margin-right: -0.5rem;"><span class="fa &BADGE_ICON."></span></button></div>',
'<h3 class="a-CardView-title">&APP_NAME.</h3>'))
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>'<span style="font-size: 85%;">&APP_ALIAS., &APP_PREFIX.</span>'
,p_body_adv_formatting=>false
,p_body_column_name=>'APP_DESC'
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'APP_ID'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'APP_ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(7475571562048507)
,p_card_id=>wwv_flow_imp.id(7475420236048506)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'&APP_LINK.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7476159161048513)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7475275434048504)
,p_button_name=>'REFRESH_MV'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463978601439167)
,p_button_image_alt=>'Refresh MV'
,p_button_position=>'RIGHT_OF_TITLE'
,p_security_scheme=>wwv_flow_imp.id(60089834032939902)  -- IS_DEVELOPER
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7475718742048509)
,p_name=>'P100_WORKSPACE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7475275434048504)
,p_prompt=>'Workspace'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'APP_WORKSPACES'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(63461560868439163)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(7476064344048512)
,p_computation_sequence=>10
,p_computation_item=>'P100_WORKSPACE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'core.get_app_workspace()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7475819384048510)
,p_name=>'FILTERS_CHANGED'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_WORKSPACE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7475954697048511)
,p_event_id=>wwv_flow_imp.id(7475819384048510)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7476211481048514)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'REFRESH_MV'
,p_process_sql_clob=>'app.refresh_mv(''APP_NAV%_MV'', in_wait => TRUE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7476159161048513)
,p_security_scheme=>wwv_flow_imp.id(60089834032939902)  -- IS_DEVELOPER
,p_internal_uid=>7476211481048514
);
wwv_flow_imp.component_end;
end;
/
