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

{assign var='id_default_wishlist' value=false}
{if $wishlists}
	{foreach name=wl from=$wishlists item=wishlist}
		{if $wishlist.default == 1}
			{assign var='id_default_wishlist' value=$wishlist.id_wishlist}
		{/if}
	{/foreach}
{/if}

{strip}
{addJsDef wishlistProductsJson=$wishlist_products}
{addJsDef idDefaultWishlist=$id_default_wishlist}
{addJsDefL name=loggin_required}{l s='You must be logged in to manage your wishlist.' mod='blockwishlist' js=1}{/addJsDefL}
{addJsDefL name=added_to_wishlist}{l s='The product was successfully added to your wishlist.' mod='blockwishlist' js=1}{/addJsDefL}
{addJsDef mywishlist_url=$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|escape:'quotes':'UTF-8'}
{/strip}


<div class="header-element header-element-right header-wishlist hidden-xs">
	<ul>
        <li><a href="{$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|escape:'html':'UTF-8'}" title="{l s='My wishlists' mod='blockwishlist'}">
            <i class="icon icon-heart"></i>
        </a></li>
    </ul>
</div>