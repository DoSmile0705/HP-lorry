<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	<!--HP{foreach from=$mypageLayout item='value'}HP-->
	<!--HP{if $value.component_type == $componentTypeListPanel}HP-->
	loadListPanel('component_<!--HP{$value.component_id|escape}HP-->', <!--HP{$value.table_info_id|escape}HP-->, <!--HP{$value.column_info_id|escape}HP-->, <!--HP{$value.display_rows|escape}HP-->);
	<!--HP{elseif $value.component_type == $componentTypeKnowledgePanel}HP-->
	loadKnowledgePanel('component_<!--HP{$value.component_id|escape}HP-->', <!--HP{$value.display_rows|escape}HP-->);
	<!--HP{elseif $value.component_type == $componentTypeNewInformationPanel}HP-->
	loadNewInformationPanel('component_<!--HP{$value.component_id|escape}HP-->', <!--HP{$value.display_rows|escape}HP-->);
	<!--HP{elseif $value.component_type == $componentTypeApprovalItem}HP-->
	loadApprovalItem('component_<!--HP{$value.component_id|escape}HP-->', <!--HP{$value.display_rows|escape}HP-->);
	<!--HP{elseif $value.component_type == $componentTypeApplyItem}HP-->
	loadApplyItem('component_<!--HP{$value.component_id|escape}HP-->', <!--HP{$value.display_rows|escape}HP-->);
	<!--HP{elseif $value.component_type == $componentTypeListMessage}HP-->
	loadMessageTray('component_<!--HP{$value.component_id|escape}HP-->', <!--HP{$value.display_rows|escape}HP-->);
	<!--HP{elseif $value.component_type == $componentTypeImplant}HP-->
	loadHtmlPanel('component_<!--HP{$value.component_id|escape}HP-->', '<!--HP{$value.html|escape}HP-->');
	<!--HP{/if}HP-->
	<!--HP{/foreach}HP-->
});
function loadListPanel(display_area, table_info_id, column_info_id, display_rows){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'table_info_id': table_info_id,
			'column_info_id': column_info_id,
			'display_rows': display_rows
		},
		cache: true,
		url: '<!--HP{$documentRoot}HP-->json/index.php?mode=list_panel_json',
		success: function(data){
			$("#" + display_area + " dl").empty();
			$.each(data, function(i,item){
				$("#" + display_area + " dl").append(item);
			});
		}
	});
}
function loadKnowledgePanel(display_area, display_rows){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'display_rows': display_rows
		},
		cache: true,
		url: '<!--HP{$documentRoot}HP-->json/index.php?mode=knowledge_panel_json',
		success: function(data){
			$("#" + display_area + " dl").empty();
			$.each(data, function(i,item){
				$("#" + display_area + " dl").append(item);
			});
		}
	});
}
function loadNewInformationPanel(display_area, display_rows){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'display_rows': display_rows
		},
		cache: true,
		url: '<!--HP{$documentRoot}HP-->json/index.php?mode=new_information_panel_json',
		success: function(data){
			$("#" + display_area + " dl").empty();
			$.each(data, function(i,item){
				$("#" + display_area + " dl").append(item);
			});
		}
	});
}
function loadApprovalItem(display_area, display_rows){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'display_rows': display_rows
		},
		cache: true,
		url: '<!--HP{$documentRoot}HP-->json/index.php?mode=approval_item_json',
		success: function(data){
			$("#" + display_area + " dl").empty();
			$.each(data, function(i,item){
				$("#" + display_area + " dl").append(item);
			});
		}
	});
}
function loadApplyItem(display_area, display_rows){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'display_rows': display_rows
		},
		cache: true,
		url: '<!--HP{$documentRoot}HP-->json/index.php?mode=apply_item_json',
		success: function(data){
			$("#" + display_area + " dl").empty();
			$.each(data, function(i,item){
				$("#" + display_area + " dl").append(item);
			});
		}
	});
}
function loadMessageTray(display_area, display_rows){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'display_rows': display_rows
		},
		cache: true,
		url: '<!--HP{$documentRoot}HP-->json/index.php?mode=message_tray_json',
		success: function(data){
			$("#" + display_area + " dl").empty();
			$.each(data, function(i,item){
				$("#" + display_area + " dl").append(item);
			});
		}
	});
}
function loadHtmlPanel(display_area, html){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'html': html
		},
		cache: true,
		url: '<!--HP{$documentRoot}HP-->json/index.php?mode=list_html_json',
		success: function(data){
			$("#" + display_area + " dl").empty();
			$.each(data, function(i,item){
				$("#" + display_area + " dl").append(item);
			});
		}
	});
}
</script>