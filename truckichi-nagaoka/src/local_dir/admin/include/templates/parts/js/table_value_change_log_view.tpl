<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/ui.jqgrid.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jqgrid/i18n/grid.locale-ja.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jqgrid/jquery.jqGrid.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jqgrid/grid.loader.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	jQuery("#jqlist").jqGrid({
		url:'<!--HP{$documentRoot}HP-->/json/tablevaluechangelog.php?mode=view_json',
	    datatype: "json",
		colNames:['テーブル名','カラム名','レコードID','操作','変更前','変更後','更新者','更新日時'],
		colModel:[
			{name:'table_name',index:'table_name'},
			{name:'column_name',index:'column_name'},
			{name:'virtual_row_id',index:'virtual_row_id'},
			{name:'operation',index:'operation'},
			{name:'before_value',index:'before_value'},
			{name:'after_value',index:'after_value'},
			{name:'regist_user',index:'regist_user'},
			{name:'regist_time',index:'regist_time'}
		],
		rownumbers: true,
		autowidth: true,
		height: '245px',
		shrinkToFit:false,
		rowNum:50,
		rowList:[50,100,150],
		pager: jQuery('#jqpager'),
		viewrecords: true,
		hidegrid: false,
		sortname: 'regist_time',
		sortorder: "ASC",
	});
});
-->
</script>