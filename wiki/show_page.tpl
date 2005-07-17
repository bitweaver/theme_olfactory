{if $print_page ne 'y'}
	{include file="bitpackage:wiki/page_tabs.tpl" pagetab=view}
{/if}

<div class="display wiki">
	{include file="bitpackage:wiki/page_header.tpl"}
	{if $gBitSystem->isPackageActive( 'stickies' )}
		{include file="bitpackage:stickies/display_bitsticky.tpl"}
	{/if}
	{include file="bitpackage:wiki/page_display.tpl"}
	{if $pages > 1}
		<div class="pagination">
			<a title="{tr}First page{/tr}" href="index.php?page_id={$pageInfo.page_id}&amp;pagenum={$first_page}">{biticon ipackage=liberty iname="nav_first" iexplain="first page"}</a>
			<a title="{tr}Previous page{/tr}" href="index.php?page_id={$pageInfo.page_id}&amp;pagenum={$prev_page}">{biticon ipackage=liberty iname="nav_prev" iexplain="previous page"}</a>
			{tr}page{/tr}:{$pagenum}/{$pages}
			<a title="{tr}Next page{/tr}" href="index.php?page_id={$pageInfo.page_id}&amp;pagenum={$next_page}">{biticon ipackage=liberty iname="nav_next" iexplain="next page"}</a>
			<a title="{tr}Last page{/tr}" href="index.php?page_id={$pageInfo.page_id}&amp;pagenum={$last_page}">{biticon ipackage=liberty iname="nav_last" iexplain="last page"}</a>
		</div>
	{/if} {* end .pagination *}

	{if $footnote}
		{$footnote}
	{/if}

	{if $gBitSystem->isFeatureActive( 'wiki_feature_copyrights' )}
		<p class="copyright">
			{if $pageCopyrights}
				{section name=i loop=$pageCopyrights}
					&copy; {$pageCopyrights[i].year} {$pageCopyrights[i].authors} {if $pageCopyrights[i].title} under {$pageCopyrights[i].title}{/if}
				{/section}
			{elseif $wikiLicensePage != '' }
				{tr}The content on this page is licensed under the terms of the{/tr} <a href="{$wikiLicensePage}"><b>{tr}{$wikiSubmitNotice}{/tr}</b></a>.
			{/if}
			{if $gBitUser->hasPermission( 'bit_p_edit_copyrights' )}
				<br />{tr}To edit the copyright notices{/tr} <a href="{$gBitSystem.WIKI_PKG_URL}copyrights.php?page_id={$pageInfo.page_id}">{tr}click here{/tr}</a>.
			{/if}
		</p>
	{/if}

	{if $print_page ne 'y'}
		{include file="bitpackage:wiki/page_tools.tpl"}
	{/if}

	{if $print_page ne 'y' and $feature_wiki_comments eq 'y' }
		{include file="bitpackage:liberty/comments.tpl"}
	{/if}

	{if $is_categorized eq 'y' and $gBitSystem->isPackageActive( 'categories' ) and $gBitSystem->isFeatureActive( 'feature_categoryobjects' )}
		<div class="category">{$display_catobjects}</div>
	{/if}
</div><!-- end .wiki -->
