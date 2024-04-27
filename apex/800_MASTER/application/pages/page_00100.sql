prompt --application/pages/page_00100
begin
--   Manifest
--     PAGE: 00100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>100
,p_name=>'#fa-navicon'
,p_alias=>'LAUNCHPAD'
,p_step_title=>'&APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(29590998946290403)  -- PAGE GROUP:  MAIN
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const favorite_switch = function(el) {',
'    $el = $(el);',
'    apex.server.process (',
'        ''FAVORITE_SWITCH'',',
'        {',
'            x01: $el.data(''app-id'')',
'        },',
'        {',
'            async       : false,',
'            dataType    : ''json'',',
'            success     : function(data) {',
'                // switch current icon',
'                // @TODO: it would be better to get new icon from server process',
'                var $icon = $el.find(''span.fa'');',
'                if ($icon.hasClass(''fa-heart'')) {',
'                    $icon.removeClass(''fa-heart'');',
'                    $icon.removeClass(''RED'');',
'                    $icon.addClass(''fa-heart-o'');',
'                }',
'                else {',
'                    $icon.removeClass(''fa-heart-o'');',
'                    $icon.addClass(''fa-heart'');',
'                    $icon.addClass(''RED'');',
'                }',
'',
'                // show result',
'                show_message(data);',
'            }',
'        }',
'    );',
'};',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(29591928282295647)  -- AUTHORIZATION: IS_USER
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is the main page, also called Launchpad. It was designed in a way that you can access all applications from one place.',
'',
'- you can see the environment info at top',
'- you can see all applications available to you',
'- you can mark some applications as your favorites',
'- cards contains the application alias and objects prefix in the subtitle',
''))
,p_page_component_map=>'23'
,p_last_updated_by=>'JAN.KVETINA@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20240427185417'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9649156473160124)
,p_plug_name=>'BANNER'
,p_region_name=>'BANNER'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(49454620635017576)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h1>Welcome, &G_USER_FIRST_NAME.</h1>',
'<p>Current workspace: &G_WORKSPACE. | &G_ENV.<p>',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25890074265904300)
,p_plug_name=>'TABS'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(49502113800017603)
,p_plug_display_sequence=>20
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25890226028904301)
,p_plug_name=>'Available Apps'
,p_parent_plug_id=>wwv_flow_imp.id(25890074265904300)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(49454620635017576)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6395198469372999)
,p_plug_name=>'Available Apps'
,p_parent_plug_id=>wwv_flow_imp.id(25890226028904301)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(49532124714017618)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6395156500372998)
,p_plug_name=>'Applications [CARDS]'
,p_parent_plug_id=>wwv_flow_imp.id(25890226028904301)
,p_region_css_classes=>'CARDS6'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(49457424532017578)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'APP_LAUNCHPAD_V'
,p_query_where=>'workspace = :G_WORKSPACE'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6395053667372997)
,p_region_id=>wwv_flow_imp.id(6395156500372998)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>true
,p_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="float: right; align-items: flex-start; margin-top: 0.2rem;"><button type="button" onclick="favorite_switch(this);" data-app-id="&APP_ID." class="a-CardView-button " onclick="console.log(''FAVORITE_SWITCH'')" style="background: transparent; '
||'margin: -0.5rem -0.5rem 0 0; padding: 0.5rem; z-index: 100 !important;"><span class="fa &BADGE_ICON."></span></button></div>',
'<h3 class="a-CardView-title a-lineclamp-2">&APP_NAME.</h3>',
''))
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>'<span class="a-CardView-subTitle">&APP_ALIAS., &APP_PREFIX.</span>'
,p_body_adv_formatting=>false
,p_body_column_name=>'APP_DESC'
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'APP_ID'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'APP_ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(6394902341372996)
,p_card_id=>wwv_flow_imp.id(6395053667372997)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'&APP_LINK.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25890235126904302)
,p_plug_name=>'Favorite Apps'
,p_parent_plug_id=>wwv_flow_imp.id(25890074265904300)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(49454620635017576)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10750681740399611)
,p_plug_name=>'Favorite Apps [CARDS]'
,p_parent_plug_id=>wwv_flow_imp.id(25890235126904302)
,p_region_css_classes=>'CARDS6'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(49457424532017578)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'APP_LAUNCHPAD_V'
,p_query_where=>wwv_flow_string.join(wwv_flow_t_varchar2(
'workspace = :G_WORKSPACE',
'AND is_favorite = ''Y'''))
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(10750755647399612)
,p_region_id=>wwv_flow_imp.id(10750681740399611)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>true
,p_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="float: right; align-items: flex-start; margin-top: 0.2rem;"><button type="button" onclick="favorite_switch(this);" data-app-id="&APP_ID." class="a-CardView-button " onclick="console.log(''FAVORITE_SWITCH'')" style="background: transparent; '
||'margin: -0.5rem -0.5rem 0 0; padding: 0.5rem; z-index: 100 !important;"><span class="fa &BADGE_ICON."></span></button></div>',
'<h3 class="a-CardView-title a-lineclamp-2">&APP_NAME.</h3>',
''))
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>'<span class="a-CardView-subTitle">&APP_ALIAS., &APP_PREFIX.</span>'
,p_body_adv_formatting=>false
,p_body_column_name=>'APP_DESC'
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'APP_ID'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'APP_ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(10750841433399613)
,p_card_id=>wwv_flow_imp.id(10750755647399612)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'&APP_LINK.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10750966426399614)
,p_plug_name=>'Favorite Apps'
,p_parent_plug_id=>wwv_flow_imp.id(25890235126904302)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(49532124714017618)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25890435079904304)
,p_plug_name=>'Missing Apps'
,p_parent_plug_id=>wwv_flow_imp.id(25890074265904300)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(49454620635017576)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_required_role=>wwv_flow_imp.id(46219360129518399)  -- AUTHORIZATION: IS_DEVELOPER
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5276572674063399)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9649156473160124)
,p_button_name=>'TEST_MESSAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(49593504698017664)
,p_button_image_alt=>'Test Message'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6394314742372990)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6395198469372999)
,p_button_name=>'REFRESH_MV'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(49593684128017664)
,p_button_image_alt=>'Refresh MV'
,p_button_position=>'RIGHT_OF_TITLE'
,p_icon_css_classes=>'fa-lock-user'
,p_security_scheme=>wwv_flow_imp.id(46219360129518399)  -- AUTHORIZATION: IS_DEVELOPER
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6394654519372993)
,p_name=>'FILTERS_CHANGED'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_WORKSPACE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6394519206372992)
,p_event_id=>wwv_flow_imp.id(6394654519372993)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5276729437063401)
,p_name=>'TEST_MESSAGE_ON_LOAD'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5276663845063400)
,p_event_id=>wwv_flow_imp.id(5276729437063401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'show_success(''Success Message'');',
'//show_warning(''Warning Message'');',
'//show_error(''Error Message'');'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6394262422372989)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'REFRESH_MV'
,p_process_sql_clob=>'app.refresh_mv(''APP_NAV%_MV'', in_wait => TRUE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6394314742372990)
,p_security_scheme=>wwv_flow_imp.id(46219360129518399)  -- AUTHORIZATION: IS_DEVELOPER
,p_internal_uid=>7476211481048514
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5276361980063397)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TEST_MESSAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--core.send_',
'APEX_JSON.OPEN_OBJECT();',
'APEX_JSON.WRITE(''message'',  SYSDATE);',
'APEX_JSON.WRITE(''status'',   ''ERROR'');        -- SUCCESS, ERROR, WARNING',
'APEX_JSON.CLOSE_OBJECT();',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'{"message":"Error warning","status":"WARNING"}'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5276572674063399)
,p_internal_uid=>8594111923358106
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8908226403179514)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FAVORITE_SWITCH'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'app.favorite_switch (',
'    in_app_id   => APEX_APPLICATION.G_X01,',
'    in_user_id  => core.get_user_id()',
');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>22778700306601017
);
wwv_flow_imp.component_end;
end;
/
