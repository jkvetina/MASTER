prompt --application/pages/page_00902
begin
--   Manifest
--     PAGE: 00902
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
 p_id=>902
,p_name=>'User Avatar'
,p_alias=>'USER-AVATAR'
,p_page_mode=>'MODAL'
,p_step_title=>'User Avatar'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18317012587086665)  -- USER_PROFILE
,p_step_template=>wwv_flow_imp.id(63289183138439042)
,p_page_css_classes=>'DRAWER'
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--sm'
,p_required_role=>wwv_flow_imp.id(43462402185717150)  -- IS_USER
,p_protection_level=>'C'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24622632967821129)
,p_plug_name=>'[FORM]'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63325094538439079)
,p_plug_display_sequence=>20
,p_query_type=>'TABLE'
,p_query_table=>'APP_USERS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86853369392541254)
,p_plug_name=>'User Image'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(63402598617439121)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24624430747821147)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(24622632967821129)
,p_button_name=>'UPDATE_IMAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463978601439167)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update Image'
,p_button_position=>'NEXT'
,p_button_css_classes=>'u-pullRight'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24714630369614153)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(86853369392541254)
,p_button_name=>'CLOSE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(63463317880439166)
,p_button_image_alt=>'Close Dialog'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-pullRight'
,p_icon_css_classes=>'fa-times'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24622858410821131)
,p_name=>'P902_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(24622632967821129)
,p_item_source_plug_id=>wwv_flow_imp.id(24622632967821129)
,p_source=>'USER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24729756495693505)
,p_name=>'P902_AVATAR_BLOB'
,p_source_data_type=>'BLOB'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(24622632967821129)
,p_item_source_plug_id=>wwv_flow_imp.id(24622632967821129)
,p_prompt=>'Upload new profile image'
,p_source=>'AVATAR_BLOB'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(63461560868439163)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_12=>'DROPZONE_INLINE'
,p_attribute_15=>'512000'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24729980353693507)
,p_name=>'P902_AVATAR_MIME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(24622632967821129)
,p_item_source_plug_id=>wwv_flow_imp.id(24622632967821129)
,p_source=>'AVATAR_MIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(24624354931821146)
,p_computation_sequence=>10
,p_computation_item=>'P902_USER_ID'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'core.get_user_id()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24715215966614154)
,p_name=>'CLOSE_DIALOG'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(24714630369614153)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24715746119614155)
,p_event_id=>wwv_flow_imp.id(24715215966614154)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24624547559821148)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(24622632967821129)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'SAVE_PROFILE'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Profile updated'
,p_internal_uid=>24624547559821148
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24622729299821130)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(24622632967821129)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'INIT_FORM'
,p_internal_uid=>24622729299821130
);
wwv_flow_imp.component_end;
end;
/
