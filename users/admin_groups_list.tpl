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
		{smartlink ititle="Add a new group" ipackage=users ifile="admin/edit_group.php" action=create}

		<div class="pageactions sort">
			<ul>
				<li>{booticon iname="icon-circle-arrow-right"  ipackage="icons"  iexplain="sort by"}</li>
				<li>{smartlink ititle="Name" isort="group_name" offset=$offset idefault=1}</li>
				<li>{smartlink ititle="Description" isort="group_desc" offset=$offset}</li>
				<li>{smartlink ititle="Home Page" isort="group_home" offset=$offset}</li>
			</ul>
		</div><!-- end .pageactions -->

		{formfeedback success=$successMsg error=$errorMsg}

		<ul class="clear data">
			{foreach from=$groupList key=groupId item=grp}
				<li class="item {cycle values='odd,even'}">
					<div class="floaticon">
						{smartlink ititle="Edit" ipackage="users" ifile="admin/edit_group.php" booticon="icon-edit" group_id=$groupId}
						{smartlink ititle="Group Members" ipackage="users" ifile="admin/edit_group.php" booticon="icon-group" members=$groupId}
						{if $groupId ne $smarty.const.ANONYMOUS_GROUP_ID}
							{smartlink ititle="Batch assign" ipackage="users" ifile="admin/edit_group.php" ibiticon="icons/application-x-executable" batch_assign=$groupId}
							{smartlink ititle="Remove" ipackage="users" ifile="admin/edit_group.php" booticon="icon-trash" action=delete group_id=$groupId}
						{/if}
					</div>

					<h2>{$grp.group_name}</h2>
					<div style="float:left;width:30%;">
						{$grp.group_desc}<br />
						{if $grp.is_default eq 'y'}<small class="warning"> *{tr}Default group{/tr}*</small><br/>{/if}
						{if $grp.group_home}{tr}Home Page{/tr}:<strong> {$grp.group_home}</strong><br />{/if}
						{if $grp.included}
							<br />{tr}Included Groups{/tr}
							<ul class="small">
								{foreach from=$grp.included key=incGroupId item=incGroupName}
									<li class="{cycle values="odd,even"} item">{$incGroupName}</li>
								{/foreach}
							</ul>
						{/if}
					</div>

					<div style="float:right;width:70%;">
						{tr}Permissions{/tr}
						<ul class="small">
							{foreach from=$grp.perms key=permName item=perm}
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
