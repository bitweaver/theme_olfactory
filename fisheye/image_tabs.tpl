{strip}
{if $gBitUser->hasPermission( 'p_users_view_icons_and_tools' )}
	<div class="pageactions tabs">
		<li{if $pagetab eq 'view'} class="current"{/if}>{smartlink ititle='view image' ifile='view_image.php' image_id=`$gContent->mImageId` gallery_id=`$gGallery->mGalleryId`}</li>
		{if $gContent->hasUserPermission('p_admin')}
			<li{if $pagetab eq 'edit'} class="current"{/if}>{smartlink ititle='edit image' ifile='edit_image.php' image_id=`$gContent->mImageId` gallery_id=`$gGallery->mGalleryId`}</li>
			<li{if $pagetab eq 'upload'} class="current"{/if}>{smartlink ititle='add new image' ifile='edit_image.php'}</li>
		{/if}
	</div>
	<div class="clear"></div>
{/if}
{/strip}
