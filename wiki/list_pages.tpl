{* $Header: /cvsroot/bitweaver/_bit_styles/olfactory/wiki/list_pages.tpl,v 1.2 2005/07/17 17:36:42 squareing Exp $ *}
<div class="floaticon">{bithelp}</div>

<div class="admin wiki">
	<div class="header">
		<h1>{tr}WikiPages{/tr}</h1>
	</div>

	{formfeedback error=$errors}

	<div class="body">
		{form id="checkform"}
		{strip}
			<div class="pageactions sort">
				<ul>
					<li>{biticon ipackage=liberty iname=sort iexplain="sort by"}</li>
					{if $wiki_list_name eq 'y'}
						<li>{smartlink ititle="Page Name" isort="title" offset=$offset}</li> 
					{/if}
					{if $wiki_list_lastmodif eq 'y'}
						<li>{smartlink ititle="Last Modified" iorder="desc" idefault=1 isort="last_modified" offset=$offset}</li> 
					{/if}
					{if $wiki_list_creator eq 'y'}
						<li>{smartlink ititle="Author" isort="creator_user" offset=$offset}</li> 
					{/if}
					{if $wiki_list_user eq 'y'}
						<li>{smartlink ititle="Last Editor" isort="modifier_user" offset=$offset}</li> 
					{/if}
				</ul>
			</div>

			<div class="clear"></div>

			<input type="hidden" name="offset" value="{$offset}" />
			<input type="hidden" name="sort_mode" value="{$sort_mode}" />

			<table class="data">
				<tr>
					{*  at the moment, the only working option to use the checkboxes for is deleting pages. so for now the checkboxes are visible iff $bit_p_remove is set. Other applications make sense as well (categorize, convert to pdf, etc). Add necessary corresponding permission here: *}

					{if $gBitUser->hasPermission( 'bit_p_remove' )}              {* ... "or $gBitUser->hasPermission( 'bit_p_other_sufficient_condition_for_checkboxes' )"  *}
					  {assign var='checkboxes_on' value='y'}
					{else}
					  {assign var='checkboxes_on' value='n'}
					{/if}
					{*if $wiki_list_name eq 'y'}
						<th>{smartlink ititle="Page" isort="title" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if*}
					{if $wiki_list_hits eq 'y'}
						<th>{smartlink ititle="Hits" isort="hits" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if}
					{*if $wiki_list_lastmodif eq 'y'}
						<th>{smartlink ititle="Last Modified" isort="last_modified" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if*}
					{*if $wiki_list_creator eq 'y'}
						<th>{smartlink ititle="Author" isort="creator_user" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if*}
					{*if $wiki_list_user eq 'y'}
						<th>{smartlink ititle="Last Editor" isort="modifier_user" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if*}
					{if $wiki_list_lastver eq 'y'}
						<th>{smartlink ititle="Last Version" isort="version" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if}
					{if $wiki_list_comment eq 'y'}
						<th>{smartlink ititle="Comments" isort="comment" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if}
					{if $wiki_list_status eq 'y'}
						<th>{smartlink ititle="Status" isort="flag" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if}
					{if $wiki_list_versions eq 'y'}
						<th>{smartlink ititle="Version" isort="versions" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if}
					{if $wiki_list_links eq 'y'}
						<th>{smartlink ititle="Links" isort="links" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if}
					{if $wiki_list_backlinks eq 'y'}
						<th>{smartlink ititle="Backlinks" isort="backlinks" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if}
					{if $wiki_list_size eq 'y'}
						<th>{smartlink ititle="Size" isort="size" offset=$offset}</th> 
						{counter name=cols assign=cols print=false}
					{/if}
					{if $gBitUser->hasPermission( 'bit_p_edit' )}
						<th>{tr}Actions{/tr}</th>
						{counter name=cols assign=cols print=false}
					{/if}
				</tr>

				{cycle values="even,odd" print=false}
				{section name=changes loop=$listpages}
					<tr class="{cycle advance=false}">
						<td colspan="{$cols}">
						{if $wiki_list_name eq 'y'}
							<a href="{$listpages[changes].wikilink}" title="{$listpages[changes].title}">{$listpages[changes].title}</a>
						{else}
							<a href="{$gBitLoc.WIKI_PKG_URL}index.php?page_id={$listpages[changes].page_id}" title="{$listpages[changes].page_id}">Page #{$listpages[changes].page_id}</a>
						{/if}
						{if $wiki_list_creator eq 'y'}
							&nbsp;&nbsp;&nbsp;
							{tr}created by{/tr} &nbsp;&nbsp;&nbsp; {$listpages[changes].creator|userlink}
						{/if}
						 &nbsp;&nbsp;&nbsp; {tr}on{/tr} &nbsp;&nbsp;&nbsp; {$listpages[changes].created|bit_short_datetime}
						<br/>
						{if $wiki_list_lastmodif eq 'y' && ($listpages[changes].version > 1)}
							{tr}Last Modified{/tr} {$listpages[changes].last_modified|bit_short_datetime}
							&nbsp;&nbsp;&nbsp;
							{if $listpages[changes].editor != $listpages[changes].creator}
								{tr}by{/tr} &nbsp;&nbsp;&nbsp; {$listpages[changes].editor|userlink}
							{/if}
						{/if}
						</td>
					</tr>
					<tr class="{cycle}">
						{if $wiki_list_hits eq 'y'}
							<td style="text-align:center;">{$listpages[changes].hits}</td>
						{/if}
						{if $wiki_list_lastver eq 'y'}
							<td style="text-align:center;">{$listpages[changes].version}</td>
						{/if}
						{if $wiki_list_comment eq 'y'}
							<td>{$listpages[changes].comment}</td>
						{/if}
						{if $wiki_list_status eq 'y'}
							<td style="text-align:center;">
								{if $listpages[changes].flag eq 'locked'}
									{biticon ipackage="wiki" iname="locked" iexplain="locked"}
								{else}
									{biticon ipackage="wiki" iname="unlocked" iexplain="unlocked"}
								{/if}
							</td>
						{/if}
						{if $wiki_list_versions eq 'y'}
							{if $gBitSystem->isFeatureActive( 'feature_history' )}
								<td style="text-align:right;"><a href="{$gBitLoc.WIKI_PKG_URL}page_history.php?page={$listpages[changes].title|escape:"url"}">{$listpages[changes].versions}</a></td>
							{else}
								<td style="text-align:right;">{$listpages[changes].versions}</td>
							{/if}
						{/if}
						{if $wiki_list_links eq 'y'}
							<td style="text-align:center;">{$listpages[changes].links|default:"0"}</td>
						{/if}
						{if $wiki_list_backlinks eq 'y'}
							{if $gBitSystem->isFeatureActive( 'feature_backlinks' ) && $listpages[changes].backlinks > 0}
								<td style="text-align:center;"><a href="{$gBitLoc.WIKI_PKG_URL}backlinks.php?page={$listpages[changes].title|escape:"url"}">{$listpages[changes].backlinks|default:"0"}</a></td>
							{else}
								<td style="text-align:center;">{$listpages[changes].backlinks|default:"0"}</td>
							{/if}
						{/if}
						{if $wiki_list_size eq 'y'}
							<td style="text-align:right;">{$listpages[changes].len|kbsize}</td>
						{/if}
						{if $gBitUser->hasPermission( 'bit_p_edit' )}
							<td class="actionicon">
								<a href="{$gBitLoc.WIKI_PKG_URL}edit.php?page_id={$listpages[changes].page_id}">{biticon ipackage="liberty" iname="edit" iexplain="edit"}</a>
								{if $checkboxes_on eq 'y'}
									<input type="checkbox" name="checked[]" value="{$listpages[changes].page_id}" />
								{/if}
							</td>
						{/if}
					</tr>
				{sectionelse}
					<tr class="norecords"><td colspan="{$cols}">
						{tr}No records found{/tr}
					</td></tr>
				{/section}
			</table>
		{/strip}

			{if $checkboxes_on eq 'y'}
				<div style="text-align:right;">
					<script type="text/javascript">
						<!--
						// check / uncheck all.
						// in the future, we could extend this to happen serverside as well for the convenience of people w/o javascript.
						document.write("<label for=\"switcher\">{tr}Select All{/tr}</label> ");
						document.write("<input name=\"switcher\" id=\"switcher\" type=\"checkbox\" onclick=\"switchCheckboxes(this.form.id,'checked[]','switcher')\" />");
						//-->
					</script>

					<br />

					<select name="submit_mult" onchange="this.form.submit();">
						<option value="" selected="selected">{tr}with checked{/tr}:</option>
						{if $gBitUser->hasPermission( 'bit_p_remove' )}
							<option value="remove_pages">{tr}remove{/tr}</option>
						{/if}
						{* add here e.g. <option value="categorize">{tr}categorize{/tr}</option> *}
					</select>

					<script type="text/javascript">
						<!-- //Fake js to allow the use of the <noscript> tag (so non-js-users can still submit) -->
					</script>

					<noscript>
						<div><input type="submit" value="{tr}ok{/tr}" /></div>
					</noscript>
				</div>
			{/if}
		{/form}

		{pagination}
		{minifind sort_mode=$sort_mode}
	</div><!-- end .body -->
</div><!-- end .wiki -->
