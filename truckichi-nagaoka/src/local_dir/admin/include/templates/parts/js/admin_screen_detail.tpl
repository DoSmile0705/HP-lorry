<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
$(function() {
	$(".layout_item_box, .hide_box").disableSelection()
	$(".show_box").sortable({
		opacity: 0.7
	}).disableSelection();
	$(".show_box").sortable("disable");
	$('.layout_item_box .layout_item_type_section').val('テキストを入力').attr('disabled', 'disabled');

	$("#screenCopy").click(function(){
		var table_info_id = "<!--HP{$screenInfo.table_info_id}HP-->";
		var from_screen_type_id = "<!--HP{$screenInfo.screen_type}HP-->";
		var to_screen_type_id = $("#screenTypes").val();

		var ret = confirm("選択された画面へカラムをコピーします。\n既に登録されているカラムは削除されます。");
		if(ret){
			var params ="mode=screen_copy&table_info_id="+table_info_id+"&from_screen_type_id="+from_screen_type_id+"&to_screen_type_id="+to_screen_type_id;
			$.ajax({
				type: "POST",
				url: "<!--HP{$documentRoot}HP-->/screen.php",
				data: params,
				success: function(msg){
					alert(msg);
				}
			});
		}
	});
});

function screenCopy(){
	alert("copy");
}

</script>