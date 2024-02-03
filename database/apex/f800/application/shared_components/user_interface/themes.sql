prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(63467056572439181)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(63188215361701831)
,p_default_dialog_template=>wwv_flow_imp.id(63316906146439070)
,p_error_template=>wwv_flow_imp.id(63314363594439068)
,p_printer_friendly_template=>wwv_flow_imp.id(63299541469439061)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(63314363594439068)
,p_default_button_template=>wwv_flow_imp.id(63463978601439167)
,p_default_region_template=>wwv_flow_imp.id(63325094538439079)
,p_default_chart_template=>wwv_flow_imp.id(63362861151439101)
,p_default_form_template=>wwv_flow_imp.id(63362861151439101)
,p_default_reportr_template=>wwv_flow_imp.id(63362861151439101)
,p_default_tabform_template=>wwv_flow_imp.id(63362861151439101)
,p_default_wizard_template=>wwv_flow_imp.id(63362861151439101)
,p_default_menur_template=>wwv_flow_imp.id(63375192142439107)
,p_default_listr_template=>wwv_flow_imp.id(63362861151439101)
,p_default_irr_template=>wwv_flow_imp.id(63355525363439097)
,p_default_report_template=>wwv_flow_imp.id(63426602573439137)
,p_default_label_template=>wwv_flow_imp.id(63461560868439163)
,p_default_menu_template=>wwv_flow_imp.id(63465614388439169)
,p_default_calendar_template=>wwv_flow_imp.id(63465715722439170)
,p_default_list_template=>wwv_flow_imp.id(63451441965439154)
,p_default_nav_list_template=>wwv_flow_imp.id(63460188384439161)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(28883453409606801)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(28883453409606801)
,p_default_nav_list_position=>'TOP'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(63380428289439110)
,p_default_dialogr_template=>wwv_flow_imp.id(63325094538439079)
,p_default_option_label=>wwv_flow_imp.id(63461560868439163)
,p_default_required_label=>wwv_flow_imp.id(63462825478439165)
,p_default_navbar_list_template=>wwv_flow_imp.id(28883453409606801)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/23.2/')
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
