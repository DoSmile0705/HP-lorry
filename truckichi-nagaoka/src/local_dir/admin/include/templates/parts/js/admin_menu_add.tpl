<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	menu_type_changed();
	menu_layer_changed();
	$("#menu_type").change(function(){
		menu_type_changed();
	});
	$(".menu_layer").change(function(){
		menu_layer_changed();
	});
});
</script>