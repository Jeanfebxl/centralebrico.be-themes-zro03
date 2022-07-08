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
{if isset($products) && $products}
<!-- Products list sidebar -->
<ul{if isset($id) && $id} id="{$id}"{/if} class="product_sidebar product_base_list">
{foreach from=$products item=product name=products}
	<li class="sidebar_block_product base_product">
		<div class="product-container">
			<div class="left-block">
				<div class="product-image-container">
					<a class="product_img_link" href="{$product.link|escape:'html':'UTF-8'}">
						<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($mediumSize)} width="{$mediumSize.width}" height="{$mediumSize.height}"{/if} />
					</a>
				</div>
			</div>
			<div class="right-block">
				<h5>
					{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
					<a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">
						{$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
					</a>
				</h5>
				{if (!$PS_CATALOG_MODE && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
					<div class="content_price">
						{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
							{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
								<span class="price product-price special-price">
                                    {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
                                </span>
								<span class="old-price product-price">{displayWtPrice p=$product.price_without_reduction}</span>
								{if $product.specific_prices.reduction_type == 'percentage'}
									<span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
								{/if}
                            {else}
                                <span class="price product-price">
								{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
							</span>
							{/if}
						{/if}
					</div>
				{/if}

				{if isset($product.countdown) && $product.countdown}
                <div class="zcountdown-box clearfix">
                    {include file="./product-countdown-box.tpl" data_countdown=$product.countdown}
                </div>
                {/if}
			</div>				
		</div><!-- .product-container> -->
	</li>
{/foreach}
</ul>
{/if}
