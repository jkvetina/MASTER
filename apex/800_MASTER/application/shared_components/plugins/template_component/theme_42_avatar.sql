prompt --application/shared_components/plugins/template_component/theme_42_avatar
begin
--   Manifest
--     PLUGIN: THEME_42$AVATAR
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>8506563800894011
,p_default_application_id=>705
,p_default_id_offset=>0
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(12290508905710596)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '42')
,p_name=>'THEME_42$AVATAR'
,p_display_name=>'Avatar'
,p_supported_component_types=>'PARTIAL'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('TEMPLATE COMPONENT','THEME_42$AVATAR'),'')
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if APEX$IS_LAZY_LOADING/}',
'  <span class="t-Avatar is-placeholder{if ?SHAPE/} #SHAPE!ATTR#{endif/}{if ?SIZE/} #SIZE!ATTR#{endif/}{if ?CSS_CLASSES/} #CSS_CLASSES!ATTR#{endif/}"></span>',
'{else/}',
'  {if ?LINK/}<a href="#LINK!ATTR#" #LINK_ATTR!RAW#{else/}<span{endif/} class="t-Avatar{if ?TYPE/} t-Avatar--{if ?IMAGE/}image{else/}{if ?INITIALS/}initials{else/}icon{endif/}{endif/}{endif/}{if ?SHAPE/} #SHAPE!ATTR#{endif/}{if ?SIZE/} #SIZE!ATTR#{end'
||'if/}{if ?ICON/} #ICON!ATTR#{else/} fa fa-user{endif/}{if ?CSS_CLASSES/} #CSS_CLASSES!ATTR#{endif/} u-color" {if !IMAGE/}{if DESCRIPTION/} role="img" aria-label="#DESCRIPTION!ATTR#" title="#DESCRIPTION!ATTR#"{else/} role="presentation"{endif/}{endif/}'
||'>{if IMAGE/}<img src="#IMAGE!ATTR#" alt="#DESCRIPTION!ATTR#"{if ?DESCRIPTION/} title="#DESCRIPTION!ATTR#"{endif/} loading="lazy" />{else/}{if ?INITIALS/}#INITIALS!RAW#{endif/}{endif/}{if ?LINK/}</a>{else/}</span>{endif/}',
'{endif/}'))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>2
,p_substitute_attributes=>true
,p_reference_id=>1564363394689414260
,p_subscribe_plugin_settings=>true
,p_help_text=>'Display an image, icon, or initials. Available as a partial template to display a single row.'
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1895662227182502)
,p_plugin_id=>wwv_flow_imp.id(12290508905710596)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'TYPE'
,p_prompt=>'Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'IMAGE'
,p_demo_value=>'IMAGE'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select the type of content that will be displayed in the avatar.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1895160796182499)
,p_plugin_attribute_id=>wwv_flow_imp.id(1895662227182502)
,p_display_sequence=>10
,p_display_value=>'Image'
,p_return_value=>'IMAGE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1894510811182497)
,p_plugin_attribute_id=>wwv_flow_imp.id(1895662227182502)
,p_display_sequence=>20
,p_display_value=>'Initials'
,p_return_value=>'INITIALS'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1893950407182497)
,p_plugin_attribute_id=>wwv_flow_imp.id(1895662227182502)
,p_display_sequence=>30
,p_display_value=>'Icon'
,p_return_value=>'ICON'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1893336421182495)
,p_plugin_id=>wwv_flow_imp.id(12290508905710596)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'IMAGE'
,p_prompt=>'Image'
,p_attribute_type=>'MEDIA'
,p_is_required=>false
,p_demo_value=>'#APEX_FILES#apex_ui/img/favicons/app-artwork-catalog.png'
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1895662227182502)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IMAGE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use the Media popup dialog to select a source for the avatar image.</p>',
'',
'<p>Available options include:',
'<ul>',
'<li>URL</li>',
'<li>BLOB Column</li>',
'<li>URL Column</li>',
'</ul>',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1892816312182494)
,p_plugin_id=>wwv_flow_imp.id(12290508905710596)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>55
,p_static_id=>'DESCRIPTION'
,p_prompt=>'Description'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_help_text=>'Enter a short description of the image/icon or select a source column from the quick pick options. This will be used as title & alt text for the avatar image/icon.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1892360715182493)
,p_plugin_id=>wwv_flow_imp.id(12290508905710596)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'INITIALS'
,p_prompt=>'Initials'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1895662227182502)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'INITIALS'
,p_help_text=>'Select the source column to be displayed within each avatar. Only varchar2 data types are supported.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1891813340182492)
,p_plugin_id=>wwv_flow_imp.id(12290508905710596)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'ICON'
,p_prompt=>'Icon'
,p_attribute_type=>'ICON'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(1895662227182502)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ICON'
,p_help_text=>'Enter an icon class or use the Pick Icon dialog to select the icon you want to add to display in the avatar.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1891284733182491)
,p_plugin_id=>wwv_flow_imp.id(12290508905710596)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'SHAPE'
,p_prompt=>'Shape'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Default'
,p_help_text=>'Select the shape of the avatar. Default inherits the shape set by the containing template.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1890801513182489)
,p_plugin_attribute_id=>wwv_flow_imp.id(1891284733182491)
,p_display_sequence=>10
,p_display_value=>'Rounded'
,p_return_value=>'t-Avatar--rounded'
,p_help_text=>'Displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1890270582182488)
,p_plugin_attribute_id=>wwv_flow_imp.id(1891284733182491)
,p_display_sequence=>20
,p_display_value=>'Circular'
,p_return_value=>'t-Avatar--circle'
,p_help_text=>'Displayed within a circular shape.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1889600004182487)
,p_plugin_attribute_id=>wwv_flow_imp.id(1891284733182491)
,p_display_sequence=>30
,p_display_value=>'Square'
,p_return_value=>'t-Avatar--square'
,p_help_text=>'Displayed within a square shape.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1889059029182486)
,p_plugin_attribute_id=>wwv_flow_imp.id(1891284733182491)
,p_display_sequence=>40
,p_display_value=>'No Shape'
,p_return_value=>'t-Avatar--noShape'
,p_help_text=>'Displayed inline without a containing shape.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1888382375182485)
,p_plugin_id=>wwv_flow_imp.id(12290508905710596)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'SIZE'
,p_prompt=>'Size'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Default'
,p_help_text=>'Set the size of the avatar. The default inherits the sizing set by the containing template.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1887957545182484)
,p_plugin_attribute_id=>wwv_flow_imp.id(1888382375182485)
,p_display_sequence=>10
,p_display_value=>'Extra Extra Small'
,p_return_value=>'t-Avatar--xxs'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1887311484182482)
,p_plugin_attribute_id=>wwv_flow_imp.id(1888382375182485)
,p_display_sequence=>20
,p_display_value=>'Extra Small'
,p_return_value=>'t-Avatar--xs'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1886768052182481)
,p_plugin_attribute_id=>wwv_flow_imp.id(1888382375182485)
,p_display_sequence=>30
,p_display_value=>'Small'
,p_return_value=>'t-Avatar--sm'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1886144588182480)
,p_plugin_attribute_id=>wwv_flow_imp.id(1888382375182485)
,p_display_sequence=>40
,p_display_value=>'Medium'
,p_return_value=>'t-Avatar--md'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1885520188182479)
,p_plugin_attribute_id=>wwv_flow_imp.id(1888382375182485)
,p_display_sequence=>50
,p_display_value=>'Large'
,p_return_value=>'t-Avatar--lg'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1884939261182478)
,p_plugin_attribute_id=>wwv_flow_imp.id(1888382375182485)
,p_display_sequence=>60
,p_display_value=>'Extra Large'
,p_return_value=>'t-Avatar--xl'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1884289039182477)
,p_plugin_attribute_id=>wwv_flow_imp.id(1888382375182485)
,p_display_sequence=>70
,p_display_value=>'Extra Extra Large'
,p_return_value=>'t-Avatar--xxl'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1883693573182476)
,p_plugin_id=>wwv_flow_imp.id(12290508905710596)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'CSS_CLASSES'
,p_prompt=>'CSS Classes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_common=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_help_text=>'Enter classes to add to this component. You may add multiple classes by separating them with a space.'
);
wwv_flow_imp_shared.create_plugin_act_position(
 p_id=>wwv_flow_imp.id(1812341574769824349)
,p_plugin_id=>wwv_flow_imp.id(12290508905710596)
,p_name=>'Link'
,p_static_id=>'LINK'
,p_display_sequence=>10
,p_is_quick_pick=>true
,p_type=>'LINK'
);
wwv_flow_imp.component_end;
end;
/
