prompt --application/pages/page_00820
begin
--   Manifest
--     PAGE: 00820
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>820
,p_name=>'#fa-lock-user Roles'
,p_alias=>'ROLES'
,p_step_title=>'Roles'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(43461648604712360)  -- PAGE GROUP: ADMIN - USERS & ROLES
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(63924538900170215)  -- AUTHORIZATION: IS_ADMIN
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20240101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(121475601310176152)
,p_plug_name=>'Roles'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(121475679482176153)
,p_plug_name=>'Roles for &G_APP_NAME.'
,p_parent_plug_id=>wwv_flow_imp.id(121475601310176152)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(121475778495176154)
,p_plug_name=>'Roles [GRID]'
,p_parent_plug_id=>wwv_flow_imp.id(121475601310176152)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63355525363439097)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'APP_ROLES_V'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
,p_plug_required_role=>wwv_flow_imp.id(43462402185717150)  -- AUTHORIZATION: IS_USER
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Roles [GRID]'
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
 p_id=>wwv_flow_imp.id(76106800374542801)
,p_heading=>'Counters'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(76106923465542802)
,p_heading=>'Flags'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(76107005722542803)
,p_heading=>'Role Info'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(75531169508445193)
,p_name=>'ROLE_GROUP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROLE_GROUP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Role Group'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(76107005722542803)
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
 p_id=>wwv_flow_imp.id(75531333118445194)
,p_name=>'ROLE_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROLE_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Role Desc'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(76107005722542803)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>512
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(75531417754445195)
,p_name=>'ORDER#'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDER#'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Order#'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(76107005722542803)
,p_use_group_for=>'BOTH'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(76106448896542798)
,p_name=>'COUNT_PAGES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT_PAGES'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Pages'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(76106800374542801)
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
 p_id=>wwv_flow_imp.id(76106568664542799)
,p_name=>'COUNT_TABLES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT_TABLES'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Tables'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(76106800374542801)
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
 p_id=>wwv_flow_imp.id(76106676803542800)
,p_name=>'COUNT_USERS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNT_USERS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Users'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(76106800374542801)
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
 p_id=>wwv_flow_imp.id(77274437011458726)
,p_name=>'OLD_ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OLD_ROLE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(121476274427176159)
,p_name=>'ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROLE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Role'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(76107005722542803)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(121476377445176160)
,p_name=>'ROLE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROLE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Role Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(76107005722542803)
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
 p_id=>wwv_flow_imp.id(121476490979176161)
,p_name=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_ACTIVE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Active'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(76106923465542802)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(121479091212176187)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(121476212591176158)
,p_internal_uid=>121476212591176158
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_imp.id(121502615210369309)
,p_interactive_grid_id=>wwv_flow_imp.id(121476212591176158)
,p_static_id=>'464267'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(121502813784369309)
,p_report_id=>wwv_flow_imp.id(121502615210369309)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75537114022447445)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(75531169508445193)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75537976922447451)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(75531333118445194)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75538879631447455)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(75531417754445195)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(76154020501440531)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(76106448896542798)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(76154848456440535)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(76106568664542799)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(76155789950440539)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(76106676803542800)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(77421271733376487)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(77274437011458726)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(121504026326369313)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(121476274427176159)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>240
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(121504882266369316)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(121476377445176160)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>240
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(121505733664369318)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(121476490979176161)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(121522673012438588)
,p_view_id=>wwv_flow_imp.id(121502813784369309)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(121479091212176187)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14650868658174151)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(121475679482176153)
,p_button_name=>'REORDER_ROLES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463317880439166)
,p_button_image_alt=>'Reorder Roles'
,p_button_position=>'RIGHT_OF_TITLE'
,p_icon_css_classes=>'fa-sequence'
,p_security_scheme=>wwv_flow_imp.id(43462402185717150)  -- AUTHORIZATION: IS_USER
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14651216193174151)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(121475679482176153)
,p_button_name=>'ADD_ROLE_WIZARD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463978601439167)
,p_button_image_alt=>'Add Role Wizard'
,p_button_position=>'RIGHT_OF_TITLE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(43462402185717150)  -- AUTHORIZATION: IS_USER
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14659277507174168)
,p_name=>'CHANGE_FILTERS'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P820_CLIENT_ID,P820_ROLE_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14659791386174169)
,p_event_id=>wwv_flow_imp.id(14659277507174168)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(14658474553174166)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(121475778495176154)
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'SAVE_ROLES'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'TSK_P960'
,p_attribute_04=>'SAVE_ROLES'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_security_scheme=>wwv_flow_imp.id(43462402185717150)  -- AUTHORIZATION: IS_USER
,p_internal_uid=>14658474553174166
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(14658864376174168)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'REORDER_ROLES'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'TSK_P960'
,p_attribute_04=>'REORDER_ROLES'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(14650868658174151)
,p_security_scheme=>wwv_flow_imp.id(43462402185717150)  -- AUTHORIZATION: IS_USER
,p_internal_uid=>14658864376174168
);
wwv_flow_imp.component_end;
end;
/
