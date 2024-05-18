prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(43461472849711906)  -- PAGE GROUP:  MAIN
,p_group_name=>' MAIN'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(24261994233103408)  -- PAGE GROUP: ADMIN - DASHBOARD
,p_group_name=>'ADMIN - DASHBOARD'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(24264527170116211)  -- PAGE GROUP: ADMIN - OTHERS
,p_group_name=>'ADMIN - OTHERS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(24262084363106217)  -- PAGE GROUP: ADMIN - SETTINGS
,p_group_name=>'ADMIN - SETTINGS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(43461648604712360)  -- PAGE GROUP: ADMIN - USERS & ROLES
,p_group_name=>'ADMIN - USERS & ROLES'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(39010006515674313)  -- PAGE GROUP: COOKBOOK
,p_group_name=>'COOKBOOK'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(23033093447426599)  -- PAGE GROUP: QA
,p_group_name=>'QA'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18317012587086665)  -- PAGE GROUP: USER_PROFILE
,p_group_name=>'USER_PROFILE'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(14547468167324179)  -- PAGE GROUP: __ INTERNAL
,p_group_name=>'__ INTERNAL'
);
wwv_flow_imp.component_end;
end;
/
