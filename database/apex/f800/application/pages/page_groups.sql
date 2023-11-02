prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(43461472849711906)  --  MAIN
,p_group_name=>' MAIN'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(24261994233103408)  -- ADMIN - DASHBOARD
,p_group_name=>'ADMIN - DASHBOARD'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(24264527170116211)  -- ADMIN - OTHERS
,p_group_name=>'ADMIN - OTHERS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(24262084363106217)  -- ADMIN - SETTINGS
,p_group_name=>'ADMIN - SETTINGS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(43461648604712360)  -- ADMIN - USERS & ROLES
,p_group_name=>'ADMIN - USERS & ROLES'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(39010006515674313)  -- COOKBOOK
,p_group_name=>'COOKBOOK'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(23033093447426599)  -- QA
,p_group_name=>'QA'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18317012587086665)  -- USER_PROFILE
,p_group_name=>'USER_PROFILE'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(14547468167324179)  -- __ INTERNAL
,p_group_name=>'__ INTERNAL'
);
wwv_flow_imp.component_end;
end;
/
