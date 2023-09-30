prompt --application/shared_components/files/app_min_css
begin
--   Manifest
--     APP STATIC FILES: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2342414E4E45527B6261636B67726F756E643A233631356435313B636F6C6F723A236666663B70616464696E673A312E3572656D20322E3572656D3B6D696E2D6865696768743A313772656D3B6D617267696E3A2D3372656D202D3172656D203272656D';
wwv_flow_imp.g_varchar2_table(2) := '7D2342414E4E45522068317B666F6E742D66616D696C793A766172282D2D75742D6865726F2D726567696F6E2D7469746C652D666F6E742D66616D696C79292C73616E732D73657269663B666F6E742D7765696768743A3330303B666F6E742D73697A65';
wwv_flow_imp.g_varchar2_table(3) := '3A322E3472656D3B6D617267696E3A3372656D2030202E3572656D21696D706F7274616E747D2342414E4E4552203A3A73656C656374696F6E7B636F6C6F723A236666663B6261636B67726F756E643A233333337D6469762350393939395F555345524E';
wwv_flow_imp.g_varchar2_table(4) := '414D455F6572726F727B636F6C6F723A236666667D627574746F6E234C4F47494E2C627574746F6E234C4F47494E5F474F4F474C457B6D617267696E2D746F703A2E3872656D7D2E444953434C41494D45527B6C696E652D6865696768743A313835253B';
wwv_flow_imp.g_varchar2_table(5) := '70616464696E673A3020312E3572656D20312E3572656D3B636F6C6F723A233535357D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(24339460482870129)
,p_file_name=>'app.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
