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
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license   http://opensource.org/licenses/afl-3.0.php Academic Free License (AFL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
<!-- Block languages module -->
{if count($languages) > 1}
	<div id="languages-block-top" class="header-element header-element-right hidden-xs">
    <div class="languages-block-top">
		{foreach from=$languages key=k item=language name="languages"}
			{if $language.iso_code == $lang_iso}
				<div class="current">
                    <span class="cur-label">{l s='Language' mod='blocklanguages'}:</span>
					<span class="cur-name">
                        <img alt="{$language.iso_code}" src="{$img_lang_dir}{$language.id_lang}.jpg" />
                        {$language.iso_code}
                    </span>
				</div>
			{/if}
		{/foreach}
		<ul id="first-languages" class="languages-block_ul toogle_content">
			{foreach from=$languages key=k item=language name="languages"}
				<li {if $language.iso_code == $lang_iso}class="selected"{/if}>
				{if $language.iso_code != $lang_iso}
					{assign var=indice_lang value=$language.id_lang}
					{if isset($lang_rewrite_urls.$indice_lang)}
						<a href="{$lang_rewrite_urls.$indice_lang|escape:'html':'UTF-8'}" title="{$language.name|escape:'html':'UTF-8'}" rel="alternate" hreflang="{$language.iso_code|escape:'html':'UTF-8'}">
					{else}
						<a href="{$link->getLanguageLink($language.id_lang)|escape:'html':'UTF-8'}" title="{$language.name|escape:'html':'UTF-8'}" rel="alternate" hreflang="{$language.iso_code|escape:'html':'UTF-8'}">
					{/if}
				{/if}
                        <img alt="{$language.iso_code}" src="{$img_lang_dir}{$language.id_lang}.jpg" />
						<span title="{$language.name}">{$language.iso_code}</span>
				{if $language.iso_code != $lang_iso}
					</a>
				{/if}
				</li>
			{/foreach}
		</ul>
	</div>
	</div>
{/if}
<!-- /Block languages module -->
