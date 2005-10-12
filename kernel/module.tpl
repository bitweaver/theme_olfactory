{* $Header: /cvsroot/bitweaver/_bit_styles/olfactory/kernel/Attic/module.tpl,v 1.3 2005/10/12 15:13:58 spiderr Exp $ *}
{strip}
<div class="module box {$module_name|replace:"_":"-"}">
	{if $module_title}
		<h3>
			{if $gBitSystem->isFeatureActive( 'feature_modulecontrols' )}
				<div class="control">
					<a title="{tr}Move module up{/tr}" href="{$current_location|escape}{$mpchar}mc_up={$module_name|escape}">
						{biticon ipackage=liberty iname="move_up" iexplain="up"}</a>
					<a title="{tr}Move module down{/tr}" href="{$current_location|escape}{$mpchar}mc_down={$module_name|escape}">
						{biticon ipackage=liberty iname="move_down" iexplain="down"}</a>
					<a title="{tr}Move module to opposite side{/tr}" href="{$current_location|escape}{$mpchar}mc_move={$module_name|escape}">
						{biticon ipackage=liberty iname="move_left_right" iexplain="move left right"}</a>
					<a title="{tr}Unassign this module{/tr}" href="{$current_location|escape}{$mpchar}mc_unassign={$module_name|escape}" onclick="return confirmTheLink(this,'{tr}Are you sure you want to unassign this module?{/tr}')">
						{biticon ipackage=liberty iname="delete_small" iexplain="remove"}</a>
				</div>
			{/if}
			{if $gBitSystem->isFeatureActive( 'feature_collapsible_modules' )}<a href="javascript:toggle('{$module_name}');">{/if}
				{tr}{$module_title}{/tr}
			{if $gBitSystem->isFeatureActive( 'feature_collapsible_modules' )}</a>{/if}
		</h3>
	{/if}
	<div class="boxcontent" id="{$module_name}"{if $gBitSystem->isFeatureActive( 'feature_collapsible_modules' )} style="display:{$toggle_state};"{/if}>
	    {$module_content}
	</div>
</div>
{/strip}
