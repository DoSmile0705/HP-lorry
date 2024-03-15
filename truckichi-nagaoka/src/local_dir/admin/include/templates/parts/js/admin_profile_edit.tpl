<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery.treeTable.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.treeTable.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	mypageProfileReload($("#editable_level").val(), '<!--HP{if isset($mypageProfile.component_editable_level)}HP--><!--HP{$mypageProfile.component_editable_level}HP--><!--HP{/if}HP-->', false);
	$("#editable_level").change(function(){
		mypageProfileReload($(this).val(), $("#component_editable_level").val(), true);
	});
	$("#component_editable_level").change(function(){
		mypageProfileReload($("#editable_level").val(), $(this).val(), false);
	});
	$("#profile_list").treeTable({
		clickableNodeNames:true
	});
	$("select[name*='profile']").change(function(){
		var myclass = $(this).attr('class');
		if(myclass.match(/table_[0-9]+_table_view/)){
			var table_info_id = myclass.slice(myclass.indexOf('_') + 1, myclass.indexOf('_table_view'));
			tableViewReload(table_info_id, $(this).val());
		}else if(myclass.match(/table_[0-9]+_table_edit/)){
			var table_info_id = myclass.slice(myclass.indexOf('_') + 1, myclass.indexOf('_table_edit'));
			tableEditReload(table_info_id, $(this).val());
		}else if(myclass.match(/table_[0-9]+_column_view/)){
			columnViewReload($(this).attr('class'), $(this).val());
		}
	});
});
var top_panel_editable_level = '<!--HP{if isset($mypageProfile.top_panel_editable_level)}HP--><!--HP{$mypageProfile.top_panel_editable_level}HP--><!--HP{/if}HP-->';
var screen_item_editable_level = '<!--HP{if isset($mypageProfile.screen_item_editable_level)}HP--><!--HP{$mypageProfile.screen_item_editable_level}HP--><!--HP{/if}HP-->';
function mypageProfileReload(editable_level, component_editable_level, editable_level_change_flg){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'editable_level': editable_level,
			'component_editable_level': component_editable_level
		},
		cache: true,
		url: './profile.php?mode=mypage_profile_select_json',
		success: function(data){
			$("#component_editable_level").empty();
			$("#component_editable_level").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data['component_editable_level'], function(i,item){
				if(String(item.value) == component_editable_level){
					$("#component_editable_level").append($('<option>').attr({value: item.value,selected: true}).text(item.text));
				}
				else{
					$("#component_editable_level").append($('<option>').attr({value: item.value}).text(item.text));
				}
			});
			$("#top_panel_editable_level").empty();
			$("#top_panel_editable_level").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data['top_panel_editable_level'], function(i,item){
				if(top_panel_editable_level && String(item.value) == top_panel_editable_level){
					$("#top_panel_editable_level").append($('<option>').attr({value: item.value,selected: true}).text(item.text));
				}else{
					$("#top_panel_editable_level").append($('<option>').attr({value: item.value}).text(item.text));
				}
			});
			top_panel_editable_level = '';
			if(screen_item_editable_level == ''){
				screen_item_editable_level = $("#screen_item_editable_level").val();
			}
			$("#screen_item_editable_level").empty();
			$("#screen_item_editable_level").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data['screen_item_editable_level'], function(i,item){
				if(editable_level_change_flg == false && String(item.value) == screen_item_editable_level){
					$("#screen_item_editable_level").append($('<option>').attr({value: item.value,selected: true}).text(item.text));
				}else{
					$("#screen_item_editable_level").append($('<option>').attr({value: item.value}).text(item.text));
				}
			});
			screen_item_editable_level = '';
		}
	});
}
function tableViewReload(table_info_id, value){
	$("select[class*='table_" + table_info_id + "_table_edit']").val(value);
	if(value == 0){
		$("select[class*='table_" + table_info_id + "_table_add']").val(value);
	}else{
		$("select[class*='table_" + table_info_id + "_table_add']").val(1);
	}
	$("select[class*='table_" + table_info_id + "_table_delete']").val(value);
	$("select[class*='table_" + table_info_id + "_column_view']").val(value);
	$("select[class*='table_" + table_info_id + "_column_edit']").val(value);
}
function tableEditReload(table_info_id, value){
	$("select[class*='table_" + table_info_id + "_column_edit']").val(value);
}
function columnViewReload(myclass, value){
	myclass = myclass.replace('view_column', 'edit_column');
	$("select[class*='" + myclass + "']").val(value);
}
</script>