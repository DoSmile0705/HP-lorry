<!--HP{if $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_TEXT || $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_QRCODE}HP-->
	<!--HP{if $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_AUTO_NUMBER}HP-->
		<input type="hidden" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$column.value_display|escape}HP-->" /><!--HP{$column.value_display|escape}HP-->
	<!--HP{elseif $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_PASSWORD}HP-->
		<input type="password" name="<!--HP{$column.column_name}HP-->" class="form-control input-sm" value="" class="<!--HP{if $colNum == 2 && !isset($column.colspan)}HP-->inputtext_small<!--HP{else}HP-->inputtext_large<!--HP{/if}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" />
	<!--HP{else}HP-->
		<!--HP{if $column.column_name == 'deposit_for_drawing'}HP-->
			<!--HP{foreach from=$images item=iv}HP-->
				<img class="image_a" id="<!--HP{$iv.virtual_row_id}HP-->" src="/uploads/<!--HP{$iv.image}HP-->" style="width:70px;" />
			<!--HP{/foreach}HP-->
		<!--HP{/if}HP-->
		<input type="text" name="<!--HP{$column.column_name}HP-->" class="form-control input-sm" value="<!--HP{$column.value_display|escape}HP-->" class="<!--HP{if $colNum == 2 && !isset($column.colspan)}HP-->inputtext_small<!--HP{else}HP-->inputtext_large<!--HP{/if}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if $column.placeholder_visible_flg == 1 }HP-->placeholder="<!--HP{$column.placeholder_text|escape}HP-->"<!--HP{/if}HP-->/>
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_TEXTAREA}HP-->
	<textarea name="<!--HP{$column.column_name}HP-->" class="<!--HP{if $colNum == 2 && !isset($column.colspan)}HP-->textarea_small<!--HP{else}HP-->form-control input-sm<!--HP{/if}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->"><!--HP{$column.value_display|escape}HP--></textarea>
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_TEXTAREA_WYSIWYG}HP-->
	<!--HP{*<a href="/imagelist/" target="_blank"><img src="<!--HP{$documentRoot}HP-->img/prv_img.gif" width="20px"></a>*}HP-->
	<textarea class="ckeditor" cols="80" rows="10" name="<!--HP{$column.column_name}HP-->" class="<!--HP{if $colNum == 2 && !isset($column.colspan)}HP-->textarea_small<!--HP{/if}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->"><!--HP{$column.value_display|escape}HP--></textarea>
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_RADIO}HP-->
	<!--HP{if $column.column_name == "work_fire_flg"}HP-->
		<!--HP{foreach from=$column.select_item key=key item=value}HP-->
		<!--HP{if $key == 1}HP-->
			<div class="form-check-radio form-check-inline">
				<label class="form-check-label">
					<input type="radio" class="form-check-input" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" id="fire_application_flag" href="/manage.php?mode=fire_application&manage_id=<!--HP{$manageId}HP-->&column_id=<!--HP{$column.column_info_id}HP--><!--HP{if isset($recordId)}HP-->&record_id=<!--HP{$recordId}HP--><!--HP{/if}HP-->&iframe=true&width=100%&height=100%" <!--HP{if $key == $column.value_display}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
					<span class="form-check-sign"></span>
				</label>
			</div>
		<!--HP{else}HP-->
			<div class="form-check-radio form-check-inline">
				<label class="form-check-label">
					<input type="radio" class="form-check-input" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->"  <!--HP{if $key == $column.value_display}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
					<span class="form-check-sign"></span>
				</label>
			</div>
		<!--HP{/if}HP-->
		<!--HP{if $column.multi_select_form_display_type == $smarty.const.COLUMN_VALUE_MULTI_SELECT_FORM_DISPLAY_TYPE_VERTICAL}HP--><br /><!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
	<!--HP{else}HP-->
		<!--HP{if !empty($column.select_item_default)}HP-->
		<!--HP{foreach from=$column.select_item key=key item=value}HP-->
			<div class="form-check-radio form-check-inline">
				<label class="form-check-label">
					<input type="radio" class="form-check-input" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if $key == $column.value_display || $column.select_item_default[$key] == 1}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
					<span class="form-check-sign"></span>
				</label>
			</div>
			<!--HP{if $column.multi_select_form_display_type == $smarty.const.COLUMN_VALUE_MULTI_SELECT_FORM_DISPLAY_TYPE_VERTICAL}HP--><br /><!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
		<!--HP{else}HP-->
		<!--HP{foreach from=$column.select_item key=key item=value}HP-->
			<div class="form-check-radio form-check-inline">
				<label class="form-check-label">
					<input type="radio" class="form-check-input" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if $key == $column.value_display}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
					<span class="form-check-sign"></span>
				</label>
			</div>
			<!--HP{if $column.multi_select_form_display_type == $smarty.const.COLUMN_VALUE_MULTI_SELECT_FORM_DISPLAY_TYPE_VERTICAL}HP--><br /><!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
		<!--HP{/if}HP-->
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_CHECKBOX_SINGLE}HP-->
	<!--HP{foreach from=$column.select_item key=key item=value}HP-->
		<!--HP{if $key == $smarty.const.FLAG_ON}HP-->
            <input type="checkbox" class="bootstrap-switch" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" <!--HP{if $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_FIRE_APPLICATION_FLAG}HP-->id="fire_application_flag" href="/manage.php?mode=fire_application&manage_id=<!--HP{$manageId}HP-->&column_id=<!--HP{$column.column_info_id}HP--><!--HP{if isset($recordId)}HP-->&record_id=<!--HP{$recordId}HP--><!--HP{/if}HP-->&iframe=true&width=100%&height=100%"<!--HP{/if}HP--> name="<!--HP{$column.column_name}HP-->" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if $key == $column.value_display}HP-->checked<!--HP{/if}HP-->/><!--HP{$value}HP-->
		<!--HP{/if}HP-->
	<!--HP{/foreach}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_DROPDOWNLIST}HP-->
	<!--HP{if $column.column_type == $smarty.const.COLUMN_VALUE_COLUMN_TYPE_DATE}HP-->
		<!--HP{html_select_date unnecessary_default=true prefix=$column.column_name time=$column.value_display field_order="Y" year_empty="----" end_year=+10 all_extra="tabindex="|cat:$column.tab_index|escape}HP-->年
		<!--HP{html_select_date unnecessary_default=true prefix=$column.column_name time=$column.value_display field_order="M" month_empty="--" month_format="%m" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->月
		<!--HP{html_select_date unnecessary_default=true prefix=$column.column_name time=$column.value_display field_order="D" day_empty="--" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->日
	<!--HP{elseif $column.column_type == $smarty.const.COLUMN_VALUE_COLUMN_TYPE_TIME}HP-->
		<!--HP{html_select_time_empty prefix=$column.column_name time=$column.value_display display_minutes=false display_seconds=false hour_empty="--" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->時
		<!--HP{html_select_time_empty prefix=$column.column_name time=$column.value_display display_hours=false display_seconds=false minute_empty="--" minute_interval=15 all_extra="tabindex="|cat:$column.tab_index|escape}HP-->分
	<!--HP{elseif $column.column_type == $smarty.const.COLUMN_VALUE_COLUMN_TYPE_TIMESTAMP}HP-->
		<!--HP{html_select_date unnecessary_default=true prefix=$column.column_name time=$column.value_display field_order="Y" year_empty="----" end_year=+10 all_extra="tabindex="|cat:$column.tab_index|escape}HP-->年
		<!--HP{html_select_date unnecessary_default=true prefix=$column.column_name time=$column.value_display field_order="M" month_empty="--" month_format="%m" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->月
		<!--HP{html_select_date unnecessary_default=true prefix=$column.column_name time=$column.value_display field_order="D" day_empty="--" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->日
		<!--HP{html_select_time_empty prefix=$column.column_name time=$column.value_display display_minutes=false display_seconds=false hour_empty="--" all_extra="tabindex="|cat:$column.tab_index|escape}HP-->時
		<!--HP{html_select_time_empty prefix=$column.column_name time=$column.value_display display_hours=false display_seconds=false minute_empty="--" minute_interval=15 all_extra="tabindex="|cat:$column.tab_index|escape}HP-->分
	<!--HP{elseif $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_SELECT_ASSOCIATION}HP-->
		<!--HP{if $column.use_add_association_flag}HP-->
			<!--HP{$column.value_display.name}HP-->
			<input type="hidden" name="<!--HP{$column.column_name}HP-->" value="<!--HP{$column.value_display.value}HP-->" />
		<!--HP{else}HP-->
			<div style="float:left;">
				<select class="form-control input-sm" name="<!--HP{$column.column_name}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->">
				<option value="" />選択してください</option>
				<!--HP{foreach from=$column.select_item key=key item=value}HP-->
                    <option value="<!--HP{$key}HP-->" <!--HP{if $key == $column.value_display.value}HP-->selected<!--HP{/if}HP--> /><!--HP{$value}HP--></option>
				<!--HP{/foreach}HP-->
				</select>
			</div>
			<div>
				<p class="lb5" style="float:left;margin-left:8px;">
					<button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#selDepartment" data-table_id="<!--HP{$column.parent_table_id}HP-->" data-column_name="<!--HP{$column.column_name}HP-->">選択</button>
				</p>
				<p class="lb5" style="float:left;">
					<a class="btn btn-secondary btn-sm" href="javascript:void();" onClick="clearManage('<!--HP{$column.column_name}HP-->'); return false;"><span>クリア</span></a>
				</p>
			</div>
			<!--HP{$tenantId = $column.column_name}HP-->
		<!--HP{/if}HP-->
	<!-- TODO multiselectのほうに移動 -->
	<!--HP{elseif $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_JUNCTION_TABLE}HP-->
		<!-- 中間テーブル -->
		<!--<td colspan="2">-->
			<table class="edit_screen_item">
				<tr>
					<td style="text-align:center; border:none; padding:5px;" colspan="1">
						<div class="hide_box" id="hide_box_<!--HP{$column.column_info_id}HP-->" style="width:430px !important;">
							<!--HP{foreach from=$column.junction_selected item="row"}HP-->
							<!--HP{if $row.selected}HP-->
							<div id="virtual_row_id_<!--HP{$column.column_info_id}HP-->_<!--HP{$row.virtual_row_id}HP-->" style="display:none;" class="ui-state-default"><table><tr><td><!--HP{$row.visible_name|escape}HP--></td></tr></table><img src="<!--HP{$documentRoot}HP-->img/icons/cross.png" class="screen_close" /></div>
							<!--HP{else}HP-->
							<div id="virtual_row_id_<!--HP{$column.column_info_id}HP-->_<!--HP{$row.virtual_row_id}HP-->" class="ui-state-default"><table><tr><td><!--HP{$row.visible_name|escape}HP--></td></tr></table><img src="<!--HP{$documentRoot}HP-->img/icons/cross.png" class="screen_close" /></div>
							<!--HP{/if}HP-->
							<!--HP{/foreach}HP-->
						</div>
						<div style="clear: both;"></div>
					</td>
				</tr>
			</table>

			<table class="edit_screen_item">
				<tr>
					<td style="vertical-align:top; text-align:center; border:none; padding:5px;">
						
						<div class="show_box_container">
							<p>
								<a class="add-all btn btn-secondary btn-sm" id="add-all_<!--HP{$column.column_info_id}HP-->" style="color:white;"><span>↓全て追加</span></a>
								<a class="del-all btn btn-secondary btn-sm" id="del-all_<!--HP{$column.column_info_id}HP-->" style="color:white;"><span>↑全て削除</span></a>
							</p>

							<div id="show_box_<!--HP{$column.column_info_id}HP-->" class="show_box" >
								<!--HP{foreach  from=$column.junction_selected item="row"}HP-->
								<!--HP{if $row.selected}HP-->
								<div id="virtual_row_id_<!--HP{$column.column_info_id}HP-->_<!--HP{$row.virtual_row_id}HP-->" class="ui-state-default"><table><tr><td><!--HP{$row.visible_name|escape}HP--></td></tr></table><img src="<!--HP{$documentRoot}HP-->img/icons/cross.png" class="screen_close" /></div>
								<!--HP{/if}HP-->
								<!--HP{/foreach}HP-->
							</div>
							<div style="clear: both;"></div>
						</div>

					</td>
				</tr>
			</table>
		<!--</td>-->
	<!--HP{else}HP-->
		<select class="form-control input-sm" name="<!--HP{$column.column_name}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->">
		<option value="" />選択してください</option>
		<!--HP{foreach from=$column.select_item key=key item=value}HP-->
			<!--HP{if $column.value_display==null }HP-->
				<option value="<!--HP{$key}HP-->" <!--HP{if $column.select_item_default[$key] == 1}HP-->selected<!--HP{/if}HP--> /><!--HP{$value}HP--></option>
			<!--HP{else}HP-->
				<option value="<!--HP{$key}HP-->" <!--HP{if $key == $column.value_display }HP-->selected<!--HP{/if}HP--> /><!--HP{$value}HP--></option>
			<!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
		</select>
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_FILE}HP-->
	<!--HP{if isset($column.file_url) && !empty($column.file_url)}HP-->
		<!--HP{if $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_IMAGE_FILE}HP-->
			<a href="<!--HP{$column.file_url}HP-->&type=main"><!--HP{$column.value_display|escape}HP--></a><img name="<!--HP{$column.column_name|escape}HP-->_hidden_img" src="<!--HP{$column.file_url}HP-->&type=thumb" style="width:60px; "/>
			<input type="hidden" name="<!--HP{$column.column_name|escape}HP-->_hidden" value="<!--HP{$column.value_display}HP-->" />
			<input type="hidden" name="<!--HP{$column.column_name|escape}HP-->_hidden_url" value="<!--HP{$column.file_url}HP-->" />
			 <input type="checkbox" class="bootstrap-switch" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" name="<!--HP{$column.column_name|escape}HP-->_delete_check" value="1" tabindex="<!--HP{$column.tab_index|escape}HP-->" />ファイルを削除する<br />
			<span><input type="file" name="<!--HP{$column.column_name|escape}HP-->" id="select_file<!--HP{$column.column_info_id}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" /></span>
			<input type="button" class="btn btn-secondary btn-sm" value="クリア" onClick="clearSelectFile($('#select_file<!--HP{$column.column_info_id}HP-->'))" tabindex="<!--HP{$column.tab_index|escape}HP-->" />
		<!--HP{else}HP-->
			<a href="<!--HP{$column.file_url}HP-->"><!--HP{$column.value_display|escape}HP--></a><img name="<!--HP{$column.column_name|escape}HP-->_hidden_img" src="<!--HP{$column.file_url}HP-->" style="display:none;"/>
			<input type="hidden" name="<!--HP{$column.column_name|escape}HP-->_hidden" value="<!--HP{$column.value_display}HP-->" />
			<input type="hidden" name="<!--HP{$column.column_name|escape}HP-->_hidden_url" value="<!--HP{$column.file_url}HP-->" />
			 <input type="checkbox" class="bootstrap-switch" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" name="<!--HP{$column.column_name|escape}HP-->_delete_check" value="1" tabindex="<!--HP{$column.tab_index|escape}HP-->" />ファイルを削除する<br />
			<span><input type="file" name="<!--HP{$column.column_name|escape}HP-->" id="select_file<!--HP{$column.column_info_id}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" /></span>
			<input type="button" class="btn btn-secondary btn-sm" value="クリア" onClick="clearSelectFile($('#select_file<!--HP{$column.column_info_id}HP-->'))" tabindex="<!--HP{$column.tab_index|escape}HP-->" />
		<!--HP{/if}HP-->
	<!--HP{else}HP-->
	<span><input type="file" name="<!--HP{$column.column_name|escape}HP-->" id="select_file<!--HP{$column.column_info_id}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" /></span>
	<input type="button" class="btn btn-secondary btn-sm" value="クリア" onClick="clearSelectFile($('#select_file<!--HP{$column.column_info_id}HP-->'))" tabindex="<!--HP{$column.tab_index|escape}HP-->" />
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_FILE_MULTI}HP-->
			<div class="file_multidrop_zone" id="file_multidrop_zone_<!--HP{$column.column_name|escape}HP-->" data-inputname="<!--HP{$column.column_name|escape}HP-->">
	<!--HP{if isset($column.value_display) && !empty($column.value_display)}HP-->
				<span id="icon_no_image_<!--HP{$column.column_name|escape}HP-->" style="display: none;">no image</span>
	<!--HP{else}HP-->
				<span id="icon_no_image_<!--HP{$column.column_name|escape}HP-->" >no image</span>
	<!--HP{/if}HP-->
				<ul id="thumb_ul_<!--HP{$column.column_name|escape}HP-->" class="file_multi_list" data-inputname="<!--HP{$column.column_name|escape}HP-->" >
				<!--HP{foreach from=$column.file_info key=key item=value}HP-->
	            	<li class="file_multi_image <!--HP{$column.column_name|escape}HP-->_li" data-inputname="<!--HP{$column.column_name|escape}HP-->"  data-file_name="<!--HP{$value.file_name}HP-->" data-upload_file="<!--HP{$value.upload_file}HP-->" data-thumb_file="<!--HP{$value.thumb_file}HP-->" data-db_registed="<!--HP{$value.db_registed}HP-->" >
					<figure><img src="<!--HP{$value.thumb_url}HP-->" />
					<a class="file_multi_delete">
					<i class="fa fa-times  fa-border"></i>
					</a><figcaption><a href="<!--HP{$value.upload_url}HP-->"><!--HP{$value.file_name}HP--></a></figcaption></figure>
					</li>
				<!--HP{/foreach}HP-->
				</ul>
			</div>
		    <input type="file" class="file_multi_upload" id="file_multi_<!--HP{$column.column_name|escape}HP-->" data-inputname="<!--HP{$column.column_name|escape}HP-->" name="<!--HP{$column.column_name|escape}HP-->_file" multiple="multiple" accept="image/*" style="display:none;" />
		    <a id="file_upload_multi_add_<!--HP{$column.column_name|escape}HP-->" class="file_upload_multi_add_button" data-inputname="<!--HP{$column.column_name|escape}HP-->">
		        <i class="fa fa-plus" ></i>ファイルをアップロード
		    </a>
	    <input type="hidden" name="<!--HP{$column.column_name|escape}HP-->" value='<!--HP{$column.value_display}HP-->' />
	    <input type="hidden" name="<!--HP{$column.column_name|escape}HP-->_filemulti_del" value='<!--HP{$column.filemulti_del}HP-->' />
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_CHECKBOX_MULTI}HP-->
	<!--HP{if $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_REFERABLE_GROUP}HP-->
		<input type="checkbox" class="bootstrap-switch" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" id="referable_check" tabindex="<!--HP{$column.tab_index|escape}HP-->" />ALL<br />
		<input type="checkbox" class="bootstrap-switch" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" id="backstaff_check" tabindex="<!--HP{$column.tab_index|escape}HP-->" />バックスタッフ<br /><br />
		<!--HP{foreach from=$column.select_item key=key item=value}HP-->
			<input type="checkbox" class="bootstrap-switch referable_group<!--HP{if $column.select_item_option.$key == 1}HP--> backstaff_group<!--HP{/if}HP-->" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" name="<!--HP{$column.column_name}HP-->[<!--HP{$key}HP-->]" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if in_array($key,$column.value_display)}HP-->checked<!--HP{/if}HP-->/><!--HP{$value|escape}HP-->
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
		<!--HP{if $tableData.table_name=='vt_car_info'&&$column.column_name=='category'}HP-->
		<table>
			<!--HP{foreach from=$catgorySelect key=key item=value}HP-->
				<!--HP{if empty($categoryType)}HP-->
		<tr><td><!--HP{$value.type}HP-->:</td><td>
				<!--HP{/if}HP-->
				<!--HP{if !empty($categoryType)&& $categoryType!=$value.type}HP-->
		</td></tr><tr><td><!--HP{$value.type}HP-->:</td><td><!--HP{/if}HP-->
				<!--HP{assign var="categoryType" value=$value.type}HP-->
				<!--HP{if $column.value_display==null }HP-->
					<input type="checkbox" class="bootstrap-switch" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" name="<!--HP{$column.column_name}HP-->[<!--HP{$value.virtual_row_id}HP-->]" value="<!--HP{$value.virtual_row_id}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if $column.select_item_default[$key] == 1}HP-->checked<!--HP{/if}HP-->/><!--HP{$value.name|escape}HP-->
				<!--HP{else}HP-->
					<input type="checkbox" class="bootstrap-switch" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" name="<!--HP{$column.column_name}HP-->[<!--HP{$value,virtual_row_id}HP-->]" value="<!--HP{$value.virtual_row_id}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if in_array($value.virtual_row_id,$column.value_display)}HP-->checked<!--HP{/if}HP-->/><!--HP{$value.name|escape}HP-->
				<!--HP{/if}HP-->
				<!--HP{if $column.multi_select_form_display_type == $smarty.const.COLUMN_VALUE_MULTI_SELECT_FORM_DISPLAY_TYPE_VERTICAL}HP--><br /><!--HP{/if}HP-->
			<!--HP{/foreach}HP-->
		</td></tr>
		</table>
		<!--HP{else}HP-->
			<!--HP{foreach from=$column.select_item key=key item=value}HP-->
				<!--HP{if $column.value_display==null }HP-->
					<input type="checkbox" class="bootstrap-switch" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" name="<!--HP{$column.column_name}HP-->[<!--HP{$key}HP-->]" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if $column.select_item_default[$key] == 1}HP-->checked<!--HP{/if}HP-->/><!--HP{$value|escape}HP-->
				<!--HP{else}HP-->
					<input type="checkbox" class="bootstrap-switch" data-toggle="switch" data-on-color="success" data-off-color="success" data-on-label="<i class='nc-icon nc-check-2'></i>" data-off-label="<i class='nc-icon nc-simple-remove'></i>" name="<!--HP{$column.column_name}HP-->[<!--HP{$key}HP-->]" value="<!--HP{$key}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" <!--HP{if in_array($key,$column.value_display)}HP-->checked<!--HP{/if}HP-->/><!--HP{$value|escape}HP-->
				<!--HP{/if}HP-->
				<!--HP{if $column.multi_select_form_display_type == $smarty.const.COLUMN_VALUE_MULTI_SELECT_FORM_DISPLAY_TYPE_VERTICAL}HP--><br /><!--HP{/if}HP-->
			<!--HP{/foreach}HP-->
		<!--HP{/if}HP-->
	<!--HP{/if}HP-->
<!--HP{elseif $column.form_type == $smarty.const.COLUMN_VALUE_FORM_TYPE_CALENDER}HP-->
	<!--HP{if $column.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_MULTIPLE_DATE}HP-->
		<input type="text" name="<!--HP{$column.column_name}HP-->" id="<!--HP{$column.column_name}HP-->" class="date-pick-multiple" value="<!--HP{$column.value_display}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" readonly />
		<input type="button" class="btn btn-secondary btn-sm clearDate" value="クリア" onClick="clearCalendarMulti('<!--HP{$column.column_name}HP-->')" tabindex="<!--HP{$column.tab_index|escape}HP-->" />
	<!--HP{else}HP-->
		<input type="text" name="<!--HP{$column.column_name}HP-->" id="<!--HP{$column.column_name}HP-->" class="date-pick" value="<!--HP{$column.value_display}HP-->" tabindex="<!--HP{$column.tab_index|escape}HP-->" readonly />
		<input type="button" class="btn btn-secondary btn-sm clearDate" value="クリア" onClick="clearCalendar('<!--HP{$column.column_name}HP-->')" tabindex="<!--HP{$column.tab_index|escape}HP-->" />
	<!--HP{/if}HP-->
<!--HP{else}HP-->
	<!--HP{$column.value_display|escape|nl2br}HP-->
<!--HP{/if}HP-->
