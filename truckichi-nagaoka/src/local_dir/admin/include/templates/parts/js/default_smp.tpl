<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-migrate.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.biggerlink.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	var maxHeight = 0;
	$("#input_area .input li p").each(function(){
		if($(this).height() > maxHeight){
			maxHeight = $(this).height();
		}
	});
	$("#input_area .input li p").each(function(){
		$(this).css('height', maxHeight + 'px');
	});
	<!--HP{if isset($previewFlag) && $previewFlag}HP-->
	$('a').attr('href', 'javascript:void();');
	$('a').attr('onclick', 'return false;');
	$('input').attr('onclick', 'return false;');
	$('form').attr('action', 'javascript:void();');
	<!--HP{/if}HP-->
});
</script>
