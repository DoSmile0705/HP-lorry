<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js?20110324"></script>
<script type="text/javascript">
var max_code_value = <!--HP{$maxCodeValue|escape}HP-->;
$(document).ready(function(){
	if($('#tooltip_visible_flg').attr('checked')){
		$('#tootip_text_required_icon').show();
	}else{
		$('#tootip_text_required_icon').hide();
	}
	$('#tooltip_visible_flg').on('switchChange.bootstrapSwitch', function(){
		if($(this).prop('checked')){
			$('#tootip_text_required_icon').show();
		}else{
			$('#tootip_text_required_icon').hide();
		}
	});
	if($('#placeholder_visible_flg').attr('checked')){
		$('#placeholder_text_required_icon').show();
	}else{
		$('#placeholder_text_required_icon').hide();
	}
	$('#placeholder_visible_flg').on('switchChange.bootstrapSwitch', function(){
		if($(this).prop('checked')){
			$('#placeholder_text_required_icon').show();
		}else{
			$('#placeholder_text_required_icon').hide();
		}
	});
	// カラムタイプが文字列の時は、初期表示エリアは非表示に
	if(<!--HP{$columnInfo.column_type|escape}HP--> == <!--HP{$columnTypeText|escape}HP--> ){
		showHideDefaultValueForm(false);
	}
	selectReload('<!--HP{$columnInfo.column_type|escape}HP-->', '<!--HP{$columnInfo.form_type|escape}HP-->', '<!--HP{$columnInfo.search_type|escape}HP-->');
});
function selectReload(column_type, form_type, search_type){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'tid': <!--HP{$columnInfo.table_info_id|escape}HP-->,
			'cid': <!--HP{$columnInfo.column_info_id|escape}HP-->,
			'column_type': column_type,
			'form_type': form_type
		},
		cache: false,
		url: './vtable.php?mode=edit_column_select_json',
		success: function(data){
			$("#search_type").empty();
			$("#search_type").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data['search_type'], function(i,item){
				if(String(item.value) === search_type){
					$("#search_type").append($('<option>').attr({value: item.value,selected: true}).text(item.text));
				}
				else{
					$("#search_type").append($('<option>').attr({value: item.value}).text(item.text));
				}
			});
		}
	});
}
</script>