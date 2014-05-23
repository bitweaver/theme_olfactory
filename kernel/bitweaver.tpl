{include file="bitpackage:kernel/header.tpl"}
{strip}
{if $print_page ne "y"}
	{if $gBitSystem->isFeatureActive( 'bidirectional_text' )}
		<div dir="rtl">
	{/if}

	<div id="wrap1" class="pkg-{$smarty.const.ACTIVE_PACKAGE|lower}">
		<div id="bittop">
			<div id="toplogin">
			
				{if $gBitUser->isRegistered()}
					{displayname} <a href="{$smarty.const.USERS_PKG_URL}logout.php">{tr}logout{/tr}</a>
				{else}
					<a href="{$smarty.const.USERS_PKG_URL}login.php">{tr}login{/tr}</a>
					{if $gBitSystem->isFeatureActive( 'users_allow_register' )}
						&nbsp;<a href="{$smarty.const.USERS_PKG_URL}register.php">{tr}register{/tr}</a>
					{/if}
				{/if}
			
			</div>

			{if $gBitSystem->isFeatureActive( 'site_top_bar' )}
				{include file="bitpackage:kernel/top_bar.tpl"}
			{/if}
		</div><!-- end #bittop -->
		
		{include file="bitpackage:kernel/top.tpl"}

		<div id="bitbody">
			<div id="bitmain">
				{include file="bitpackage:liberty/display_structure.tpl"}
				<a style="padding:0;margin:0;border:0;" name="content"></a>
				{include file=$mid}
			</div><!-- end #bitmain -->

			{*<div id="bitmodules">
				{section name=homeix loop=$l_modules}
					{$l_modules[homeix].data}
				{/section}

				{section name=homeix loop=$r_modules}
					{$r_modules[homeix].data}
				{/section}
			</div><!-- end #bitmodules -->*}

			<div id="bitbottom">
				{if $gBitSystem->isFeatureActive( 'site_bot_bar' )}
					{include file="bitpackage:kernel/bot_bar.tpl"}
				{/if}
			</div><!-- end #bitbottom -->
		</div><!-- end #bitbody -->
	</div><!-- end #wrap1 -->
	{if $gBitSystem->isFeatureActive( 'bidirectional_text' )}
		</div>
	{/if}
	{include file="bitpackage:kernel/footer.tpl"}
{/if}
{/strip}

