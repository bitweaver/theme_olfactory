{strip}
{if $gBitUser->hasPermission( 'bit_p_view_tabs_and_tools' )}
	<div class="pageactions tabs">
		<ul>
			<li{if $pagetab eq 'view'} class="current"{/if}>{smartlink ititle='view' ifile='index.php' page_id=`$pageInfo.page_id`}</li>
			
			{if !$lock}
				{if $gBitUser->hasPermission( 'bit_p_edit' ) or $page eq 'SandBox'}
					{if $beingEdited eq 'y'}
						<li{if $pagetab eq 'edit'} class="current"{/if}>{smartlink ititle="being edited by $semUser" ifile='edit.php' page_id=`$pageInfo.page_id`}</li>
					{else}
						<li{if $pagetab eq 'edit'} class="current"{/if}>{smartlink ititle='edit' ifile='edit.php' page_id=`$pageInfo.page_id`}</li>
					{/if}
				{/if}
			{/if}
			
			{if $page ne 'SandBox'}
				{if $gBitSystem->isFeatureActive( 'feature_history' )}
					<li{if $pagetab eq 'history'} class="current"{/if}>{smartlink ititle='history' ifile='page_history.php' page_id=`$pageInfo.page_id`}</li>
				{/if}
			{/if}

			{if $gBitSystem->isFeatureActive( 'feature_like_pages' )}
				<li{if $pagetab eq 'similar'} class="current"{/if}>{smartlink ititle='similar' ifile='like_pages.php' page_id=`$pageInfo.page_id`}</li>
			{/if}

			{if $page ne 'SandBox'}
				{if $gBitUser->hasPermission( 'bit_p_admin_wiki' )}
					<li{if $pagetab eq 'permissions'} class="current"{/if}>{smartlink ititle='permissions' ifile='page_permissions.php' page_id=`$pageInfo.page_id`}</li>
				{/if}
			{/if}
		</ul>
	</div>
	<div class="clear"></div>
{/if}
{/strip}
