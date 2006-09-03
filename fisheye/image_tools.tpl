{strip}
{if $gBitUser->hasPermission( 'p_users_view_icons_and_tools' )}
	<div class="pageactions tools">
		{if $gBitSystem->isPackageActive( 'pdf' ) && $gContent->hasUserPermission( 'p_pdf_generation' )}
			{if $structureInfo.root_structure_id}
				<li><a title="{tr}create PDF{/tr}" href="{$smarty.const.PDF_PKG_URL}index.php?structure_id={$structureInfo.root_structure_id}">{biticon ipackage="pdf" iname="pdf" iexplain="PDF"}</a></li>
			{else}
				<li><a title="{tr}create PDF{/tr}" href="{$smarty.const.PDF_PKG_URL}index.php?content_id={$gContent->mContentId}">{biticon ipackage="pdf" iname="pdf" iexplain="PDF"}</a></li>
			{/if}
		{/if}
		{if $gContent->hasUserPermission('p_admin')}
			<li><a title="{tr}Delete{/tr}" href="{$smarty.const.FISHEYE_PKG_URL}edit_image.php?image_id={$gContent->mImageId}&amp;delete=1">{biticon ipackage="icons" iname="edit-delete" iexplain="Delete Image"}</a></li>
		{/if}
	</div>
	<div class="clear"></div>
{/if}
{/strip}
