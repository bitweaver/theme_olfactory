{strip}

<div class="floaticon">{bithelp}</div>

<div class="listing blog">
	<div class="header">
		<h1>{tr}Blogs{/tr}</h1>
	</div>

	<div class="body">
		{minifind sort_mode=$sort_mode}

		<div class="pageactions sort">
			<ul>
				<li>{biticon ipackage=liberty iname=sort iexplain="sort by"}</li>
				{if $blog_list_title eq 'y'}
					<li>{smartlink ititle="Title" isort="title" offset=$offset}</li>
				{/if}
				{if $blog_list_created eq 'y'}
					<li>{smartlink ititle="Created" isort="created" iorder=desc offset=$offset}</li>
				{/if}
				{if $blog_list_lastmodif eq 'y'}
					<li>{smartlink ititle="Last Modified" isort="last_modified" iorder=desc idefault=1 offset=$offset}</li>
				{/if}
				{if $blog_list_user eq 'y'}
					<li>{smartlink ititle="User" isort="user" offset=$offset}</li>
				{/if}
				{if $blog_list_posts eq 'y'}
					<li>{smartlink ititle="Posts" isort="posts" offset=$offset}</li>
				{/if}
				{if $blog_list_visits eq 'y'}
					<li>{smartlink ititle="Visits" isort="hits" offset=$offset}</li>
				{/if}
				{if $blog_list_activity eq 'y'}
					<li>{smartlink ititle="Activity" isort="activity" offset=$offset}</li>
				{/if}
			</ul>
		</div>

		<div class="clear"></div>
		
		<ul class="data">
			{section name=changes loop=$listpages}
				<li class="item {cycle values='odd,even'}">
					<div class="floaticon">
						{if $gBitUser->hasPermission( 'bit_p_blog_post' )}
							{if ($gBitUser->isAdmin()) or ($listpages[changes].individual eq 'n') or ($listpages[changes].individual_gBitUser->hasPermission( 'bit_p_blog_post' ))}
								{if ($gBitUser->mUserId and $listpages[changes].user_id eq $gBitUser->mUserId) or ($gBitUser->hasPermission( 'bit_p_blog_admin' )) or ($listpages[changes].public eq 'y')}
									<a title="{tr}post{/tr}" href="{$smarty.const.BLOGS_PKG_URL}post.php?blog_id={$listpages[changes].blog_id}">{biticon ipackage=liberty iname="edit" iexplain="post"}</a>
								{/if}
							{/if}
						{/if}
						{if ($gBitUser->mUserId and $listpages[changes].user_id eq $gBitUser->mUserId) or ($gBitUser->hasPermission( 'bit_p_blog_admin' ))}
							{if ($gBitUser->isAdmin()) or ($listpages[changes].individual eq 'n') or ($listpages[changes].individual_gBitUser->hasPermission( 'bit_p_blog_create_blog' ))}
								<a title="{tr}edit{/tr}" href="{$smarty.const.BLOGS_PKG_URL}edit.php?blog_id={$listpages[changes].blog_id}">{biticon ipackage=liberty iname="config" iexplain="configure"}</a>
							{/if}
						{/if}
						{if ($gBitUser->mUserId and $listpages[changes].user_id eq $gBitUser->mUserId) or ($gBitUser->hasPermission( 'bit_p_blog_admin' ))}
							{if ($gBitUser->isAdmin()) or ($listpages[changes].individual eq 'n') or ($listpages[changes].individual_gBitUser->hasPermission( 'bit_p_blog_create_blog' ))}
								<a title="{tr}remove{/tr}" href="{$smarty.const.BLOGS_PKG_URL}list_blogs.php?offset={$offset}&amp;sort_mode={$sort_mode}&amp;remove={$listpages[changes].blog_id}">{biticon ipackage=liberty iname="delete" iexplain="delete"}</a>
							{/if}
						{/if}
						{if $gBitUser->isAdmin()}
						    <a title="{tr}perms{/tr}" href="{$smarty.const.KERNEL_PKG_URL}object_permissions.php?objectName=blog%20{$listpages[changes].title}&amp;objectType=blog&amp;permType=blogs&amp;object_id={$listpages[changes].blog_id}">{if $listpages[changes].individual eq 'y'}{biticon ipackage=liberty iname="permissionsi_set" iexplain="set permissions"}{else}{biticon ipackage=liberty iname="permissions" iexplain="set permissions"}{/if}</a>
						{/if}
					</div>

					{if $blog_list_title eq 'y'}
						<h2>{if ($gBitUser->isAdmin()) or ($listpages[changes].individual eq 'n') or ($listpages[changes].individual_gBitUser->hasPermission( 'bit_p_read_blog' ))}<a title="{$listpages[changes].title}" href="{$listpages[changes].blog_url}">{/if}
						{$listpages[changes].title|truncate:20:"...":true}{if ($gBitUser->isAdmin()) or ($listpages[changes].individual eq 'n') or ($listpages[changes].individual_gBitUser->hasPermission( 'bit_p_read_blog' ))}</a>{/if}</h2>
					{/if}

					{if $blog_list_description eq 'y'}
						<p>{$listpages[changes].description}</p>
					{/if}

					<div class="date">
						{if $blog_list_user eq 'y'}
							{if $blog_list_user eq 'link'}
								{tr}Created by {$listpages[changes].user|userlink}{/tr}
							{elseif $blog_list_user eq 'avatar'}
								{$listpages[changes].user|avatarize}
							{else}
								{tr}Created by {$listpages[changes].user}{/tr}
							{/if}
						{/if}

						{if $blog_list_created eq 'y'}
							<br />{tr}Created on {$listpages[changes].created|bit_short_date}{/tr}
						{/if}

						{if $blog_list_lastmodif eq 'y'}
							<br />{tr}Last Modified {$listpages[changes].last_modified|bit_short_datetime}{/tr}
						{/if}
					</div>

					<div class="footer">
						{if $blog_list_posts eq 'y'}
							{tr}Posts: {$listpages[changes].posts}{/tr}&nbsp;&bull;&nbsp;
						{/if}
						
						{if $blog_list_visits eq 'y'}
							{tr}Visits: {$listpages[changes].hits}{/tr}&nbsp;&bull;&nbsp;
						{/if}
						
						{if $blog_list_activity eq 'y'}
							{tr}Activity: {$listpages[changes].activity|default:0}{/tr}
						{/if}
					</div>

					<div class="clear"></div>
				<li>
			{sectionelse}
				<li class="item norecords">
					{tr}No records found{/tr}
				</li>
			{/section}
		</ul>

		{pagination}
	</div><!-- end .body -->
</div><!-- end .blog -->

{/strip}
