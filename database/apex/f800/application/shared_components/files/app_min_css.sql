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
wwv_flow_imp.g_varchar2_table(1) := '2342414E4E45527B6261636B67726F756E643A233631356435313B636F6C6F723A236666663B70616464696E673A312E3272656D20322E3572656D20312E3572656D3B6D696E2D6865696768743A313872656D3B6D617267696E3A2D3472656D202D3172';
wwv_flow_imp.g_varchar2_table(2) := '656D203172656D7D2342414E4E45522068317B666F6E742D66616D696C793A766172282D2D75742D6865726F2D726567696F6E2D7469746C652D666F6E742D66616D696C79292C73616E732D73657269663B666F6E742D7765696768743A3330303B666F';
wwv_flow_imp.g_varchar2_table(3) := '6E742D73697A653A322E3472656D3B6D617267696E3A3472656D2030202E3572656D21696D706F7274616E747D2342414E4E4552203A3A73656C656374696F6E7B636F6C6F723A236666663B6261636B67726F756E643A233333337D6469762350393939';
wwv_flow_imp.g_varchar2_table(4) := '395F555345524E414D455F6572726F727B636F6C6F723A236666667D627574746F6E234C4F47494E2C627574746F6E234C4F47494E5F474F4F474C457B6D617267696E2D746F703A2E3872656D3B6D617267696E2D72696768743A2E323572656D7D2E44';
wwv_flow_imp.g_varchar2_table(5) := '4953434C41494D45527B6C696E652D6865696768743A313835253B70616464696E673A3020312E3572656D20312E3572656D3B6D617267696E2D746F703A3172656D3B636F6C6F723A233535357D2E612D43617264566965772D686561646572426F6479';
wwv_flow_imp.g_varchar2_table(6) := '2068327B6D617267696E3A307D756C2E742D54616273202E69732D616374697665202E742D546162732D6C696E6B7B626F726465722D626F74746F6D3A36707820736F6C696420233631356435317D756C2E742D54616273206C692E742D546162732D69';
wwv_flow_imp.g_varchar2_table(7) := '74656D20612E742D546162732D6C696E6B3A686F7665727B626F726465722D626F74746F6D3A36707820736F6C6964202336313564353121696D706F7274616E743B636F6C6F723A233030307D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(24662492101303683)
,p_file_name=>'app.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
