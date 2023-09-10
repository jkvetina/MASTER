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
,p_name=>'Launchpad'
,p_alias=>'LAUNCHPAD'
,p_step_title=>'Launchpad'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(43461472849711906)  -- MAIN
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7475275434048504)
,p_plug_name=>'Applications'
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
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(7475420236048506)
,p_region_id=>wwv_flow_imp.id(7475317403048505)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>false
,p_title_column_name=>'APP_NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'APP_ALIAS'
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
wwv_flow_imp.component_end;
end;
/
