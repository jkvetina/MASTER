prompt --application/shared_components/files/icons_app_icon_32_png
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
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000000017352474200AECE1CE900000414494441545847ED565D489B67147E128D8956A3462F6C038D1617ADE0BA2E57AD68072BDD62C9F0E7A262584C57586F047F56';
wwv_flow_imp.g_varchar2_table(2) := '51DA326BB5171DD60C59A18D03B3C2B25E141BC54EBA6E95082B74D0D141A7157F82A808125D598CFFC6720E4D48EC67F2291B83E1B909E43DDF39CFFB3CCF39DF27C938746813FF6148F600EC31F06F3220954A111D1D8DB5B5356C6E0A7B5DB4097D3E';
wwv_flow_imp.g_varchar2_table(3) := '1F147239367C3E2E48C58383CEA9994422C1FAFA3A37D46AB5F8E8D429D8ED76FCF5EA95E0AC8902B0B1B181DCDC5C14171763CEEDC67D8703333333DC8C829AA5A5A5C160302051A9C40F77EF626A6A0A292A15D46A35464647B1BABABA7B000B0B0BF8';
wwv_flow_imp.g_varchar2_table(4) := 'EDE953A4A7A773914B972FC366B32136361674F395951598CD665C6B69E1F35F1E3F46797939E2E2E240E0A3A2A20260B7A2788B01BACDD2D2123F483724AA89D201A713393939FC7C734B0B2C160BFF47CAE6E7E7A3AEAE0E972E5EE4F35F9F3C415151';
wwv_flow_imp.g_varchar2_table(5) := '113726809413259532603F6B7E2021002839252505CDCDCD28D4EB99B6DEDE5EB4DEB801AFD78B3F9E3FC7C8C8083E3599F0D5F5EB28282808DCF8F6AD5BB05AAD484A4AC2BB478E40A9543228AA43DEA03A8D57AE607E7E3EC43F820CD45457C3683432';
wwv_flow_imp.g_varchar2_table(6) := '187F54555763F8E54B54565632C504402693F1F1F2F232EAEBEBF1B15E8FD6D656E8743A3EF787DBEDC67777EEA0BDBD9D59090E411392041A8D8675CECECA0AE493F663A3A328371AF189C11052A8BBBB1B6D160B3E3871024D4D4D81B3C1C1415498CD';
wwv_flow_imp.g_varchar2_table(7) := '6C4A9220A207FC09A47B96568B6F3B3AA07963BEE9E969949494E07E57170EA8D521B5C65D2E949595C1E170E0C0FEFD7CE672B9F0D9B973181B1B63198422EC18AE92BBCF9E657311FAD9D95954555531CD345EC1313E3E8E2F1B1BF1B5C582D4D454F6';
wwv_flow_imp.g_varchar2_table(8) := '4CD3D5ABBC03626262049BD39F61019029E50A057E7AF8109A8307415AD28D1A1A1A70FCD8B190A2FDFDFDF8E6E64D7458AD50A954989898C087274F06A6693B04111791C7E301399C97D0DC1C17ADADA94145454548CDCECE4EDCB65AF1E38307484E4E';
wwv_flow_imp.g_varchar2_table(9) := 'C6F7763B6A6B6B111F1FBFEDED23324009B476DFD7E9D075EF1E080C19B0ECCC19984CA690C264D89E9E1E74DA6C88DFB70F85A74F636868685BED05F78010549221313111BF3F7BC64B848AC6C8647847AB0D491F1E1EE6A5939D9DCDBFEF1D3DCA80B7';
wwv_flow_imp.g_varchar2_table(10) := 'BE33444F813F915F420A05FE7CF1E2AD19DE8E5B0672F830B3B775F3ED18003DB0E8F562727232B078C28A4AF98B8B48CFC888A8BF280FF87D505A5ACA2326263E3F7F1E7D7D7DA200479C8260297E7EF4089999996131D0E6D317168A964B3400EA4A23';
wwv_flow_imp.g_varchar2_table(11) := '65696B435E5E1EFB2238687D0F0C0CE08B0B175802B1B12300BC98E472DEF7E4F6848404EEF3B7C703BAB9D3E914FC5A0A07664700A8107D2F10107A13FAF73BBD37FC9F69915CBFAB29104BE76EF276CCC06E9AFCA312EC01F8DF31F01AAFFCCFB0CADA';
wwv_flow_imp.g_varchar2_table(12) := '29CE0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(63490272237439221)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/