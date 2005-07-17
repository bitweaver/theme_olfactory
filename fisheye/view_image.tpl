{strip}
{include file="bitpackage:fisheye/gallery_nav.tpl"}
{include file="bitpackage:fisheye/image_tabs.tpl" pagetab=view}

<div class="display fisheye">
	<div class="header">
		<h1>{$gGallery->mInfo.title}</h1>
	</div>

	<div class="body">
		{box class="box image"}
			<img src="{$gContent->mInfo.display_url}" alt="{$gContent->mInfo.title|default:$gContent->mInfo.image_file.filename}" title="{$gContent->mInfo.data|default:$gContent->mInfo.filename}" />				

			{if $gBitSystem->isFeatureActive( 'fisheye_image_list_title' )}
				<h1>{$gContent->mInfo.title|default:$gContent->mInfo.image_file.filename}</h1>
			{/if}

			{if $gBitSystem->isFeatureActive( 'fisheye_image_list_description' ) and $gContent->mInfo.data ne ''}
				<p>{$gContent->mInfo.data}</p>
			{/if}
		{/box}
		<div class="pagination">
			{if $gContent->mInfo.width && $gContent->mInfo.height}
				{tr}View other sizes{/tr}<br />
				{foreach key=size from=$gContent->mInfo.image_file.thumbnail_url item=url}
				{if $url != $gContent->mInfo.display_url}<a href="{$gContent->getDisplayUrl(0,$size)|escape}">{/if}{$size}{if $url != $gContent->mInfo.display_url}</a>{/if}&nbsp;&bull;&nbsp;
				{/foreach}
				<a href="{$gContent->mInfo.image_file.source_url|escape}">Original</a> {$gContent->mInfo.width}x{$gContent->mInfo.height}
			{/if}
		</div>
	</div>	<!-- end .body -->

	{include file="bitpackage:fisheye/image_tools.tpl"}
</div>	<!-- end .fisheye -->
{/strip}
