<!--HP{if $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_TEXT || $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_QRCODE}HP-->
	<!--HP{if $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_AUTO_NUMBER}HP-->
		<input type="hidden" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$column.value_display|escape}HP-->" /><!--HP{$column.value_display|escape}HP-->
	<!--HP{else}HP-->
		<input type="text" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$column.value_display|escape}HP-->" class="<!--HP{if $colNum == 2 && !isset($column.colspan)}HP-->inputtext_small<!--HP{else}HP-->inputtext_large<!--HP{/if}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" />
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_TEXTAREA}HP-->
	<textarea name="<!--HP{$column.column_name}HP-->" class="<!--HP{if $colNum == 2 && !isset($column.colspan)}HP-->textarea_small<!--HP{/if}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->"><!--HP{$column.value_display|escape}HP--></textarea>
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_TEXTAREA_WYSIWYG}HP-->
	
	<textarea  cols="80" rows="10" name="<!--HP{$column.column_name}HP-->" class="<!--HP{if $colNum == 2 && !isset($column.colspan)}HP-->textarea_small<!--HP{/if}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->"><!--HP{$column.value_display|escape}HP--></textarea>
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_RADIO}HP-->
	<!--HP{if $column.column_name == "work_fire_flg"}HP-->
		<!--HP{foreach from=$column.select_item key=key item=value}HP-->
		<!--HP{if $key == 1}HP-->
			<input type="radio" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" id="fire_application_flag" href="/manage.php?mode=fire_application&manage_id=<!--HP{$manageId}HP-->&column_id=<!--HP{$column.column_info_id}HP--><!--HP{if isset($recordId)}HP-->&record_id=<!--HP{$recordId}HP--><!--HP{/if}HP-->&iframe=true&width=100%&height=100%" <!--HP{if $key == $column.value_display}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
		<!--HP{else}HP-->
			<input type="radio" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->"  <!--HP{if $key == $column.value_display}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
		<!--HP{/if}HP-->
		<!--HP{if $column.multi_select_form_display_type == $smarty.const.COLUMN_VALUE_MULTI_SELECT_FORM_DISPLAY_TYPE_VERTICAL}HP--><br /><!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
	<!--HP{else}HP-->
		<!--HP{foreach from=$column.select_item key=key item=value}HP-->
			<input type="radio" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if $key == $column.value_display}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
			<!--HP{if $column.multi_select_form_display_type == $smarty.const.COLUMN_VALUE_MULTI_SELECT_FORM_DISPLAY_TYPE_VERTICAL}HP--><br /><!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_CHECKBOX_SINGLE}HP-->
	<!--HP{foreach from=$column.select_item key=key item=value}HP-->
		<!--HP{if $key == $smarty.const.FLAG_ON}HP-->
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
			<input type="checkbox" <!--HP{if $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_FIRE_APPLICATION_FLAG}HP-->id="fire_application_flag" href="/manage.php?mode=fire_application&manage_id=<!--HP{$manageId}HP-->&column_id=<!--HP{$column.column_info_id}HP--><!--HP{if isset($recordId)}HP-->&record_id=<!--HP{$recordId}HP--><!--HP{/if}HP-->&iframe=true&width=100%&height=100%"<!--HP{/if}HP--> name="<!--HP{$column.column_name}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" id="type1" <!--HP{if $key == $column.value_display}HP-->checked<!--HP{/if}HP-->/><label for="type1"><!--HP{$value}HP--></label></fieldset>
</div>
		<!--HP{/if}HP-->
	<!--HP{/foreach}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_DROPDOWNLIST}HP-->
	<!--HP{if $column.column_type == $smarty.const.COLUMN_VALUE_COLUMN_TYPE_DATE}HP-->
		<!--HP{html_select_date prefix=$column.column_name time=$column.value_display field_order="Y" year_empty="----" end_year=+10 all_extra="tabindex="|cat:$column.tab_index|escape}HP-->年
		<!--HP{html_select_date prefix=$column.column_name time=$column.value_display field_order="M" month_empty="--" month_format="%m" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->月
		<!--HP{html_select_date prefix=$column.column_name time=$column.value_display field_order="D" day_empty="--" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->日
	<!--HP{elseif $column.column_type == $smarty.const.COLUMN_VALUE_COLUMN_TYPE_TIME}HP-->
		<!--HP{html_select_time_empty prefix=$column.column_name time=$column.value_display display_minutes=false display_seconds=false hour_empty="--" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->時
		<!--HP{html_select_time_empty prefix=$column.column_name time=$column.value_display display_hours=false display_seconds=false minute_empty="--" minute_interval=15 all_extra="tabindex="|cat:$column.tab_index|escape}HP-->分
	<!--HP{elseif $column.column_type == $smarty.const.COLUMN_VALUE_COLUMN_TYPE_TIMESTAMP}HP-->
		<!--HP{html_select_date prefix=$column.column_name time=$column.value_display field_order="Y" year_empty="----" end_year=+10 all_extra="tabindex="|cat:$column.tab_index|escape}HP-->年
		<!--HP{html_select_date prefix=$column.column_name time=$column.value_display field_order="M" month_empty="--" month_format="%m" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->月
		<!--HP{html_select_date prefix=$column.column_name time=$column.value_display field_order="D" day_empty="--" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->日
		<!--HP{html_select_time_empty prefix=$column.column_name time=$column.value_display display_minutes=false display_seconds=false hour_empty="--" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->時
		<!--HP{html_select_time_empty prefix=$column.column_name time=$column.value_display display_hours=false display_seconds=false minute_empty="--" minute_interval=15 all_extra="tabindex="|cat:$column.tab_index|escape}HP-->分
	<!--HP{elseif $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_SELECT_ASSOCIATION}HP-->
		<!--HP{if $column.use_add_association_flag}HP-->
			<!--HP{$column.value_display.name}HP-->
			<input type="hidden" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$column.value_display.value}HP-->" />
		<!--HP{else}HP-->
			<div style="float:left;">
				<select name="<!--HP{$column.column_name}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" data-mini="true">
				<option value="" />選択してください</option>
				<!--HP{foreach from=$column.select_item key=key item=value}HP-->
                    <option value="<!--HP{$key}HP-->" <!--HP{if $key == $column.value_display.value}HP-->selected<!--HP{/if}HP--> /><!--HP{$value}HP--></option>
				<!--HP{/foreach}HP-->
				</select>
			</div>
			<div>
				<p class="lb5" style="float:left;margin-left:8px;"><a class="blue popup" href="/manage.php?mode=search&manage_id=<!--HP{$column.parent_table_id}HP-->&iframe=true&width=100%&height=100"><span>選択</span></a></p>
				<p class="lb5" style="float:left;"><a class="pink" href="javascript:void();" onClick="clearManage(); return false;"><span>クリア</span></a></p>
			</div>
			<!--HP{$tenantId = $column.column_name}HP-->
			<script type="text/javascript">
			<!--
			
			function setManage1272(virtual_row_id, name, department_name){
				window.document.forms["formEditManage"].elements["<!--HP{$column.column_name}HP-->"].value = virtual_row_id;
			}
			
			function setManage1273(virtual_row_id, name, department_name){
				window.document.forms["formEditManage"].elements["<!--HP{$column.column_name}HP-->"].value = virtual_row_id;
			}
			
			function setManage1274(virtual_row_id, name, department_name){
				window.document.forms["formEditManage"].elements["<!--HP{$column.column_name}HP-->"].value = virtual_row_id;
			}
			
			function setManage1275(virtual_row_id, name, department_name){
				window.document.forms["formEditManage"].elements["<!--HP{$column.column_name}HP-->"].value = virtual_row_id;
			}

			function clearManage(){
				window.document.forms["formEditManage"].elements["<!--HP{$column.column_name}HP-->"].value = "";
			}
			-->
			</script>
		<!--HP{/if}HP-->
	<!--HP{else}HP-->
		<select name="<!--HP{$column.column_name}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->"  data-mini="true">
		<option value="" />選択してください</option>
		<!--HP{foreach from=$column.select_item key=key item=value}HP-->
			<!--HP{if $column.value_display==null }HP-->
				<option value="<!--HP{$key}HP-->" <!--HP{if $column.select_item_default[$key] == 1}HP-->selected<!--HP{/if}HP--> /><!--HP{$value}HP-->NULL</option>
			<!--HP{else}HP-->
				<option value="<!--HP{$key}HP-->" <!--HP{if $key == $column.value_display }HP-->selected<!--HP{/if}HP--> /><!--HP{$value}HP-->ありあり</option>
			<!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
		</select>
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_FILE}HP-->
	<!--HP{if isset($column.file_url) && !empty($column.file_url)}HP-->
	<a href="<!--HP{$column.file_url}HP-->"><!--HP{$column.value_display|escape}HP--></a> 
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<input type="checkbox" name="<!--HP{$column.column_name|escape}HP-->_delete_check" value="1" tabindex="<!--HP{$column.tab_index|escape}HP-->" id="type1" /><label for="type1">ファイルを削除する</label>
</fieldset>
</div>


	<span><input type="file" name="<!--HP{$column.column_name|escape}HP-->" id="select_file<!--HP{$column.column_info_id}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" /></span>
	<input type="button" value="クリア" onClick="clearSelectFile($('#select_file<!--HP{$column.column_info_id}HP-->'))" tabindex="<!--HP{$column.tab_index|escape}HP-->" data-inline="true" data-mini="true" />
	<!--HP{else}HP-->
	<span><input type="file" name="<!--HP{$column.column_name|escape}HP-->" id="select_file<!--HP{$column.column_info_id}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" /></span>
	<input type="button" value="クリア" onClick="clearSelectFile($('#select_file<!--HP{$column.column_info_id}HP-->'))" tabindex="<!--HP{$column.tab_index|escape}HP-->" data-inline="true" data-mini="true"/>
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_CHECKBOX_MULTI}HP-->
	<!--HP{if $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_REFERABLE_GROUP}HP-->
		<input type="checkbox" id="referable_check" tabindex="<!--HP{$column.tab_index|escape}HP-->" />ALL<br />
		<input type="checkbox" id="backstaff_check" tabindex="<!--HP{$column.tab_index|escape}HP-->" />バックスタッフ<br /><br />
		<!--HP{foreach from=$column.select_item key=key item=value}HP-->
			<input type="checkbox" name="<!--HP{$column.column_name}HP-->[<!--HP{$key}HP-->]" class="referable_group<!--HP{if $column.select_item_option.$key == 1}HP--> backstaff_group<!--HP{/if}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if in_array($key,$column.value_display)}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
			<!--HP{if $column.multi_select_form_display_type == $smarty.const.COLUMN_VALUE_MULTI_SELECT_FORM_DISPLAY_TYPE_VERTICAL}HP--><br /><!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
	<!--HP{elseif $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_BRIEFING_SESSION_DATE}HP-->
		<p class="lb5"><a id="btn_edit_briefing_session_date" class="blue popup" href="/manage.php?mode=edit_briefing_session_date&manage_id=<!--HP{$manageId}HP-->&iframe=true&width=100%&height=100%"><span>日程の追加</span></a></p>
		<p class="lb5"><a class="pink" href="javascript:void();" onclick="deleteBriefingSessionDate(); return false;"><span>チェックした日程を削除</span></a></p>
		<table id="briefingSessionDate" style="width:100%;">
			<tr>
				<th style="width:53px;">編集</th>
				<th>開催No</th>
				<th>日時</th>
				<th>タイトル</th>
				<th>削除</th>
			</tr>
		</table>
	<!--HP{else}HP-->
			<!--HP{foreach from=$column.select_item key=key item=value}HP-->
				<input type="checkbox" name="<!--HP{$column.column_name}HP-->[<!--HP{$key}HP-->]" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if in_array($key,$column.value_display)}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
				<!--HP{if $column.multi_select_form_display_type == $smarty.const.COLUMN_VALUE_MULTI_SELECT_FORM_DISPLAY_TYPE_VERTICAL}HP--><br /><!--HP{/if}HP-->
			<!--HP{/foreach}HP-->
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_CALENDER}HP-->
	<!--HP{if $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_MULTIPLE_DATE}HP-->
		<input type="text" name="<!--HP{$column.column_name}HP-->" class="date-pick-multiple" value="<!--HP{$column.value_display}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" readonly />
	<!--HP{else}HP-->
		<input type="text" name="<!--HP{$column.column_name}HP-->" class="date-pick" value="<!--HP{$column.value_display}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" readonly />
	<!--HP{/if}HP-->
<!--HP{else}HP-->
	<!--HP{$column.value_display|escape|nl2br}HP-->
<!--HP{/if}HP-->
