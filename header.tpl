{*
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<html{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}>
	<head>
		<meta charset="utf-8" />
		<title>{$meta_title|escape:'html':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:'html':'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:'html':'UTF-8'}" />
{/if}
		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
		<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1, initial-scale=1.0" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
        <link href='http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family=Roboto:400,400italic,500,500italic,700,700italic&subset=latin,greek,cyrillic' rel='stylesheet' type='text/css'>
        <link href='http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family=Roboto+Condensed:400,700&subset=latin,greek,cyrillic' rel='stylesheet' type='text/css'>
{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
		<link rel="stylesheet" href="{$css_uri|escape:'html':'UTF-8'}" type="text/css" media="{$media|escape:'html':'UTF-8'}" />
	{/foreach}
{/if}
{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
	{$js_def}
	{foreach from=$js_files item=js_uri}
	<script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}"></script>
	{/foreach}
{/if}
		{$HOOK_HEADER}		
		<!--[if IE 8]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
	</head>
	<body{if isset($page_name)} id="{$page_name|escape:'html':'UTF-8'}"{/if} class="{if isset($page_name)}{$page_name|escape:'html':'UTF-8'}{/if}{if isset($body_classes) && $body_classes|@count} {implode value=$body_classes separator=' '}{/if}{if $hide_left_column} hide-left-column{else} show-left-column{/if}{if $hide_right_column} hide-right-column{else} show-right-column{/if}{if isset($content_only) && $content_only} content_only{/if} lang_{$lang_iso} {if isset($zroProgressBar) && $zroProgressBar} js-progress-bar{/if} lang_{$lang_iso}">
	{if !isset($content_only) || !$content_only}
		{if isset($restricted_country_mode) && $restricted_country_mode}
			<div id="restricted-country">
				<p>{l s='You cannot place a new order from your country.'}{if isset($geolocation_country) && $geolocation_country} <span class="bold">{$geolocation_country|escape:'html':'UTF-8'}</span>{/if}</p>
			</div>
		{/if}

        <div class="st-menu st-effect-left">
            <div class="st-menu-close">Close</div>
            <div id="nav_sidebar_content" class="nav-sidebar-content">
                <div class="st-menu-title">{l s='Menu'}</div>
                <div id="sidebar_search_content" class="sidebar-search"></div>
                {hook h="displayNav"}
                <div id="sidebar_language_content" class="sidebar-language"></div>
                <div id="sidebar_currency_content" class="sidebar-currency"></div>
            </div>
        </div>

        <div id="page" class="st-pusher {if isset($zroLayout) && $zroLayout == 'boxed'}page-boxed{/if}">
            <div class="header-container">
                <header id="header" class="{if isset($sidebarMenu) && $sidebarMenu}sidebar-menu{/if} {if isset($sidebarMiniCart) && $sidebarMiniCart}sidebar-minicart{/if}">
                    <div class="banner">
                        {hook h="displayBanner"}
                    </div>
                    <div class="main-header clearfix">
                    <div class="container">
                        <div class="header-element" id="header_logo">
                            <a href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}" title="{$shop_name|escape:'html':'UTF-8'}">
                                <img class="logo img-responsive" src="{$logo_url}" alt="{$shop_name|escape:'html':'UTF-8'}"{if isset($logo_image_width) && $logo_image_width} width="{$logo_image_width}"{/if}{if isset($logo_image_height) && $logo_image_height} height="{$logo_image_height}"{/if}/>
                            </a>
                        </div>

                        {if isset($HOOK_TOP)}{$HOOK_TOP}{/if}

                        <div class="header-left-nav" id="left_nav_trigger">
                            <a class="nav-icon">{l s='Navigation'}</a>
                        </div>                        
                    </div>
                    </div>
                    <div class="affix-placeholder"></div>
                    <div class="header-bottom clearfix">
                        {if $page_name !='index' && $page_name !='pagenotfound'}
                            {include file="$tpl_dir./breadcrumb.tpl"}
                        {/if}
                    </div>
                </header>
            </div>
            <div class="columns-container">
                <div id="columns">
                    <div id="top_column" class="top_column">{hook h="displayTopColumn"}</div>

                    <div class="container">
                    <div class="row">
                    <div class="left_center">
                        {if isset($left_column_size) && !empty($left_column_size)}
                        <div id="left_column" class="column col-xs-12 col-sm-3">{$HOOK_LEFT_COLUMN}</div>
                        {/if}
                        {if isset($left_column_size) && isset($right_column_size)}{assign var='cols' value=(12 - $left_column_size - $right_column_size)}{else}{assign var='cols' value=12}{/if}
                        <div id="center_column" class="center_column col-xs-12 col-sm-{$cols|intval}">
	{/if}
