<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/datepicker.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/date.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.datepicker.js"></script>
<script type="text/javascript">
<!--
jQuery(document).ready(function(){
var table;

	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	$('#jqlist tfoot th').each( function(){
		var filter_id = 'foot_filter'+ String(this.cellIndex);
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" id="'+filter_id+'" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" id="'+filter_id+'" />' );
		}
	});

	
	// 一覧取得のurl
	var url_api = "<!--HP{$documentRoot}HP-->api/v1/wfhistories/";

	//------------
	// DataTable
	table = $("#jqlist").DataTable({
		ajax: {
			type:"POST"
			, url: url_api
			, dataSrc: 'data'
			// 検索条件等をカスタムパラメータとして追加する
			, data: function ( d ) {
				d.post_for_get='true';	// データを取得するためのPOST
				d.q = 'wfid:<!--HP{$wf_user_step.wf_id}HP-->';
				console.log('wfid:<!--HP{$wf_user_step.wf_id}HP-->');
			}
		}
		, columns: [
			{data: 'approval_order'}
			, {data: 'approver'}
			, {data: 'status'}
			, {data: 'comment'}
			, {data: 'approval_time'}
		]
		, responsive: true
		, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: true		// 検索機能 使う
		, stateSave: true		// ページ数、件数切替、ソート状態を保持する時true API state.clearでクリア可能
		, processing: true		// 「処理中」表示
		, orderMulti: true		// 複数の列でソートする
		, order: [ [ 0, 'asc' ] ]	// order
	});


	// reloadされた時にFooterのFilterに入力済の文字を表示する
	// serverSide:falseの時でFooterにfilterを表示した時だけ必要
	// https://datatables.net/forums/discussion/33182
	var state = table.state.loaded();
	if(state){
		table.columns().eq(0).each(function (colIdx){
			var colSearch = state.columns[colIdx].search;
			if(colSearch.search){
				var filter_id = 'foot_filter'+ String(colIdx);
				$('#'+filter_id).val(colSearch.search);
			}
		});
 		//table.draw();
	}

	// Footerのfilterに文字入力された場合
	// serverSide:falseの時でFooterにfilterを表示した時だけ必要
	table.columns().every( function(){
		var that = this;
		$('.foot_filter').on( 'keyup change', function(){
			var col_idx = that.index();
			var tbl_idx = this.parentNode.cellIndex;
			tbl_idx = table.column.index( 'toData', tbl_idx );

			if(col_idx==tbl_idx){
				if( that.search() !== this.value ){
					table
						.columns( col_idx )
						.search( this.value )
						.draw();
				}
			}
		});
	});


	$(".date-pick").each(function(){
		var v = $(this).attr('value').split(",");
		var minDate = '<!--HP{$smarty.now|date_format:"%Y/%m/%d"}HP-->';
		for(var i=0; i<v.length; i++){
			if(minDate > v[i]){
				minDate = v[i];
			}
		}
		var $this = $(this);
		$this.datePicker({
			year:minDate.substr(0, 4),
			month:minDate.substr(5, 2) - 1,
			startDate:'2000/01/01',
			horizontalPosition:$.dpConst.POS_RIGHT,
			inline:true,
			renderCallback:function($td, thisDate, month, year){

				var yyyy = thisDate.getFullYear();
				var mm = thisDate.getMonth() + 1;
				var dd = thisDate.getDate();
				if (mm < 10) { mm = "0" + mm; }
				if (dd < 10) { dd = "0" + dd; }
				var thisDateFormat = yyyy + "/" + mm + "/" + dd;

				var inputValueArray = $this.attr('value').split(",");
				for(var i=0; i<inputValueArray.length; i++){
					if(thisDateFormat == inputValueArray[i]){
						$td.addClass('selected');
					}
				}
				$td.unbind('click');
			}
		});
	});

});
-->
</script>