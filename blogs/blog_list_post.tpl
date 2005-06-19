{strip}
{include file="bitpackage:blogs/page_tabs.tpl"}
<div class="post"
	{if $user_dbl eq 'y' and (($blogPosts[ix].ownsblog eq 'y') or ($gBitUser->mUserId and $blogPosts[ix].user_id eq $gBitUser->mUserId) or $gBitUser->hasPermission( 'bit_p_blog_admin' ))}
		ondblclick="location.href='{$gBitLoc.BLOGS_PKG_URL}post.php?blog_id={$blogPosts[ix].blog_id}{$blog_id}&amp;post_id={$blogPosts[ix].post_id}{$post_id}';"
	{/if}
>
	<div class="header">
		{if $blogPosts[ix].title}
			<h1>{$blogPosts[ix].title}</h1>
		{else}
			<h1>{$blogPosts[ix].created|bit_long_date}</h1>
		{/if}

		<div class="date">
			{if $blog_categ eq 'y'}
				{*popup_init src="`$gBitLoc.THEMES_PKG_URL`js/overlib.js"*}
				<div style="float:right;" valign="top">
					{if $blogPosts[ix].categs}
						{section name=k loop=$blogPosts[ix].categs}
							{biticon ipackage=categories iname=$blogPosts[ix].categs[k].name|cat:'.png'}
						{/section}
					{/if}

					{if $gBitUser->isAdmin()}
						<a href="#" {popup text=$choosecateg|replace:':::blogid:::':$blogPosts[ix].blog_id|replace:':::postid:::':$blogPosts[ix].post_id 
						fullhtml="1" sticky="1" trigger="onClick" bgcolor="#000000" fgcolor="#ffffff" border="1" fixx="-10" snapy="10" }>cat</a>
					{/if}
				</div>
			{/if}

			{if $showBlogTitle}{displayname hash=$blogPosts[ix]} {tr}in{/tr} <a href="{$blogPosts[ix].blog_url}">{$blogPosts[ix].blogtitle}</a>{/if}<br />
			{$blogPosts[ix].created|bit_long_date}
		</div>
	</div>

	<div class="body">
		<div class="content">
			{if $blogPosts[ix].avatar}<img src="{$blogPosts[ix].avatar}" class="avatar" />{/if}
			{$blogPosts[ix].parsed_data}
			<p>
				{tr}Posted on {$blogPosts[ix].created|bit_long_datetime}{/tr}
			</p>
		</div> <!-- end .content -->

		{if $blogPosts[ix].pages > 1}
			<a href="{$gBitLoc.BLOGS_PKG_URL}view_post.php?blog_id={$blogPosts[ix].blog_id}&amp;post_id={$blogPosts[ix].post_id}">{tr}read more{/tr} ({$blogPosts[ix].pages} {tr}pages{/tr})</a>
		{/if}

		<div class="footer">
			{if $blogPosts[ix].trackbacks_from_count}({tr}referenced by{/tr}: {$blogPosts[ix].trackbacks_from_count} {tr}posts{/tr} / {tr}references{/tr}: {$blogPosts[ix].trackbacks_to_count} {tr}posts{/tr}){/if}
		</div>
	</div> <!-- end .body -->
	
	{include file="bitpackage:blogs/page_tools.tpl"}
</div> <!-- end .post -->
{/strip}
