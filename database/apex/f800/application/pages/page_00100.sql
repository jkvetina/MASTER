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
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-CardView-headerBody h2 {',
'  margin: 0;',
'}',
'',
'#WELCOME_BANNER {',
'    background      : #615d51;',
'    color           : #fff;',
'    padding         : 3rem;',
'    height          : 16rem;',
'    margin-top      : -3rem;  /* to hide white bg on page overscroll */',
'}',
'#WELCOME_BANNER h1 {',
'    font-family     : var(--ut-hero-region-title-font-family), sans-serif;',
'    font-weight     : 300;',
'    font-size       : 2rem;',
'    margin          : 3rem 0 0.5rem !important;',
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
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>20
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7475317403048505)
,p_plug_name=>'Applications [CARDS]'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63327898435439081)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(7475571562048507)
,p_card_id=>wwv_flow_imp.id(7475420236048506)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'&APP_LINK.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23519630376581627)
,p_plug_name=>'WELCOME'
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="WELCOME_BANNER">',
'<h1>Welcome, &P100_USER_NAME.</h1>',
'  <p>Current workspace: &P100_WORKSPACE.<p>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
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
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23519786654581628)
,p_name=>'P100_USER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(23519630376581627)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUBSTR(u.user_name, 1, INSTR(u.user_name, '' '') - 1) AS first_name',
'FROM app_users u',
'WHERE u.user_id = core.get_user_id()',
''))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22778700306601017)
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
