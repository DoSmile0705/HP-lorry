<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/ui.jqgrid.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/prettyPhoto.css" rel="stylesheet" media="screen" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/datepicker.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jqgrid/i18n/grid.locale-ja.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jqgrid/jquery.jqGrid.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jqgrid/grid.loader.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/date.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.datepicker.js"></script>
<script type="text/javascript">
<!--
jQuery(document).ready(function(){

	$('*[name=update_date_sYear]').attr("disabled", "disabled");
	$('*[name=update_date_sMonth]').attr("disabled", "disabled");
	$('*[name=update_date_sDay]').attr("disabled", "disabled");
	$('*[name=update_date_eYear]').attr("disabled", "disabled");
	$('*[name=update_date_eMonth]').attr("disabled", "disabled");
	$('*[name=update_date_eDay]').attr("disabled", "disabled");

	$("#amount_target").change(function() {
		var now = new Date();
		var year = "";
		var month = "";
		var day = "";

		$('*[name=update_date_sYear]').attr("disabled", "disabled");
		$('*[name=update_date_sMonth]').attr("disabled", "disabled");
		$('*[name=update_date_sDay]').attr("disabled", "disabled");
		$('*[name=update_date_eYear]').attr("disabled", "disabled");
		$('*[name=update_date_eMonth]').attr("disabled", "disabled");
		$('*[name=update_date_eDay]').attr("disabled", "disabled");

		if ($(this).val() == 1) {
			year = now.getFullYear();
			month = now.getMonth() + 1;
			if (month < 10) {
				month = "0" + month;
			}
			day = 1

			$('*[name=update_date_sYear]').val(year);
			$('*[name=update_date_sMonth]').val(month);
			$('*[name=update_date_sDay]').val(day);

			now = new Date(year, month + 1, 0);
			year = now.getFullYear();
			month = now.getMonth();
			if (month < 10) {
				month = "0" + month;
			}
			day = now.getDate();

			$('*[name=update_date_eYear]').val(year);
			$('*[name=update_date_eMonth]').val(month);
			$('*[name=update_date_eDay]').val(day);
		} else if ($(this).val() == 2) {
			year = now.getFullYear();
			month = now.getMonth() + 1;
			now = new Date(year, month, 0);
			year = now.getFullYear();
			month = now.getMonth();
			if (month < 10) {
				month = "0" + month;
			}
			day = 1;

			$('*[name=update_date_sYear]').val(year);
			$('*[name=update_date_sMonth]').val(month);
			$('*[name=update_date_sDay]').val(day);

			day = now.getDate();

			$('*[name=update_date_eYear]').val(year);
			$('*[name=update_date_eMonth]').val(month);
			$('*[name=update_date_eDay]').val(day);
		} else if ($(this).val() == 3) {
			year = now.getFullYear();
			month = "01";
			day = 1;

			$('*[name=update_date_sYear]').val(year);
			$('*[name=update_date_sMonth]').val(month);
			$('*[name=update_date_sDay]').val(day);

			month = "12";
			day = 31;

			$('*[name=update_date_eYear]').val(year);
			$('*[name=update_date_eMonth]').val(month);
			$('*[name=update_date_eDay]').val(day);
		} else if ($(this).val() == 4) {
			year = now.getFullYear() - 1;
			month = "01";
			day = 1;

			$('*[name=update_date_sYear]').val(year);
			$('*[name=update_date_sMonth]').val(month);
			$('*[name=update_date_sDay]').val(day);

			month = "12";
			day = 31;

			$('*[name=update_date_eYear]').val(year);
			$('*[name=update_date_eMonth]').val(month);
			$('*[name=update_date_eDay]').val(day);
		} else if ($(this).val() == 5) {
			$('*[name=update_date_sYear]').removeAttr("disabled");
			$('*[name=update_date_sMonth]').removeAttr("disabled");
			$('*[name=update_date_sDay]').removeAttr("disabled");
			$('*[name=update_date_eYear]').removeAttr("disabled");
			$('*[name=update_date_eMonth]').removeAttr("disabled");
			$('*[name=update_date_eDay]').removeAttr("disabled");
		}
	});


	jQuery("#jqlist").jqGrid({
		url: '<!--HP{$urlJson}HP-->',
		datatype: 'json',
		colNames: ['','企業'<!--HP{foreach from=$columnDisplay key=key item=v}HP-->,'<!--HP{$v.visible_name}HP-->'<!--HP{/foreach}HP-->],
		colModel: [
			{name:'virtual_row_id',index:'virtual_row_id', hidden:true},
			{name:'name',index:'name'}
			<!--HP{foreach from=$columnDisplay item=v}HP-->
			, {name:'<!--HP{$v.column_name}HP-->',index:'<!--HP{$v.column_name}HP-->' <!--HP{if isset($v.disp_width)}HP-->, width:'<!--HP{$v.disp_width}HP-->'<!--HP{/if}HP-->}
			<!--HP{/foreach}HP-->
		],
		rownumbers: true,
		height: 490,
		shrinkToFit:false,
		scrollrows: true,
		rowNum:<!--HP{$sortDefault.row_num}HP-->,
		rowList:[50,100,200],
		pager: jQuery('#jqpager'),
		viewrecords: true,
		hidegrid: false,
		sortname: '<!--HP{$sortDefault.column_name}HP-->',
		sortorder: '<!--HP{$sortDefault.sort_type}HP-->',
		loadComplete: function() {
			$("#jqlist").jqGrid('setGridWidth', $(tab_container).width(), true);
			jQuery(".popup").prettyPhoto({
				animationSpeed: 'fast',
				show_title: false,
				theme: 'light_rounded',
				opacity: 0.5
			});
		}
	});

	$('.date-pick').datePicker({
		displayClose:true,
		startDate:'2012/01/01',
		horizontalPosition:$.dpConst.POS_RIGHT
	});
});
-->
</script>