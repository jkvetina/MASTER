prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 801
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>707
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(354595044827879)
,p_theme_id=>800
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>63467056572439181
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(19363098471195969)
,p_default_dialog_template=>wwv_flow_imp.id(107279835827687)
,p_error_template=>wwv_flow_imp.id(97236288827681)
,p_printer_friendly_template=>wwv_flow_imp.id(112482501827689)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(97236288827681)
,p_default_button_template=>wwv_flow_imp.id(269631475827794)
,p_default_region_template=>wwv_flow_imp.id(129413206827702)
,p_default_chart_template=>wwv_flow_imp.id(195960423827739)
,p_default_form_template=>wwv_flow_imp.id(195960423827739)
,p_default_reportr_template=>wwv_flow_imp.id(195960423827739)
,p_default_tabform_template=>wwv_flow_imp.id(195960423827739)
,p_default_wizard_template=>wwv_flow_imp.id(195960423827739)
,p_default_menur_template=>wwv_flow_imp.id(208423949827746)
,p_default_listr_template=>wwv_flow_imp.id(195960423827739)
,p_default_irr_template=>wwv_flow_imp.id(186209807827734)
,p_default_report_template=>wwv_flow_imp.id(234222358827764)
,p_default_label_template=>wwv_flow_imp.id(267100481827787)
,p_default_menu_template=>wwv_flow_imp.id(271151854827795)
,p_default_calendar_template=>wwv_flow_imp.id(271253047827796)
,p_default_list_template=>wwv_flow_imp.id(250628145827775)
,p_default_nav_list_template=>wwv_flow_imp.id(262770719827782)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(19662225009196189)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(19662225009196189)
,p_default_nav_list_position=>'TOP'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(132208347827704)
,p_default_dialogr_template=>wwv_flow_imp.id(129413206827702)
,p_default_option_label=>wwv_flow_imp.id(267100481827787)
,p_default_required_label=>wwv_flow_imp.id(268342518827789)
,p_default_navbar_list_template=>wwv_flow_imp.id(19662225009196189)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(800),'#APEX_FILES#themes/theme_42/23.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
