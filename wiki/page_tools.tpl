{strip}
{if $print_page ne 'y'}
{if $gBitUser->hasPermission( 'p_users_view_icons_and_tools' )}
	<div class="pageactions tools">
		<ul>
			{if $print_page ne 'y' && count($showstructs) ne 0}
				<select name="page" onchange="go(this)">
					<option value="">{tr}Structures{/tr}...</option>
					{section name=struct loop=$showstructs}
						<option value="{$smarty.const.WIKI_PKG_URL}index.php?structure_id={$showstructs[struct].structure_id}">
							root structure id {$showstructs[struct].root_structure_id}
						</option>
					{/section}
				</select>
			{/if}

			{if $gBitUser->hasPermission( 'p_wiki_admin' )}
				<li>{smartlink ititle='refresh' ifile='export_wiki_pages.php' page_id=`$pageInfo.page_id` ibiticon='liberty/export'}</li>
			{/if}

			{if $gBitSystem->isFeatureActive( 'wiki_undo' ) and $canundo eq 'y'}
				<li>{smartlink ititle='undo' ifile='index.php' page_id=`$pageInfo.page_id` undo=1 ibiticon='liberty/undo'}</li>
			{/if}

			{if $gBitUser->hasPermission( 'p_wiki_admin' ) or ($gBitUser->mUserId and ($gBitUser->mUserId eq $pageInfo.modifier_user_id) and ($gBitUser->hasPermission( 'p_wiki_lock_page' )) and ($gBitSystem->isFeatureActive( 'wiki_usrlock' )))}
				{if $lock}
					<li>{smartlink ititle='unlock this page' ifile='index.php' page_id=`$pageInfo.page_id` action=unlock ibiticon='wiki/locked'}</li>
				{else}
					<li>{smartlink ititle='lock this page' ifile='index.php' page_id=`$pageInfo.page_id` action=lock ibiticon='wiki/unlocked'}</li>
				{/if}
			{elseif $lock}
				{biticon ipackage="wiki" iname="locked" iexplain="page is locked"}
			{/if}

			{if ($structureInfo.structure_id) && (($gStructure->mInfo.creator_user_id == $gBitUser->mUserId) || $gBitUser->hasPermission( 'p_wiki_admin_book' )) }
				<li>{smartlink ititle='edit book' ifile='edit_book.php' structure_id=`$structureInfo.structure_id` ibiticon='liberty/settings'}</li>
			{/if}

			{if $cached_page eq 'y'}
				<li>{smartlink ititle='refresh' ifile='index.php' ibiticon='liberty/refresh' page_id=`$pageInfo.page_id` refresh=1}</li>
			{/if}

			{if $gBitSystem->isFeatureActive( 'wiki_uses_s5' )}
				<li>{smartlink ititle='s5 slideshow' ifile='index.php' ibiticon='wiki/s5' page_id=`$pageInfo.page_id` s5=1 ionclick="return confirm('this works best in gecko based browsers (mozilla, firefox) or opera (press F11)')"}</li>
			{/if}

			{* a user needs permission to print??? anyway, using css for this now - xing
			{if $gBitUser->hasPermission( 'p_liberty_print' )}
				<li><a title="{tr}print{/tr}" href="{$smarty.const.WIKI_PKG_URL}print.php?{if $structureInfo.root_structure_id}structure_id={$structureInfo.root_structure_id}{else}page_id={$pageInfo.page_id}{/if}">{biticon ipackage=liberty iname="print" iexplain="print"}</a></li>
			{/if*}

			{if $gBitSystem->isPackageActive( 'pdf' ) && $gContent->hasUserPermission( 'p_pdf_generation' )}
				{if $structureInfo.root_structure_id}
					<li>{smartlink ititle='create PDF' ipackage='pdf' ifile='index.php' structure_id=`$structureInfo.structure_id` ibiticon='pdf/pdf'}</li>
				{else}
					<li>{smartlink ititle='create PDF' ipackage='pdf' ifile='index.php' page_id=`$pageInfo.page_id` ibiticon='pdf/pdf'}</li>
				{/if}
			{/if}

			{if $gBitSystem->isPackageActive( 'stickies' ) && $gBitUser->hasPermission('p_stickies_edit') }
				{if ($structureInfo.structure_id)}{assign var='stickyRequest' value="structure_id=`$structureInfo.structure_id`"}
				{else}{assign var='stickyRequest' value="notated_content_id=`$pageInfo.content_id`"}{/if}
				<li><a href="{$smarty.const.STICKIES_PKG_URL}edit.php?{$stickyRequest}">{biticon ipackage=stickies iname="sticky_note" iexplain="add sticky note"}</a></li>
			{/if}
			
			{if $user and $gBitSystem->isPackageActive( 'notepad' ) and $gBitUser->hasPermission( 'bit_p_notepad' )}
				<li><a title="{tr}Save{/tr}" href="{$smarty.const.WIKI_PKG_URL}index.php?page_id={$pageInfo.page_id}&amp;savenotepad=1">{biticon ipackage="wiki" iname="save" iexplain="save"}</a></li>
			{/if}

			{if $gBitUser->mUserId && $gBitSystem->isFeatureActive( 'user_watches' )}
				{if $user_watching_page eq 'y'}
					<li>{smartlink ititle='stop monitoring this page' ifile='index.php' watch_event=wiki_page_changed watch_action=remove page_id=`$pageInfo.page_id` watch_object=`$pageInfo.page_id` ibiticon='users/unwatch'}</li>
				{else}
					<li>{smartlink ititle='monitor this page' ifile='index.php' watch_event=wiki_page_changed watch_action=add page_id=`$pageInfo.page_id` watch_object=`$pageInfo.page_id` ibiticon='users/watch'}</li>
				{/if}
			{/if}
			
			{if $pageInfo.title ne 'SandBox'}
				{if $gBitUser->hasPermission( 'p_wiki_remove_page' )}
					<li>{smartlink ititle='remove this page' ifile='remove_page.php' page_id=`$pageInfo.page_id` ibiticon='liberty/delete'}</li>
				{/if}
			{/if}
			
			{if $gBitSystem->isFeatureActive( 'wiki_backlinks' ) and $backlinks}
				<select name="page" onchange="go(this)">
					<option value="{$smarty.const.WIKI_PKG_URL}index.php?page_id={$pageInfo.page_id}">{tr}backlinks{/tr}...</option>
					{foreach key=contentId item=backPage from=$backlinks}
						<option value="{$smarty.const.BIT_ROOT_URL}index.php?content_id={$contentId}">{$backPage}</option>
					{/foreach}
				</select>
			{/if}

			{if $gBitSystem->isFeatureActive( 'wiki_uses_slides' )}
				{if $show_slideshow eq 'y'}
					<li>{smartlink ititle='slideshow' ifile='slideshow.php' page_id=`$pageInfo.page_id` ibiticon='wiki/slides'}</li>
				{elseif $structureInfo.structure_id}
					<li>{smartlink ititle='slideshow' ifile='slideshow2.php' structure_id=`$structureInfo.structure_id` ibiticon='wiki/slides'}</li>
				{/if}
			{/if}
		</ul><!-- end .tools -->
	</div><!-- end .pageactions -->
	<div class="clear"></div>
{/if}
{/if}
{/strip}
