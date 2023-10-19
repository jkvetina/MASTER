prompt --application/pages/page_00805
begin
--   Manifest
--     PAGE: 00805
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
 p_id=>805
,p_name=>'#fa-users Users'
,p_alias=>'USERS'
,p_step_title=>'Users'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(43461648604712360)  -- ADMIN - USERS & ROLES
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(63924538900170215)  -- IS_ADMIN
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(170183251856532779)
,p_plug_name=>'Users for &G_APP_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(238877430823480028)
,p_plug_name=>'Users [GRID]'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63355525363439097)
,p_plug_display_sequence=>20
,p_query_type=>'TABLE'
,p_query_table=>'APP_USERS_V'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Users [GRID]'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(100830497312882932)
,p_heading=>'Flags'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(100830635308882933)
,p_heading=>'Counters'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(100830646602882934)
,p_heading=>'User Info'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(32260123614663858)
,p_name=>'COUNT_APPS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT_APPS'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Apps'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(100830635308882933)
,p_use_group_for=>'BOTH'
,p_link_target=>'f?p=&APP_ID.:810:&SESSION.::&DEBUG.:810:P810_USER_ID:&USER_ID.'
,p_link_text=>'&COUNT_APPS.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99517560093958668)
,p_name=>'USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(100830646602882934)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>128
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99517709381958669)
,p_name=>'USER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(100830646602882934)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>64
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99656376500579848)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99657919782579863)
,p_name=>'USER_MAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_MAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User Mail'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(100830646602882934)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>128
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(100830947501882937)
,p_name=>'COUNT_ROLES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT_ROLES'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Roles'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(100830635308882933)
,p_use_group_for=>'BOTH'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(145909812434881766)
,p_name=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_ACTIVE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Active'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(100830497312882932)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(238877567638480029)
,p_internal_uid=>238877567638480029
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(239770307375495824)
,p_interactive_grid_id=>wwv_flow_imp.id(238877567638480029)
,p_static_id=>'347276'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>100
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(239770531394495824)
,p_report_id=>wwv_flow_imp.id(239770307375495824)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(39385237207607387)
,p_view_id=>wwv_flow_imp.id(239770531394495824)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(32260123614663858)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99662925546583654)
,p_view_id=>wwv_flow_imp.id(239770531394495824)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(99517560093958668)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99663834551583656)
,p_view_id=>wwv_flow_imp.id(239770531394495824)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(99517709381958669)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99698566902842250)
,p_view_id=>wwv_flow_imp.id(239770531394495824)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(99656376500579848)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99724853034018230)
,p_view_id=>wwv_flow_imp.id(239770531394495824)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(99657919782579863)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(100886361024834123)
,p_view_id=>wwv_flow_imp.id(239770531394495824)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(100830947501882937)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(146038488615349592)
,p_view_id=>wwv_flow_imp.id(239770531394495824)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(145909812434881766)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24782755541615350)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(170183251856532779)
,p_button_name=>'ADD_USER_WIZARD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463978601439167)
,p_button_image_alt=>'Add User Wizard'
,p_button_position=>'RIGHT_OF_TITLE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24788266324615373)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(238877430823480028)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'SAVE_USERS'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'APP_USERS_MAP'
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>24788266324615373
);
wwv_flow_imp.component_end;
end;
/
