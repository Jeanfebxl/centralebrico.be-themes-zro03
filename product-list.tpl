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
{if !isset($nameImage)}
{assign var='nameImage' value='home_default'}
{/if}
{if !isset($shortTruncate)}
{assign var='shortTruncate' value=150}
{/if}

{if isset($products) && $products}
<ul id="{if isset($id) && $id}{$id}{else}product_list{/if}" class="product_list product_base_list {if !isset($class) || $class != 'list'}grid{/if} {if isset($class) && $class}{$class}{/if}">
{foreach from=$products item=product name=products}
	<li class="ajax_block_product base_product">
		<div class="product-container" itemscope itemtype="https://schema.org/Product">
			<div class="left-block">
				<div class="product-image-container">
					<a class="product_img_link" href="{$product.link|escape:'html':'UTF-8'}">
						<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, $nameImage)|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if} itemprop="image" />
					</a>
					<div class="label-box">
						{if isset($product.new) && $product.new == 1}
							<a class="new-box" href="{$product.link|escape:'html':'UTF-8'}">
								<span class="new-label">{l s='New'}</span>
							</a>
						{/if}
						{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
							<a class="sale-box" href="{$product.link|escape:'html':'UTF-8'}">
								<span class="sale-label">{l s='Sale!'}</span>
							</a>
						{/if}
					</div>
					{if isset($quick_view) && $quick_view}
					<div class="quickview for-list-mode">
						<a class="quick-view ajax_quick_view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}" title="{l s='Quick View'}" data-toggle="tooltip" data-placement="top">
							<span>{l s='Quick View'}</span>
						</a>
					</div>
					{/if}
				</div>
				<div class="hover-box">
					{if $page_name != 'index'}
					{if isset($comparator_max_item) && $comparator_max_item}
						<div class="compare">
							<a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}">
							<span>{l s='Add to Compare'}</span>
							</a>
						</div>
					{/if}
					{/if}
					{hook h='displayProductListFunctionalButtons' product=$product}
					{if isset($quick_view) && $quick_view}
					<div class="quickview">
						<a class="quick-view ajax_quick_view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
							<span>{l s='Quick View'}</span>
						</a>
					</div>
					{/if}
				</div>
				{if isset($product.is_virtual) && !$product.is_virtual}{hook h="displayProductDeliveryTime" product=$product}{/if}
				{hook h="displayProductPriceBlock" product=$product type="weight"}
			</div>
			<div class="right-block">
                <h5 itemprop="name">
                    {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
                    <a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
                        {$product.name|escape:'html':'UTF-8'}
                    </a>
                </h5>
                <div class="grid-bottom">
                    <div class="grid-left-bottom">
                        {if (!$PS_CATALOG_MODE && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                            <div class="content_price" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
                                {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
                                    {hook h="displayProductPriceBlock" product=$product type='before_price'}
                                    <meta itemprop="priceCurrency" content="{$currency->iso_code}" />
                                    <meta itemprop="price" content="{if !$priceDisplay}{$product.price}{else}{$product.price_tax_exc}{/if}" />
                                    {if $product.price_without_reduction > 0 && isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
                                        <span class="price product-price special-price">
                                            {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
                                        </span>
                                        {hook h="displayProductPriceBlock" product=$product type="old_price"}
                                        <span class="old-price product-price">{displayWtPrice p=$product.price_without_reduction} </span>
                                        {if $product.specific_prices.reduction_type == 'percentage'}
                                            <span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
                                        {/if}
                                        {if $product.specific_prices.reduction_type == 'amount'}
                                            <span class="price-percent-reduction">-{displayWtPrice p=$product.specific_prices.reduction}</span>
                                        {/if}
                                    {else}
                                        <span class="price product-price">
                                            {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
                                        </span>
                                    {/if}
                                    {if ($product.allow_oosp || $product.quantity > 0)}
                                        <link itemprop="availability" href="https://schema.org/InStock" />
                                    {/if}
                                    {hook h="displayProductPriceBlock" product=$product type="price"}
                                    {hook h="displayProductPriceBlock" product=$product type="unit_price"}
                                    {hook h="displayProductPriceBlock" product=$product type='after_price'}
                                {/if}
                            </div>
                        {/if}
                        {hook h='displayProductListReviews' product=$product}
                    </div>

                    <div class="button-container button-grid">
                        {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE && (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
                            {capture}add=1&amp;id_product={$product.id_product|intval}{if isset($product.id_product_attribute) && $product.id_product_attribute}&amp;ipa={$product.id_product_attribute|intval}{/if}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
                            <a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product-attribute="{$product.id_product_attribute|intval}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity >= 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">
                                <span>{l s='Buy'}</span>
                            </a>
                        {else}
                            <a class="btn btn-default" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View'}">
                                <span>{if (isset($product.customization_required) && $product.customization_required)}{l s='Customize'}{else}{l s='More'}{/if}</span>
                            </a>
                        {/if}
                    </div>
                </div>

                {if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                    {if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
                        <span class="availability">
                            {if ($product.allow_oosp || $product.quantity > 0)}
                                <span class="{if $product.quantity <= 0 && isset($product.allow_oosp) && !$product.allow_oosp}label-danger{elseif $product.quantity <= 0}label-warning{else}label-success{/if}">
                                    {if $product.quantity <= 0}
                                        {if $product.allow_oosp}
                                            {if isset($product.available_later) && $product.available_later}
                                                {$product.available_later}
                                            {else}
                                                {l s='In Stock'}
                                            {/if}
                                        {else}
                                            {l s='Out of stock'}
                                        {/if}
                                    {else}
                                        {if isset($product.available_now) && $product.available_now}
                                            {$product.available_now}
                                        {else}
                                            {l s='In Stock'}
                                        {/if}
                                    {/if}
                                </span>
                            {elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
                                <span class="label-warning">
                                    {l s='Product available with different options'}
                                </span>
                            {else}
                                <span class="label-danger">
                                    {l s='Out of stock'}
                                </span>
                            {/if}
                        </span>
                    {/if}
                {/if}
                <div class="product-flags">
                    {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                        {if isset($product.online_only) && $product.online_only}
                            <span class="online_only">{l s='Online only'}</span>
                        {/if}
                    {/if}
                    {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
                        {elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
                            <span class="discount">{l s='Reduced price!'}</span>
                        {/if}
                </div>
                
                {if isset($product.countdown) && $product.countdown}
                <div class="zcountdown-box clearfix">
                    {include file="./product-countdown-box.tpl" data_countdown=$product.countdown}
                </div>
                {/if}
				
				<p class="product-desc" itemprop="description">
					{$product.description_short|strip_tags:'UTF-8'|truncate:$shortTruncate:'...'}
				</p>
				{if isset($product.color_list)}
					<div class="color-list-container">{$product.color_list}</div>
				{/if}
				
                <div class="absolute-bottom">
                    <div class="button-container button-list">
                        {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE && (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
                            {capture}add=1&amp;id_product={$product.id_product|intval}{if isset($product.id_product_attribute) && $product.id_product_attribute}&amp;ipa={$product.id_product_attribute|intval}{/if}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
                            <a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product-attribute="{$product.id_product_attribute|intval}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity >= 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">
                                <span><i class="icon icon-plus"></i> {l s='Add to cart'}</span>
                            </a>
                        {else}
                            <a class="btn btn-default" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View'}">
                                <span>{if (isset($product.customization_required) && $product.customization_required)}{l s='Customize'}{else}{l s='View Details'}{/if}</span>
                            </a>
                        {/if}
                    </div>
                    <div class="functional-buttons clearfix">
                        {hook h='displayProductListFunctionalButtons' product=$product}
                        {if $page_name != 'index'}
                        {if isset($comparator_max_item) && $comparator_max_item}
                            <div class="compare">
                                <a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}">
                                <span>{l s='Add to Compare'}</span>
                                </a>
                            </div>
                        {/if}
                        {/if}
                    </div>
                </div>
			</div>
		</div><!-- .product-container> -->
	</li>
{/foreach}
</ul>
{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
{/if}
