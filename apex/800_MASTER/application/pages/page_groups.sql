prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(29590998946290403)  -- PAGE GROUP:  MAIN
,p_group_name=>' MAIN'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(10391520329681905)  -- PAGE GROUP: ADMIN - DASHBOARD
,p_group_name=>'ADMIN - DASHBOARD'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(10394053266694708)  -- PAGE GROUP: ADMIN - OTHERS
,p_group_name=>'ADMIN - OTHERS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(10391610459684714)  -- PAGE GROUP: ADMIN - SETTINGS
,p_group_name=>'ADMIN - SETTINGS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(29591174701290857)  -- PAGE GROUP: ADMIN - USERS & ROLES
,p_group_name=>'ADMIN - USERS & ROLES'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(25139532612252810)  -- PAGE GROUP: COOKBOOK
,p_group_name=>'COOKBOOK'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(9162619544005096)  -- PAGE GROUP: QA
,p_group_name=>'QA'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(4446538683665162)  -- PAGE GROUP: USER_PROFILE
,p_group_name=>'USER_PROFILE'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(676994263902676)  -- PAGE GROUP: __ INTERNAL
,p_group_name=>'__ INTERNAL'
);
wwv_flow_imp.component_end;
end;
/
