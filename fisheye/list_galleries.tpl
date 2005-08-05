{strip}
<div class="listing fisheye">
	<div class="header">
		<h1>{tr}Image Galleries{/tr}</h1>
	</div>

	<div class="body">
		<div class="pageactions sort">
			<ul>
				<li>{biticon ipackage=liberty iname=sort iexplain="sort by"}</li>
				{if $fisheye_list_title eq 'y'}	
					<li>{smartlink ititle="Gallery Name" isort="title" user_id=$iUserId offset=$iMaxRows search=$iSearchString}</li>
				{/if}
				{if $fisheye_list_user eq 'y'}
					<li>{smartlink ititle="Owner" isort=`$gBitSystemPrefs.display_name user_id=$iUserId offset=$iMaxRows search=$iSearchString}</li>
				{/if}
				{if $fisheye_list_created eq 'y'}
					<li>{smartlink ititle="Created" isort="created" user_id=$iUserId offset=$iMaxRows search=$iSearchString}</li>
				{/if}
				{if $fisheye_list_lastmodif eq 'y'}
					<li>{smartlink ititle="Last Modified" isort="last_modified" user_id=$iUserId offset=$iMaxRows search=$iSearchString}</li>
				{/if}
				{if $fisheye_list_hits eq 'y'}
					<li>{smartlink ititle="Hits" isort="hits" user_id=$iUserId offset=$iMaxRows search=$iSearchString}</li>
				{/if}
			</ul>
		</div>

		<div class="clear"></div>

		<ul class="data">
			{foreach from=$galleryList key=galleryId item=gal}
				<li class="item {cycle values='odd,even'} {$gal.content_type_guid}">
					<div class="floaticon">
						{if $gal.is_hidden=='y'}
							{biticon ipackage=liberty iname="hidden" iexplain="Hidden"}
						{/if}
						{if $gal.is_private=='y'}
							{biticon ipackage=liberty iname="private" iexplain="Private"}
						{/if}
						{* if $gal.access_answer}
							{biticon ipackage=liberty iname="protected" iexplain="Protected"}
						{/if}
						{if $galleryList[ix]->hasUserPermission('bit_p_edit_fisheye')}
							<a title="{tr}Edit{/tr}" href="{$smarty.const.FISHEYE_PKG_URL}edit.php?gallery_id={$galleryId}">{biticon ipackage=liberty iname="config" iexplain="Edit"}</a>
						{/if}
						{if $galleryList[ix]->hasUserPermission('bit_p_edit_fisheye')}
						 	<a title="{tr}Image Order{/tr}" href="{$smarty.const.FISHEYE_PKG_URL}image_order.php?gallery_id={$galleryId}">{biticon ipackage=liberty iname="current" iexplain="Item Order"}</a>
						{/if}
						{if $galleryList[ix]->hasUserPermission('bit_p_upload_fisheye')}
							<a title="{tr}Add Image{/tr}" href="{$smarty.const.FISHEYE_PKG_URL}upload.php?gallery_id={$galleryId}">{biticon ipackage=liberty iname="upload" iexplain="Add Image"}</a>
						{/if}
						{if $galleryList[ix]->hasUserPermission('bit_p_admin_fisheye')}
							<a title="{tr}User Permissions{/tr}" href="{$smarty.const.FISHEYE_PKG_URL}edit_gallery_perms.php?gallery_id={$galleryId}">{biticon ipackage=liberty iname="permissions" iexplain="User Permissions"}</a>
						{/if *}
					</div>

					<h2><a href="{$gal.display_url}">{if $fisheye_list_title eq 'y'}{$gal.title}{else}Gallery {$gal.gallery_id}{/if}</a></h2>
					
					{if $fisheye_list_thumbnail eq 'y'}
						<a href="{$smarty.const.FISHEYE_PKG_URL}view.php?gallery_id={$galleryId}">
							<img class="thumb" src="{$gal.thumbnail_url}" alt="{$gal.title}" title="{$gal.title}" />
						</a>
					{/if}

					{if $fisheye_list_user eq 'y'}
						{displayname hash=$gal} &raquo; <a href="{$smarty.const.FISHEYE_PKG_URL}list_galleries.php?user_id={$gal.user_id}">{tr}Galleries{/tr}</a> 
					{/if}
					{* if $galleryList[ix]->isProtected()}
						{biticon ipackage="fisheye" iname="locked" iexplain="Protected"}
					{/if *}
					{if $fisheye_list_description eq 'y'}
						<p>{$gal.data|truncate:100}</p>
					{/if}

					<div class="date">
						{if $gBitSystem->isFeatureActive( 'fisheye_list_created' ) }
							{tr}Created{/tr}: {$gal.created|bit_short_date}<br />
						{/if}
						{if $gBitSystem->isFeatureActive( 'fisheye_list_lastmodif' )}
							{tr}Modified{/tr}: {$gal.last_modified|bit_short_date}<br />
						{/if}
						{if $fisheye_list_hits eq 'y'}
							{tr}Hits{/tr}: {$gal.hits}<br />
						{/if}
					</div>

					<div class="clear"></div>
				</li>
			{foreachelse}
				<li class="item norecords">
					{tr}No records found{/tr}
				</li>
			{/foreach}
		</ul>

		<div class="clear"></div>
	</div>	<!-- end .body -->
</div>	<!-- end .fisheye -->
{/strip}
