prompt --workspace/credentials/app_800_push_notifications_credentials
begin
--   Manifest
--     CREDENTIAL: App 800 Push Notifications Credentials
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(24266049089366575)
,p_name=>'App 800 Push Notifications Credentials'
,p_static_id=>'App_800_Push_Notifications_Credentials'
,p_authentication_type=>'KEY_PAIR'
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
