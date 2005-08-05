{* $Header: /cvsroot/bitweaver/_bit_styles/olfactory/wiki/page_history.tpl,v 1.1.1.1.2.1 2005/08/05 23:00:38 squareing Exp $ *}
{strip}

{include file="bitpackage:wiki/page_tabs.tpl" pagetab=history}

<div class="listing wiki">
	<div class="header">
		<h1>{tr}History{/tr} {tr}of{/tr} <a href="{$pageInfo.display_url}">{$pageInfo.title}</a></h1>
	</div>

	<div class="body">
		{if $version}
			<h2>{tr}Version{/tr} {$version}</h2>
		{/if}

		{if $parsed}
			{include file="bitpackage:wiki/show_page.tpl"}
		{/if}

		{if $source}
			<div class="content">{$sourcev}</div>
		{/if}

		{if $diff}
			<h2>{tr}Comparing versions{/tr}</h2>
			<table class="data">
				<tr>
					<th width="50%">{tr}Current version{/tr}</td>
					<th width="50%">{tr}Version{/tr} {$version}</td>
				</tr>
				<tr>
					<td valign="top"><div class="content">{$parsed}</div></td>
					<td valign="top"><div class="content">{$diff}</div></td>
				</tr>
			</table>
		{/if}
		
		{if $diff2 eq 'y'}
			<h2>{tr}Differences from version {$version}{/tr}</h2>
			<div class="content">{$diffdata}</div>
		{/if}

		{form}
			<input type="hidden" name="page_id" value="{$pageInfo.page_id}" />
			<table class="data">
				<caption>{tr}View and compare previous versions of {$pageInfo.title}{/tr}</caption>
				<tr>
					{if $gBitUser->hasPermission( 'bit_p_remove' )}
						<th>&nbsp;</th>
					{/if}
					<th>{tr}Date{/tr}</th>
					<th>{tr}Ver{/tr}</th>
					<th>{tr}User{/tr}</th>
					<th>{tr}IP{/tr}</th>
					<th>{tr}Comment{/tr}</th>
					<th>{tr}Action{/tr}</th>
				</tr>

				<tr class="odd">
					{if $gBitUser->hasPermission( 'bit_p_remove' )}
						<td>&nbsp;</td>
					{/if}
					<td>{$pageInfo.last_modified|bit_short_datetime}</td>
					<td>{$pageInfo.version}</td>
					<td>{displayname hash=$pageInfo}</td>
					<td>{$pageInfo.ip}</td>
					<td>{$pageInfo.comment}</td>
					<td class="actionicon"><a href="{$pageInfo.display_url}">{tr}current{/tr}</a></td>
				</tr>

				{section name=hist loop=$history}
					<tr class="{cycle values="even,odd"}">
						{if $gBitUser->hasPermission( 'bit_p_remove' )}
							<td align="center"><input type="checkbox" name="hist[{$history[hist].version}]" /></td>
						{/if}
						<td>{$history[hist].last_modified|bit_short_datetime}</td>
						<td>{$history[hist].version}</td>
						<td>{displayname hash=$history[hist]}</td>
						<td>{$history[hist].ip}</td>
						<td>{$history[hist].comment}</td>
						<td class="actionicon">
							<a title="{tr}view{/tr}" href="{$smarty.const.WIKI_PKG_URL}page_history.php?page_id={$gContent->mPageId}&amp;preview={$history[hist].version}">{tr}view{/tr}</a>
							&nbsp;&bull;&nbsp;
							{if $gBitUser->hasPermission( 'bit_p_rollback' )}
								<a href="{$smarty.const.WIKI_PKG_URL}rollback.php?page_id={$gContent->mPageId}&amp;version={$history[hist].version}" title="{tr}rollback{/tr}">{tr}rollback{/tr}</a>
								&nbsp;&bull;&nbsp;
							{/if}
							<a href="{$smarty.const.WIKI_PKG_URL}page_history.php?page_id={$gContent->mPageId}&amp;diff={$history[hist].version}" title="{tr}compare{/tr}">{tr}compare{/tr}</a>
							&nbsp;&bull;&nbsp;
							<a href="{$smarty.const.WIKI_PKG_URL}page_history.php?page_id={$gContent->mPageId}&amp;diff2={$history[hist].version}" title="{tr}diff{/tr}">{tr}difference{/tr}</a>
							&nbsp;&bull;&nbsp;
							<a href="{$smarty.const.WIKI_PKG_URL}page_history.php?page_id={$gContent->mPageId}&amp;source={$history[hist].version}" title="{tr}source{/tr}">{tr}source{/tr}</a>
						</td>
					</tr>
					{sectionelse}
					<tr class="norecords">
						<td colspan="8">
							{tr}No records found{/tr}
						</td>
					</tr>
				{/section}
				{if $gBitUser->hasPermission( 'bit_p_remove' )}
				<tr><td colspan="8">
					<input type="submit" name="delete" value="{tr}delete{/tr}" /></td></tr>
				{/if}
			</table>
		{/form}
	</div>
</div> <!-- end .wiki -->
{/strip}
