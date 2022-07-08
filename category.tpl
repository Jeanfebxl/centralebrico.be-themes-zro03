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
{include file="$tpl_dir./errors.tpl"}
{if isset($category)}
	{if $category->id AND $category->active}
		
		{if !isset($showImage)}{assign var='showImage' value=1}{/if}
		{if !isset($showDescription)}{assign var='showDescription' value=1}{/if}
		{if !isset($showSubcategories)}{assign var='showSubcategories' value=1}{/if}
		{if !isset($productGridColumns)}{assign var='productGridColumns' value=3}{/if}
		
    	{if $showImage && ($scenes || $category->id_image)}
			<div class="content_scene_cat">
            	{if $scenes}
                 	<div class="content_scene">
                        <!-- Scenes -->
                        {include file="$tpl_dir./scenes.tpl" scenes=$scenes}
                    </div>
				{else}
                    <!-- Category image -->
                    <div class="content_scene_cat_img">
						{if $category->id_image}<img class="img-responsive" src="{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category_default')|escape:'html':'UTF-8'}" alt="{$category->name|escape:'html':'UTF-8'}" width="{$categorySize.width}" height="{$categorySize.height}" />{/if}
                    </div>
                {/if}
            </div>
		{/if}
		
		<h1 class="page-heading{if (isset($subcategories) && !$products) || (isset($subcategories) && $products) || !isset($subcategories) && $products} product-listing{/if}"><span class="cat-name">{$category->name|escape:'html':'UTF-8'}{if isset($categoryNameComplement)}&nbsp;{$categoryNameComplement|escape:'html':'UTF-8'}{/if}</span>{include file="$tpl_dir./category-count.tpl"}</h1>
		
		{if $showDescription && $category->description}
			<div class="cat_full_desc">
				<div class="rte">{$category->description}</div>
			</div>
		{/if}
						
		{if $showSubcategories && isset($subcategories)}
        {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories) }
		<!-- Subcategories -->
		<div id="subcategories" class="block">
			<p class="subcategory-heading page-subheading">{l s='Subcategories'}</p>
			<div class="block_content">
			<ul>
			{foreach from=$subcategories item=subcategory}
				<li>
                	<div class="subcategory-image">
						<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
						{if $subcategory.id_image}
							<img class="replace-2x img-responsive" src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'category_home')|escape:'html':'UTF-8'}" alt="{$subcategory.name|escape:'html':'UTF-8'}" />
						{else}
							<img class="replace-2x img-responsive" src="{$img_cat_dir}{$lang_iso}-default-category_home.jpg" alt="{$subcategory.name|escape:'html':'UTF-8'}" />
						{/if}
					</a>
                   	</div>
					<h5><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</a></h5>
					{if $subcategory.description}
						<div class="cat_desc">{$subcategory.description}</div>
					{/if}
				</li>
			{/foreach}
			</ul>
			</div>
		</div>
        {/if}
		{/if}

		{hook h="displaySubCategories"}
		
		{if $products}
			<div class="content_sortPagiBar clearfix">
            	<div class="sortPagiBar clearfix">
            		{include file="./product-sort.tpl"}
                	{include file="./nbr-product-page.tpl"}
				</div>
                <div class="top-pagination-content clearfix">
                	{include file="./product-compare.tpl"}
					{include file="./pagination.tpl" product_count=true}
                </div>
			</div>
			<div class="product_list_wrapper columns-{$productGridColumns|intval}">
			{include file="./product-list.tpl" products=$products}
			</div>
			<div class="content_sortPagiBar">
				<div class="bottom-pagination-content clearfix">
					{include file="./product-compare.tpl" paginationId='bottom'}
                    {include file="./pagination.tpl" paginationId='bottom'}
				</div>
			</div>
		{/if}
	{elseif $category->id}
		<p class="alert alert-warning">{l s='This category is currently unavailable.'}</p>
	{/if}
{/if}
