	<div id="input_area" style="display:none;">
		<!--HP{if !empty($mainMenuVtable)}HP-->
		<ul class="input clearfix">
		<!--HP{foreach from=$mainMenuVtable key=key item=v}HP-->
			<!--HP{if $v.table_type == 4}HP-->
			<li style="background:url(<!--HP{$smarty.const.UPLOAD_URL}HP-->img/menu/<!--HP{$v.icon_name|escape}HP-->) no-repeat 4px 4px;background-position-x:50%;background-position-y:0%;"><a href="<!--HP{$documentRoot}HP-->knowledge.php?mode=<!--HP{$v.initial_screen_name}HP-->"><p><!--HP{$v.icon_menu_title|escape}HP--></p></a></li>
			<!--HP{elseif $v.table_type == 11}HP-->
			<li style="background:url(<!--HP{$smarty.const.UPLOAD_URL}HP-->img/menu/<!--HP{$v.icon_name|escape}HP-->) no-repeat 4px 4px;background-position-x:50%;background-position-y:0%;"><a href="<!--HP{$documentRoot}HP-->message.php?mode=<!--HP{$v.initial_screen_name}HP-->"><p><!--HP{$v.icon_menu_title|escape}HP--></p></a></li>
			<!--HP{elseif $v.table_type == 12}HP-->
			<li style="background:url(<!--HP{$smarty.const.UPLOAD_URL}HP-->img/menu/<!--HP{$v.icon_name|escape}HP-->) no-repeat 4px 4px;background-position-x:50%;background-position-y:0%;"><a href="<!--HP{$documentRoot}HP-->cms.php?mode=<!--HP{$v.initial_screen_name}HP-->&manage_id=<!--HP{$v.table_info_id}HP-->"><p><!--HP{$v.icon_menu_title|escape}HP--></p></a></li>
			<!--HP{else}HP-->
			<li style="background:url(<!--HP{$smarty.const.UPLOAD_URL}HP-->img/menu/<!--HP{$v.icon_name|escape}HP-->) no-repeat 4px 4px;background-position-x:50%;background-position-y:0%;"><a href="<!--HP{$documentRoot}HP-->manage.php?mode=<!--HP{$v.initial_screen_name}HP-->&manage_id=<!--HP{$v.table_info_id}HP-->"><p><!--HP{$v.icon_menu_title|escape}HP--></p></a></li>
			<!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
		</ul>
		<!--HP{/if}HP-->
	</div>