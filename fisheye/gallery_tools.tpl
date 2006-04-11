{strip}
{if $gBitUser->hasPermission( 'p_users_view_icons_and_tools' )}
	<div class="pageactions tools">
		<ul>
			{if $gBitSystem->isPackageActive( 'pdf' ) && $gContent->hasUserPermission( 'p_pdf_generation' )}
				{if $structureInfo.root_structure_id}
					<li><a title="{tr}create PDF{/tr}" href="{$smarty.const.PDF_PKG_URL}?structure_id={$structureInfo.root_structure_id}">{biticon ipackage="pdf" iname="pdf" iexplain="PDF"}</a></li>
				{else}
					<li><a title="{tr}create PDF{/tr}" href="{$smarty.const.PDF_PKG_URL}?content_id={$gContent->mContentId}">{biticon ipackage="pdf" iname="pdf" iexplain="PDF"}</a></li>
				{/if}
			{/if}
			{if $gContent->hasUserPermission( 'p_fisheye_admin' )}
				<li><a title="{tr}User Permissions{/tr}" href="{$smarty.const.FISHEYE_PKG_URL}edit.php?gallery_id={$gContent->mGalleryId}&amp;delete=1">{biticon ipackage=liberty iname="delete" iexplain="Delete Gallery"}</a></li>
				<li><a title="{tr}User Permissions{/tr}" href="{$smarty.const.FISHEYE_PKG_URL}edit_gallery_perms.php?gallery_id={$gContent->mGalleryId}">{biticon ipackage=liberty iname="permissions" iexplain="User Permissions"}</a></li>
			{/if}
		</ul>
	</div>
	<div class="clear"></div>
{/if}
{/strip}

