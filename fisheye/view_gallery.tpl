{strip}
{include file="bitpackage:fisheye/gallery_nav.tpl"}
{include file="bitpackage:fisheye/gallery_tabs.tpl" pagetab=view}

<div class="listing fisheye">
	<div class="header">
		<h1>{$gContent->mInfo.title}</h1>

		{if $gContent->mInfo.data}
			<h2>{$gContent->mInfo.data}</h2>
		{/if}
	</div>

	<div class="body">
		{formfeedback success=$fisheyeSuccess error=$fisheyeErrors warning=$fisheyeWarnings}
		<table class="thumbnailblock">
			{counter assign="imageCount" start="0" print=false}
			{assign var="max" value=100}
			{assign var="tdWidth" value="`$max/$cols_per_page`"}
			{section name=ix loop=$gContent->mItems}
				{assign var=item value=$gContent->mItems[ix]}
				{if $imageCount % $cols_per_page == 0}
					<tr > <!-- Begin Image Row -->
				{/if}

				<td style="width:{$tdWidth}%; vertical-align:top;"> <!-- Begin Image Cell -->
					{box class="box `$gContent->mItems[ix]->mInfo.content_type_guid`"}
						<a href="{$gContent->mItems[ix]->getDisplayUrl()|replace:"&":"&amp;"}">
							<img class="thumb" src="{$gContent->mItems[ix]->getThumbnailUrl()}" alt="{$gContent->mItems[ix]->mInfo.title|default:'image'}" />
						</a>
						{if $gBitSystemPrefs.fisheye_gallery_list_image_titles eq 'y'}
							<h2>{$gContent->mItems[ix]->mInfo.title}</h2>
						{/if}
						{if $gBitSystemPrefs.fisheye_gallery_list_image_descriptions eq 'y'}
							<p>{$gContent->mImages[ix]->mInfo.data}</p>
						{/if}
					{/box}
				</td> <!-- End Image Cell -->
				{counter}

				{if $imageCount % $cols_per_page == 0}
					</tr> <!-- End Image Row -->
				{/if}

			{sectionelse}
				<tr><td>{tr}This gallery is empty{/tr}. <a href="{$gBitLoc.FISHEYE_PKG_URL}upload.php?gallery_id={$gContent->mGalleryId}">Upload pictures!</a></td></tr>
			{/section}

			{if $imageCount % $cols_per_page != 0}</tr>{/if}
		</table>
	</div>	<!-- end .body -->

	{libertypagination numPages=$gContent->mInfo.num_pages 
		gallery_id=$gContent->mGalleryId
		page=$page}

	{include file="bitpackage:fisheye/gallery_tools.tpl"}

</div>	<!-- end .fisheye -->

{/strip}
