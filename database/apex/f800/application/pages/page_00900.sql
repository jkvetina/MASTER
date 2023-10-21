prompt --application/pages/page_00900
begin
--   Manifest
--     PAGE: 00900
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
 p_id=>900
,p_name=>'&APP_USER.'
,p_alias=>'USER'
,p_step_title=>'User Profile'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18317012587086665)  -- USER_PROFILE
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BANNER {',
'    min-height: 13rem;',
'}',
'',
'.a-CardView-items--row .has-media {',
'    grid-template-columns: 200px minmax(0,var(--a-cv-icon-spacer,44px)) 1fr minmax(0,auto);',
'}',
'.a-CardView-media--body {',
'    margin: 0;',
'}',
'.a-CardView-items--row .a-CardView-media {',
'    align-items: flex-start;',
'    background: transparent;',
'}',
'.a-CardView-mediaImg {',
'    border-radius: 8px;',
'}',
'.a-CardView-mainContent {',
'}',
''))
,p_page_css_classes=>'RIGHT'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(43462402185717150)  -- IS_USER
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'On this page you can set your profile.',
'- change your name and email address',
'- change your avatar',
'- see the roles you have been assigned on current app',
''))
,p_page_component_map=>'23'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24620825912821111)
,p_plug_name=>'APPLICATION_ROLES'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75653747485463881)
,p_plug_name=>'App Roles'
,p_parent_plug_id=>wwv_flow_imp.id(24620825912821111)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75654026921463884)
,p_plug_name=>'App Roles [CARDS]'
,p_parent_plug_id=>wwv_flow_imp.id(24620825912821111)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63327898435439081)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'APP_USER_ROLES_V'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(14562200093376435)
,p_region_id=>wwv_flow_imp.id(75654026921463884)
,p_layout_type=>'GRID'
,p_grid_column_count=>2
,p_title_adv_formatting=>false
,p_title_column_name=>'ROLE_NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'ROLE_GROUP'
,p_body_adv_formatting=>false
,p_body_column_name=>'ROLE_DESC'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'CONTEXT_ID'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'ROLE_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24622294394821125)
,p_plug_name=>'USER_PROFILE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>4
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24621546834821118)
,p_plug_name=>'User Profile [CARD]'
,p_parent_plug_id=>wwv_flow_imp.id(24622294394821125)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63327898435439081)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'APP_USERS'
,p_query_where=>'user_id = core.get_user_id()'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(24621670954821119)
,p_region_id=>wwv_flow_imp.id(24621546834821118)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>false
,p_title_column_name=>'USER_NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'USER_TITLE'
,p_body_adv_formatting=>false
,p_body_column_name=>'USER_ABOUT'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'AVATAR_BLOB'
,p_media_display_position=>'BODY'
,p_media_sizing=>'FIT'
,p_pk1_column_name=>'USER_ID'
,p_mime_type_column_name=>'AVATAR_MIME'
,p_last_updated_column_name=>'UPDATED_AT'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(24622444162821127)
,p_card_id=>wwv_flow_imp.id(24621670954821119)
,p_action_type=>'MEDIA'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:902:&SESSION.::&DEBUG.:902::'
,p_build_option_id=>wwv_flow_imp.id(14512796942362028)
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(24622587883821128)
,p_card_id=>wwv_flow_imp.id(24621670954821119)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:901::'
,p_build_option_id=>wwv_flow_imp.id(14512796942362028)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24621758124821120)
,p_plug_name=>'User Profile'
,p_parent_plug_id=>wwv_flow_imp.id(24622294394821125)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25063859291730018)
,p_plug_name=>'ACHIEVEMENTS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25063922276730019)
,p_plug_name=>'Street Credit [CHART]'
,p_parent_plug_id=>wwv_flow_imp.id(25063859291730018)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="margin-left: 3rem;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'APP_USER_STREET_CREDIT_V'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(25064029507730020)
,p_region_id=>wwv_flow_imp.id(25063922276730019)
,p_chart_type=>'dial'
,p_title=>'Street Credit'
,p_width=>'90'
,p_height=>'100'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_value_text_type=>'percent'
,p_value_format_scaling=>'none'
,p_tooltip_rendered=>'N'
,p_gauge_orientation=>'circular'
,p_gauge_indicator_size=>1
,p_gauge_inner_radius=>.7
,p_gauge_plot_area=>'on'
,p_gauge_start_angle=>90
,p_gauge_angle_extent=>360
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(25064191824730021)
,p_chart_id=>wwv_flow_imp.id(25064029507730020)
,p_seq=>10
,p_name=>'Gauge'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'REQUESTS'
,p_items_max_value=>'MAX_REQUESTS'
,p_items_label_column_name=>'MAX_REQUESTS'
,p_color=>'#222222'
,p_items_label_rendered=>true
,p_items_label_position=>'belowMarker'
,p_gauge_plot_area_color=>'#dddddd'
,p_threshold_display=>'all'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25064471611730024)
,p_plug_name=>'Street Credit'
,p_parent_plug_id=>wwv_flow_imp.id(25063859291730018)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72401475894285964)
,p_plug_name=>'BANNER'
,p_region_name=>'BANNER'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h1>Opportunities don''t happen, you create them.</h1>',
'<!-- &G_USER_FIRST_NAME. -->',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24858567336145929)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(24621758124821120)
,p_button_name=>'EDIT_IMAGE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463317880439166)
,p_button_image_alt=>'Edit Profile Image'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_redirect_url=>'f?p=&APP_ID.:902:&SESSION.::&DEBUG.:902::'
,p_button_css_classes=>'&P900_EDIT_IMAGE_HOT.'
,p_icon_css_classes=>'fa-image'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24730493665693512)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(24621758124821120)
,p_button_name=>'EDIT_PROFILE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463317880439166)
,p_button_image_alt=>'Edit Profile'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_redirect_url=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:901::'
,p_button_css_classes=>'&P900_EDIT_PROFILE_HOT.'
,p_icon_css_classes=>'fa-clipboard-edit'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24859995898145943)
,p_name=>'P900_EDIT_PROFILE_HOT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(24622294394821125)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''t-Button--hot'' AS css_class',
'FROM app_users u',
'WHERE u.user_id = core.get_user_id()',
'    AND (',
'        u.user_name     IS NULL OR',
'        u.user_title    IS NULL OR',
'        u.user_nickname IS NULL OR',
'        u.user_about    IS NULL',
'    );'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24860035774145944)
,p_name=>'P900_EDIT_IMAGE_HOT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(24622294394821125)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''t-Button--hot'' AS css_class',
'FROM app_users u',
'WHERE u.user_id = core.get_user_id()',
'    AND u.avatar_url IS NULL;',
''))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24858692681145930)
,p_name=>'ON_CLOSE_IMAGE'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(24858567336145929)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24729319809693501)
,p_event_id=>wwv_flow_imp.id(24858692681145930)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24621546834821118)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24858366234145927)
,p_event_id=>wwv_flow_imp.id(24858692681145930)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P900_SUCCESS'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P902_SUCCESS'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24858944222145933)
,p_name=>'ON_CLOSE_PROFILE'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(24730493665693512)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24859052395145934)
,p_event_id=>wwv_flow_imp.id(24858944222145933)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P900_SUCCESS'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P901_SUCCESS'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24859242130145936)
,p_event_id=>wwv_flow_imp.id(24858944222145933)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24621546834821118)
);
wwv_flow_imp.component_end;
end;
/
