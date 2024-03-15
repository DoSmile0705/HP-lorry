<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/prettyPhoto.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	selectReload('<!--HP{$screenInfo.screen_type|escape}HP-->');
});
var screen_columns_num = '<!--HP{$screenInfo.screen_columns_num|escape}HP-->';
function selectReload(screen_type){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'screen_type': screen_type
		},
		cache: true,
		url: './screen.php?mode=edit_screen_select_json',
		success: function(data){
			$("#screen_columns_num").empty();
			$("#screen_columns_num").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data, function(i,item){
				if(item.value == screen_columns_num){
					$("#screen_columns_num").append($('<option>').attr({value: item.value,selected: true}).text(item.text));
				}
				else{
					$("#screen_columns_num").append($('<option>').attr({value: item.value}).text(item.text));
				}
			});
			screen_columns_num = '';
		}
	});
}
</script>