{strip}
<div class="pageactions tabs">
	<ul>
		<li>{smartlink ititle='create new group' ifile='admin/edit_group.php' action=create}</li>
	</ul>
</div> <!-- end .tabs -->
<div class="clear"></div>

<div class="listing users">

	<div class="header">
		<h1>{tr}List of existing groups{/tr}</h1>
	</div>

	<div class="body">
		<div class="pageactions sort">
			<ul>
				<li>{biticon ipackage=liberty iname=sort iexplain="sort by"}</li>
				<li>{smartlink ititle="Name" isort="group_name" offset=$offset idefault=1}</li>
				<li>{smartlink ititle="Description" isort="group_desc" offset=$offset}</li>
				<li>{smartlink ititle="Home Page" isort="group_home" offset=$offset}</li>
			</ul>
		</div><!-- end .pageactions -->

		<div class="clear"></div>

		{formfeedback success=$successMsg error=$errorMsg}

		<ul class="data">
			{foreach from=$groups key=groupId item=group}
				<li class="item {cycle values='odd,even'}">
					<div class="pageactions tabs">
						<ul>
							<li>{smartlink ititle='edit group' ifile='admin/edit_group.php' group_id=$groupId}</li>
							{if $groupId ne -1}{* sorry for hardcoding, really need php define ANONYMOUS_GROUP_ID - spiderr - we should add admins to groups that can't be deleted - xing*}
								<li>{smartlink ititle='remove group' ifile='admin/edit_group.php' group_id=$groupId action='delete'}</li>
							{/if}
						</ul>
					</div> <!-- end .tabs -->
					<div class="clear"></div>

					<h2>{$group.group_name}{if $group.is_default eq 'y'}<small class="warning"> *{tr}Default group{/tr}*</small>{/if}</h2>
					<div style="float:left;width:30%;">
						{$group.group_desc}<br />
						{if $group.group_home}{tr}Home Page{/tr}:<strong> {$group.group_home}</strong><br />{/if}
						{if $group.included}
							<br />{tr}Included Groups{/tr}
							<ul class="small">
								{foreach from=$group.included key=incGroupId item=incGroupName}
									<li>{$incGroupName}</li>
								{/foreach}
							</ul>
						{/if}
					</div>
	
					<div style="float:right;width:70%;">
						{tr}Permissions{/tr}
						<ul class="small">
							{foreach from=$group.perms key=permName item=perm}
								<li>{$perm.perm_desc}</li>
							{foreachelse}
								<li>{tr}none{/tr}</li>
							{/foreach}
						</ul>
					</div>
					<div class="clear"></div>
				</li>
			{/foreach}
		</ul>
		{pagination}
	</div><!-- end .body -->
</div><!-- end .users -->
{/strip}
