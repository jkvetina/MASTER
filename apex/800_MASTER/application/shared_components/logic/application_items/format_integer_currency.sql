prompt --application/shared_components/logic/application_items/format_integer_currency
begin
--   Manifest
--     APPLICATION ITEM: FORMAT_INTEGER_CURRENCY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(644407096971299)
,p_name=>'FORMAT_INTEGER_CURRENCY'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
