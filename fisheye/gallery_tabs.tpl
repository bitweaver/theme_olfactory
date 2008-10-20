{strip}
{if $gBitUser->hasPermission( 'p_users_view_icons_and_tools' )}
	<div class="pageactions tabs">
		<ul>
			<li{if $pagetab eq 'view'} class="current"{/if}>{smartlink ititle='view gallery' ifile='view.php' gallery_id=`$gContent->mGalleryId`}</li>

			{if $gContent->hasUserPermission( 'p_fisheye_update' )}
				<li{if $pagetab eq 'edit'} class="current"{/if}>{smartlink ititle='edit gallery' ifile='edit.php' gallery_id=`$gContent->mGalleryId`}</li>
				<li{if $pagetab eq 'order'} class="current"{/if}>{smartlink ititle='image order' ifile='image_order.php' gallery_id=`$gContent->mGalleryId`}</li>
			{/if}

			{if $gContent->hasUserPermission( 'p_fisheye_upload' )}
				<li{if $pagetab eq 'upload'} class="current"{/if}>{smartlink ititle='upload image' ifile='upload.php' gallery_id=`$gContent->mGalleryId`}</li>
			{/if}
		</ul>
	</div>
	<div class="clear"></div>
{/if}
{/strip}

