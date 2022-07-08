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
{if isset($orderProducts) && count($orderProducts) > 0}
	<div class="crossseling-content">
		<h2>{l s='Customers who bought this product also bought:' mod='blockcart'}</h2>
		<div id="blockcart_list" class="product_list_wrapper columns-slick">
			<ul id="blockcart_caroucel" class="product_base_list grid grid-simple">
				{foreach from=$orderProducts item='orderProduct' name=orderProduct}
					<li class="base_product">
<div class="product-container clearfix">
	<div class="left-block">
		<div class="product-image-container">
			<a class="product_img_link" href="{$orderProduct.link|escape:'html':'UTF-8'}">
				<img class="replace-2x img-responsive" src="{$link->getImageLink($orderProduct.link_rewrite, $orderProduct.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($orderProduct.legend)}{$orderProduct.legend|escape:'html':'UTF-8'}{else}{$orderProduct.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if} />
			</a>
		</div>
	</div>
	<div class="right-block">
		<h5>
			<a class="product-name" href="{$orderProduct.link|escape:'html':'UTF-8'}" title="{$orderProduct.name|escape:'html':'UTF-8'}">
				{$orderProduct.name|truncate:45:'...'|escape:'html':'UTF-8'}
			</a>
		</h5>
		{if $orderProduct.show_price == 1 AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
			<div class="content_price">
				<span class="price product-price">{convertPrice price=$orderProduct.displayed_price}</span>
			</div>
		{/if}
	</div>			
</div><!-- .product-container> -->
					</li>
				{/foreach}
			</ul>
		</div>
	</div>
{/if}