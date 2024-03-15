<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/ui.jqgrid.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/tipsy.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/prettyPhoto.css" rel="stylesheet" media="screen" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/datepicker.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jqgrid/i18n/grid.locale-ja.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jqgrid/jquery.jqGrid.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jqgrid/grid.loader.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.tipsy.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/date.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.datepicker.js"></script>
<script type="text/javascript">
<!--
var buttonDisplayFlag = true;
$(function() {
	$('.date-pick').datePicker({
		displayClose:true,
		horizontalPosition:$.dpConst.POS_TOP
	});
	$('.date-pick-multiple').each( function() {
		var $this = $(this);
		$this.datePicker({
		clickInput:true,
		displayClose:true,
		closeOnSelect:false,
		selectMultiple:true,
		horizontalPosition:$.dpConst.POS_RIGHT,
		renderCallback:function($td, thisDate, month, year){

			var yyyy = thisDate.getFullYear();
			var mm = thisDate.getMonth() + 1;
			var dd = thisDate.getDate();
			if (mm < 10) { mm = "0" + mm; }
			if (dd < 10) { dd = "0" + dd; }
			var thisDateFormat = yyyy + "-" + mm + "-" + dd;

				var inputValueArray = $this.val().split(",");
			for(var i=0; i<inputValueArray.length; i++){
				if(thisDateFormat == inputValueArray[i]){
						$this.dpSetSelected(thisDate, true);
					$td.addClass('selected');
				}
			}
		}
		});
	}).bind(
		'dpClosed',
		function(e, selectedDates){
			$(this).val(selectedDates.sort());
		}
	);
	$('#referable_check').change(function(){
		if($(this).attr('checked') == true){
			$('.referable_group').attr('checked', true);
			$('#backstaff_check').attr('checked', true);
		}
		else{
			$('.referable_group').attr('checked', false);
			$('#backstaff_check').attr('checked', false);
		}
	});

	$('#backstaff_check').change(function(){
		if($(this).attr('checked') == true){
			$('.backstaff_group').attr('checked', true);
		}
		else{
			$('.backstaff_group').attr('checked', false);
		}
	});
	$('.hovertip').tipsy({
		gravity: 'sw',
		opacity: 1,
		html: true
	});
	<!--HP{if !isset($previewFlag) || !$previewFlag}HP-->
	$(".popup").prettyPhoto({
		animationSpeed: 'fast',
		show_title: false,
		theme: 'light_rounded',
		opacity: 0.5
	});
	<!--HP{/if}HP-->

});

function formPreviewSubmit(url){
	var beforeAction = $('#formEditManage').attr('action');
	$('#formEditManage').attr('target', '_blank');
	$('#formEditManage').attr('action', url);
	$('#formEditManage').submit();
	$('#formEditManage').attr('action', beforeAction);
	$('#formEditManage').removeAttr('target');
}

function formItemPreviewSubmit(url){
	var beforeAction = $('#formEditManage').attr('action');
	$('#formEditManage').attr('target', '_blank');
	$('#formEditManage').attr('action', url);
	$('#formEditManage').submit();
	$('#formEditManage').attr('action', beforeAction);
	$('#formEditManage').removeAttr('target');
}
function formNormalPreviewSubmit(url){
	var beforeAction = $('#formEditManage').attr('action');
	$('#formEditManage').attr('target', '_blank');
	$('#formEditManage').attr('action', url);
	$('#formEditManage').submit();
	$('#formEditManage').attr('action', beforeAction);
	$('#formEditManage').removeAttr('target');
}
-->
</script>