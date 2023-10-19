prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 801
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>801
,p_default_id_offset=>13873167262449266
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(14227762307277145)
,p_theme_id=>800
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>63467056572439181
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(13992488231276959)
,p_default_dialog_template=>wwv_flow_imp.id(13980447098276953)
,p_error_template=>wwv_flow_imp.id(13970403551276947)
,p_printer_friendly_template=>wwv_flow_imp.id(13985649764276955)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(13970403551276947)
,p_default_button_template=>wwv_flow_imp.id(14142798738277060)
,p_default_region_template=>wwv_flow_imp.id(14002580469276968)
,p_default_chart_template=>wwv_flow_imp.id(14069127686277005)
,p_default_form_template=>wwv_flow_imp.id(14069127686277005)
,p_default_reportr_template=>wwv_flow_imp.id(14069127686277005)
,p_default_tabform_template=>wwv_flow_imp.id(14069127686277005)
,p_default_wizard_template=>wwv_flow_imp.id(14069127686277005)
,p_default_menur_template=>wwv_flow_imp.id(14081591212277012)
,p_default_listr_template=>wwv_flow_imp.id(14069127686277005)
,p_default_irr_template=>wwv_flow_imp.id(14059377070277000)
,p_default_report_template=>wwv_flow_imp.id(14107389621277030)
,p_default_label_template=>wwv_flow_imp.id(14140267744277053)
,p_default_menu_template=>wwv_flow_imp.id(14144319117277061)
,p_default_calendar_template=>wwv_flow_imp.id(14144420310277062)
,p_default_list_template=>wwv_flow_imp.id(14123795408277041)
,p_default_nav_list_template=>wwv_flow_imp.id(14135937982277048)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(14130134493277045)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(14130134493277045)
,p_default_nav_list_position=>'TOP'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(14005375610276970)
,p_default_dialogr_template=>wwv_flow_imp.id(14002580469276968)
,p_default_option_label=>wwv_flow_imp.id(14140267744277053)
,p_default_required_label=>wwv_flow_imp.id(14141509781277055)
,p_default_navbar_list_template=>wwv_flow_imp.id(14130134493277045)
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
