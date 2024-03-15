<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<style>
ul.fancytree-container {
    border: none;
}
</style>
<script type="text/javascript">
$(function() {
    $( ".sort_list_ol" ).sortable();
});

$(function(){
  $('#btn_update').click(function(){
	var form = $(this).parents('form');
	var json = getFilemultiJson();
    $('<input>').attr({
                'type': 'hidden',
                'name': 'sortjson',
                'value': json
            }).appendTo(form);
    form.submit();
  });
})

function getFilemultiJson(){		//複数ファイルの情報をDB登録する形式json化

	var arr = {};
	var i = 0;
	var liitem = '.sort_list_li';
	//引数の項目に紐づいたul内のli分ループ
	$(liitem).each(function(index,dataset) {
		arr[i] = {};
		arr[i]['car_id'] = $(this).data('car_id');
		i++;
	});
	if(i==0){
		return '';
	}else{
		return  JSON.stringify(arr);
	}
}

</script>

