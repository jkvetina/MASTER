prompt --application/pages/page_00106
begin
--   Manifest
--     PAGE: 00106
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>707
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>106
,p_name=>'TEMPLATE - Drawer Dialog'
,p_alias=>'TEMPLATE-DRAWER-DIALOG'
,p_page_mode=>'MODAL'
,p_step_title=>'Drawer Dialog'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(44254171767868594)  -- PAGE GROUP:  MAIN
,p_step_template=>wwv_flow_imp.id(86638101827669)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_updated_by=>'JAN.KVETINA@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20231013143022'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104999178733584649)
,p_plug_name=>'&P106_HEADER.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(162651756827721)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104999334046584650)
,p_plug_name=>'CONTENT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(129413206827702)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11959654115290260)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(104999178733584649)
,p_button_name=>'HELP'
,p_button_static_id=>'HELP_BUTTON'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(268841682827790)
,p_button_image_alt=>'Help'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=800:980:&SESSION.::&DEBUG.:980:P980_APP_ID,P980_PAGE_ID:&APP_ID.,&APP_PAGE_ID.'
,p_button_css_classes=>'TRANSPARENT'
,p_icon_css_classes=>'fa-question'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11644910520953181)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(104999178733584649)
,p_button_name=>'CLOSE_DIALOG'
,p_button_static_id=>'CLOSE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(268841682827790)
,p_button_image_alt=>'Close Dialog'
,p_button_position=>'UP'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(105005126233584693)
,p_name=>'P106_HEADER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(104999178733584649)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11646580868953183)
,p_computation_sequence=>10
,p_computation_item=>'P106_HEADER'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.page_name',
'FROM apex_application_pages p',
'WHERE p.application_id  = :APP_ID',
'    AND p.page_id       = :APP_PAGE_ID;'))
);
wwv_flow_imp.component_end;
end;
/
