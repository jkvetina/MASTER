prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(800)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:LAUNCHPAD:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_imp.id(63460188384439161)
,p_nav_list_template_options=>'#DEFAULT#:js-tabLike'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#master_fonts#MIN#.css?version=#APP_VERSION#',
'#WORKSPACE_FILES#master_menu_top#MIN#.css?version=#APP_VERSION#',
'#WORKSPACE_FILES#master_app#MIN#.css?version=#APP_VERSION#',
'#APP_FILES#app#MIN#.css?version=#APP_VERSION#'))
,p_javascript_file_urls=>'#WORKSPACE_FILES#master_app#MIN#.js?version=#APP_VERSION#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(14517547161424323)  -- LIST: NAVIGATION
,p_nav_bar_list_template_id=>wwv_flow_imp.id(28883453409606801)
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/
