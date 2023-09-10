prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(43461648604712360)  -- ADMIN
,p_group_name=>'ADMIN'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(43461472849711906)  -- MAIN
,p_group_name=>'MAIN'
);
wwv_flow_imp.component_end;
end;
/
