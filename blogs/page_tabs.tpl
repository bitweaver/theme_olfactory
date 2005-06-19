{strip}
{if $gBitUser->hasPermission( 'bit_p_view_tabs_and_tools' )}
	<div class="pageactions tabs">
		<ul>
			<li>{smartlink ititle='permalink' iurl=`$blogPosts[ix].post_url`}</li>

			{if ($blogPosts[ix].ownsblog eq 'y') or ($gBitUser->mUserId and $blogPosts[ix].user_id eq $gBitUser->mUserId) or $gBitUser->hasPermission( 'bit_p_blog_admin' )}
				<li>{smartlink ititle='edit' ifile='post.php' blog_id=`$blogPosts[ix].blog_id` post_id=`$blogPosts[ix].post_id`}</li>
			{/if}

			{* this comment stuff should probably go somewhere else *}
			{if $blogPosts[ix].allow_comments eq 'y' and $gBitSystemPrefs.feature_blogposts_comments eq 'y'}
				<li>{$blogPosts[ix].num_comments} {if $blogPosts[ix].num_comments == 1} {tr}comment{/tr} {else} {tr}comments{/tr}{/if}</li>
				<li>{smartlink ititle='view / post comments' ifile='view_post.php' find=$find offset=$offset blog_id=`$blogPosts[ix].blog_id` post_id=`$blogPosts[ix].post_id` post_comment_request=1}</li>
			{/if}
		</ul>
	</div> <!-- end .tabs -->
	<div class="clear"></div>
{/if}
{/strip}
