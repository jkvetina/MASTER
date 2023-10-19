prompt --application/shared_components/logic/application_items/format_date_short
begin
--   Manifest
--     APPLICATION ITEM: FORMAT_DATE_SHORT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(14514281501389786)
,p_name=>'FORMAT_DATE_SHORT'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_imp.component_end;
end;
/
