prompt --application/create_application
begin
--   Manifest
--     FLOW: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APPS')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Master')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'MASTER')
,p_application_group=>wwv_flow_imp.id(14521455008554600)
,p_application_group_name=>'MASTER'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'9CBCC171912554FE4A8996BCA5DC653BEC59C661B634BF18F954B71B4DA3D6FD'
,p_bookmark_checksum_function=>'SH512'
,p_max_session_length_sec=>32400
,p_on_max_session_timeout_url=>'/ords/f?p=800:9999:0::::P9999_ERROR:SESSION_TIMEOUT'
,p_max_session_idle_sec=>5400
,p_on_max_idle_timeout_url=>'/ords/f?p=800:9999:0::::P9999_ERROR:SESSION_TIMEOUT'
,p_session_timeout_warning_sec=>90
,p_compatibility_mode=>'21.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Created by Jan Kvetina, 2/2022',
'www.jankvetina.cz'))
,p_authentication_id=>wwv_flow_imp.id(63502441622441479)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'&APP_NAME.'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'2024-02-04'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_pass_ecid=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'core.handle_apex_error'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Master'
,p_substitution_string_02=>'APP_DESC'
,p_substitution_string_03=>'APP_PREFIX'
,p_substitution_value_03=>'APP_'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20220101000000'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>98
,p_print_server_type=>'NATIVE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'Y'
,p_pwa_manifest_display=>'fullscreen'
,p_pwa_manifest_orientation=>'any'
,p_pwa_apple_status_bar_style=>'default'
,p_pwa_is_push_enabled=>'Y'
,p_pwa_push_credential_id=>wwv_flow_imp.id(24266049089366575)
,p_pwa_vapid_contact_info=>'jan.kvetina@gmail.com'
);
wwv_flow_imp.component_end;
end;
/
