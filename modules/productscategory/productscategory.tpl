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
{if count($categoryProducts) > 0 && $categoryProducts !== false}
<section class="page-product-box blockproductscategory">
	<h3 class="productscategory_h3 page-product-heading">
		{if $categoryProducts|@count == 1}
			{l s='%s other product in the same category' sprintf=[$categoryProducts|@count] mod='productscategory'}
		{else}
			{l s='%s other products in the same category' sprintf=[$categoryProducts|@count] mod='productscategory'}
		{/if}
	</h3>
	<div id="productscategory_list" class="clearfix">
		<div class="product_list_wrapper columns-slick">
			<ul class="product_base_list grid grid-simple" id="productscategory_list_slick">
			{foreach from=$categoryProducts item='categoryProduct' name=categoryProduct}
				<li class="base_product">
<div class="product-container clearfix">
	<div class="left-block">
		<div class="product-image-container">
			<a class="product_img_link" href="{$categoryProduct.link|escape:'html':'UTF-8'}">
				<img class="replace-2x img-responsive" src="{$link->getImageLink($categoryProduct.link_rewrite, $categoryProduct.id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="{if !empty($categoryProduct.legend)}{$categoryProduct.legend|escape:'html':'UTF-8'}{else}{$categoryProduct.name|escape:'html':'UTF-8'}{/if}" {if isset($mediumSize)} width="{$mediumSize.width}" height="{$mediumSize.height}"{/if} />
			</a>
		</div>
	</div>
	<div class="right-block">
		<h5>
			{if isset($categoryProduct.pack_quantity) && $categoryProduct.pack_quantity}{$categoryProduct.pack_quantity|intval|cat:' x '}{/if}
			<a class="product-name" href="{$categoryProduct.link|escape:'html':'UTF-8'}" title="{$categoryProduct.name|escape:'html':'UTF-8'}">
				{$categoryProduct.name|truncate:45:'...'|escape:'html':'UTF-8'}
			</a>
		</h5>
		{if $ProdDisplayPrice && $categoryProduct.show_price == 1 && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
			<div class="content_price">
				<span class="price product-price">{convertPrice price=$categoryProduct.displayed_price}</span>
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
<script type="text/javascript">
    $(document).ready(function() {
      $('#productscategory_list_slick').slick({
        slidesToShow: 4,
		slidesToScroll: 4,
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
				slidesToShow: 3,
				slidesToScroll: 3,
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
