prompt --application/shared_components/files/app_min_css
begin
--   Manifest
--     APP STATIC FILES: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>13869170895410902
,p_default_application_id=>800
,p_default_id_offset=>13870473903421503
,p_default_owner=>'APPS'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2342414E4E45527B6261636B67726F756E643A233631356435313B636F6C6F723A236666663B70616464696E673A312E3272656D20322E3572656D20312E3572656D3B6D696E2D6865696768743A313872656D3B6D617267696E3A2D342E3572656D202D';
wwv_flow_imp.g_varchar2_table(2) := '312E3572656D20312E3572656D7D2342414E4E45522068317B666F6E742D66616D696C793A224D617465222C73657269663B666F6E742D7765696768743A3330303B666F6E742D73697A653A322E3472656D3B6D617267696E3A3472656D2030202E3572';
wwv_flow_imp.g_varchar2_table(3) := '656D21696D706F7274616E747D2342414E4E455220627574746F6E2E742D427574746F6E2D2D686F747B6261636B67726F756E643A233333337D2342414E4E455220627574746F6E2E742D427574746F6E2D2D686F743A686F7665727B6261636B67726F';
wwv_flow_imp.g_varchar2_table(4) := '756E643A233232327D2342414E4E4552203A3A73656C656374696F6E7B636F6C6F723A236666663B6261636B67726F756E643A233333337D2E444953434C41494D45527B6C696E652D6865696768743A313835253B70616464696E673A3020312E357265';
wwv_flow_imp.g_varchar2_table(5) := '6D20312E3572656D3B6D617267696E2D746F703A3172656D3B636F6C6F723A233535357D2E612D43617264566965772D686561646572426F64792068327B6D617267696E3A307D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(13894207680755441)
,p_file_name=>'app.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
