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
{if isset($orderProducts) && count($orderProducts)}
    <section id="crossselling" class="page-product-box">
    	<h3 class="productscategory_h2 page-product-heading">
            {if $page_name == 'product'}
                {l s='Also Bought Products' mod='crossselling'}
            {else}
                {l s='We recommend' mod='crossselling'}
            {/if}
        </h3>
    	<div id="crossselling_list">
			<div class="product_list_wrapper columns-slick">
				<ul class="product_base_list grid grid-simple" id="crossselling_list_slick">
				{foreach from=$orderProducts item='orderProduct' name=orderProduct}
					<li class="base_product">
<div class="product-container clearfix">
	<div class="left-block">
		<div class="product-image-container">
			<a class="product_img_link" href="{$orderProduct.link|escape:'html':'UTF-8'}">
				<img class="replace-2x img-responsive" src="{$link->getImageLink($orderProduct.link_rewrite, $orderProduct.id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="{if !empty($orderProduct.legend)}{$orderProduct.legend|escape:'html':'UTF-8'}{else}{$orderProduct.name|escape:'html':'UTF-8'}{/if}" {if isset($mediumSize)} width="{$mediumSize.width}" height="{$mediumSize.height}"{/if} />
			</a>
		</div>
	</div>
	<div class="right-block">
		<h5>
			{if isset($orderProduct.pack_quantity) && $orderProduct.pack_quantity}{$orderProduct.pack_quantity|intval|cat:' x '}{/if}
			<a class="product-name" href="{$orderProduct.link|escape:'html':'UTF-8'}" title="{$orderProduct.name|escape:'html':'UTF-8'}">
				{$orderProduct.name|truncate:45:'...'|escape:'html':'UTF-8'}
			</a>
		</h5>
		{if $crossDisplayPrice AND $orderProduct.show_price == 1 AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
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
    </section>

{assign var='slidesToShow' value=5}
{if $page_name == 'product'}
{assign var='slidesToShow' value=4}
{/if}
<script type="text/javascript">
    $(document).ready(function() {
      $('#crossselling_list_slick').slick({
        slidesToShow: {$slidesToShow|intval},
		slidesToScroll: {$slidesToShow|intval},
		adaptiveHeight: true,
		infinite: true,
		speed: 1000,
		autoplay: false,
		dots: false,
		arrows: true,
		responsive: [
			{
			  breakpoint: 992,
			  settings: {
				slidesToShow: {math equation="min(3, $slidesToShow)"},
				slidesToScroll: {math equation="min(3, $slidesToShow)"},
			  }
			},
			{
			  breakpoint: 768,
			  settings: {
				slidesToShow: 2,
				slidesToScroll: 2
			  }
			}
		],
      });
    });
</script>
{/if}
