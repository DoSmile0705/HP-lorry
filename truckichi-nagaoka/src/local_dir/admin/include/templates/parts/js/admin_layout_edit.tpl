<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/prettyPhoto.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#top_component_box_layout").disableSelection();
	$("#left_component_box_layout, #right_component_box_layout").sortable({
		connectWith: '#left_component_box_layout, #right_component_box_layout',
		placeholder: 'dragdrop-highlight',
		opacity: 0.7
		<!--HP{if $mypageProfile.component_editable_level == $componentEditableLevelNone}HP-->
		, disabled: true
		<!--HP{/if}HP-->
	}).disableSelection();
	$("#screen_item_box_layout").sortable({
		connectWith: '#screen_item_box_layout',
		placeholder: 'dragdrop-highlight',
		opacity: 0.7
		<!--HP{if $mypageProfile.screen_item_editable_level == $screenItemEditableLevelNone}HP-->
		, disabled: true
		<!--HP{/if}HP-->
	}).disableSelection();
	$(".screen_close").click(function(){
		$(this).parent().remove();
	});

});
	
// コンポーネント追加 MODAL select項目再設定
$("#display_area_id").change(function(){
	selectReload($(this).val());
});
function selectReload(display_area_id){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'display_area_id': display_area_id
		},
		cache: true,
		url: './layout.php?mode=component_select_json',
		success: function(data){
			$("#component").empty();
			$("#component").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data, function(i,item){
				$("#component").append($('<option>').attr({value: item.value}).text(item.text));
			});
		}
	});
}
// コンポーネント追加 MODAL 「追加」ボタン押下
$("#btn_add_component").click(function(){
	component_id = $('#component').val();
	component_name = $('#component option:selected').text();
	display_area_id = $('#display_area_id').val();

	if(component_id == '' && display_area_id == ''){
		alert('コンポーネント名、追加先を指定してください');
	}else if(component_id == ''){
		alert('コンポーネント名を指定してください');
	}else if(display_area_id == ''){
		alert('追加先を指定してください');
	}else{
		returnComponent(component_id, component_name, display_area_id);
		$('#addComponent').modal('hide');
	}
});
function returnComponent(component_id, component_name, display_area_id){
	if(display_area_id == 'top_component_box'){
		$('#' + display_area_id + '_layout').empty();
	}
	$('#' + display_area_id + '_layout').append(
		$('<div>').attr('id', 'component_' + component_id).addClass('ui-state-default').append(
			$('<table>').append(
				$('<tr>').append(
					$('<td>').text(component_name)
				)
			)
		).append(
				$('<img>').attr('src', '<!--HP{$documentRoot}HP-->img/icons/cross.png').addClass('screen_close')
		)
	);
	$(".screen_close").unbind('click');
	$(".screen_close").click(function(){
		$(this).parent().remove();
	});
}

// 画面オブジェクト追加 MODAL 「追加」ボタン押下
$("#btn_add_item").click(function(){
	screen_id = $('#screenitem').val();
	table_visible_name = $('#screenitem option:selected').text();
	
	if(screen_id == ''){
		alert('画面オブジェクト名を指定してください');
	}else{
		setScreenItem(screen_id, table_visible_name);
		$('#addScreenItem').modal('hide');
	}
});
function setScreenItem(screen_id, table_visible_name){
	$('#screen_item_box_layout').append(
		$('<div>').attr('id', 'screen_item_' + screen_id).addClass('ui-state-default').append(
			$('<table>').append(
				$('<tr>').append(
					$('<td>').text(table_visible_name)
				)
			)
		).append(
			$('<img>').attr('src', '<!--HP{$documentRoot}HP-->img/icons/cross.png').addClass('screen_close')
		)
	);
	$(".screen_close").unbind('click');
	$(".screen_close").click(function(){
		$(this).parent().remove();
	});
}

</script>