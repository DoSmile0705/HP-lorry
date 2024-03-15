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
var ajax_status_count_stuff = 1;
var ajax_status="standby";

//getlist();

/*
function getlist(f){
	var url='<!--HP{$urlJson}HP-->'+"&_search=false&rows=50&page=1&sidx=update_time&sord=desc";

	if(typeof f === 'undefined' || f == null || f == ''){
		ajax_status_count_stuff = 1;
	}else if(f == 'next'){
		url = url + "&page="+ ajax_status_count_stuff;
	}else if(f == 'prev'){
		tempNo = ajax_status_count_stuff - 2;
		if(tempNo > 0){
			url = url +"&page="+ tempNo;
			ajax_status_count_stuff = tempNo;
		}else{
			url = url +"&page=1"; 
			ajax_status_count_stuff = 1; // minusの場合
		}
	}
	
	if(ajax_status == 'standby'){
		ajax_status = 'active';
		
		$.ajax({ 
			type: "GET",
			async: true,
			cache: false,
			url:url,
			dataType: "json", 
			success: function(response){ 
				
				if(typeof response === 'undefined' || response == ''){return false;}
	
				var temp_str ='<ul id="listview1" data-role="listview" data-inset="true" data-theme="c" data-dividertheme="f">';
	
				for (key in response.rows) {
					var d = response.rows[key];
					temp_str = temp_str + '<li class="ui-li">'+d.cell[0]+' '+d.cell[5]+'</li>';
				}
				ajax_status_count_stuff++;
				temp_str = temp_str + "</ul>";
				$(temp_str).appendTo($("#data_list_fromjson"));
				$('ul').listview();
				
			},
			complete:function(){
				ajax_status = 'standby';
			}, 
			cache: false,
			error: function(response){ 
				ajax_status = 'standby';
			} 
		});
	}
}	
*/

jQuery("#jqlist").jqGrid({
	url: '<!--HP{$urlJson}HP-->',
	datatype: 'json',
	colNames: ['&nbsp;', 'レコードID'<!--HP{foreach from=$columnDisplay key=key item=v}HP-->,'<!--HP{$v.visible_name}HP-->'<!--HP{/foreach}HP-->],
	colModel: [
		{name:'operation',index:'operation', sortable:false, width:80}
		, {name:'record_id',index:'record_id', hidden:true}
		<!--HP{foreach from=$columnDisplay item=v}HP-->
		, {name:'<!--HP{$v.column_name}HP-->',index:'<!--HP{$v.column_name}HP-->'}
		<!--HP{/foreach}HP-->
	],
	rownumbers: true,
	height: '260',
	width: '280',
	shrinkToFit:false,
	scroll: true,
	scrollrows: true,
	rowNum:5,
	rowList:[5,20,50],
	pager: jQuery('#jqpager'),
	viewrecords: true,
	hidegrid: false,
	sortname: '<!--HP{$sortDefault.column_name}HP-->',
	sortorder: '<!--HP{$sortDefault.sort_type}HP-->',
	loadComplete: function() {
		jQuery(".popup").prettyPhoto({
			animationSpeed: 'fast',
			show_title: false,
			theme: 'light_rounded',
			opacity: 0.5
		});
	},
	ondblClickRow: function(rowId, iRow, iCol, e){
		location.href='<!--HP{$documentRoot}HP-->manage.php?mode=detail&manage_id=<!--HP{$manageId}HP-->' + '&record_id=' + $('#jqlist').getRowData(rowId)['record_id'];
	}
});

/*
$('#list_next').click(function(){
	getlist('next');
	
});
$('#list_prev').click(function(){
	getlist('prev');
	
});
*/
	$('.date-pick').datePicker({
		displayClose:true,
		startDate:'2000/01/01',
		horizontalPosition:$.dpConst.POS_RIGHT
	});
});
-->
</script>