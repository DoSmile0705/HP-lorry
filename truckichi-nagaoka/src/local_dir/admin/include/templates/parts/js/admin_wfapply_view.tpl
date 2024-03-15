<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>

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
	var url_api = "<!--HP{$documentRoot}HP-->api/v1/wfapplications/";

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
			}
		}
		, columns: [
			// 0列目はボタン表示
			{
				data: null,
				render: function ( data, type, row, meta ) {
					// 申請、詳細、確認、削除ボタン
					var b_input="";
					var b_detail="";
					var b_check="";
					var b_delete="";
					var ret_val = "";
					if(data.btnInput==1){
						b_input = '<button class="btn btn-warning btn-link btn-icon btn-sm b_input" aria-label="申請"><i class="fa fa-pencil"></i></button>';
					}
					if(data.btnDetail==1){
						b_detail = '<button class="btn btn-info btn-link btn-icon btn-sm b_detail" aria-label="詳細"><i class="fa fa-binoculars"></i></button>';
					}
					if(data.btnCheck==1){
						b_check = '<button class="btn btn-warning btn-link btn-icon btn-sm b_check" aria-label="確認"><i class="fa fa-check"></i></button>';
					}
					if(data.btnDelete==1){
						b_delete = '<button class="btn btn-danger btn-link btn-icon btn-sm  b_delete" aria-label="削除"><i class="fa fa-times"></i></button>';
					}
					if( b_input || b_detail || b_check || b_delete ){
						ret_val = '<div class="btn-group">';
						if( b_input ){	ret_val += b_input;	}
						if( b_detail ){	ret_val += b_detail;	}
						if( b_check ){	ret_val += b_check;	}
						if( b_delete ){	ret_val += b_delete;	}
						ret_val += '</div>'
					}
					return ret_val;
				}
			}
			// 1列目以降
			, {data: 'wf_id'}
			, {data: 'row_info_id'}
			, {data: 'title'}
			, {data: 'approval_time'}
			, {data: 'visible_name'}
			, {data: 'status',
				render: function ( data, type, row, meta ) {
					return row.status_name;
				}}
		]
		, responsive: true
		, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: true		// 検索機能 使う
		, stateSave: true		// ページ数、件数切替、ソート状態を保持する時true API state.clearでクリア可能
		, processing: true		// 「処理中」表示
		, orderMulti: true		// 複数の列でソートする
		, order: [ [ 4, 'desc' ],[6,'asc'] ]	// order
		// 列設定
		, columnDefs: [
			{ targets: 0, orderable: false }	// ボタンの列でソートしない
			, { targets: 0, searchable: false }	// ボタンの列で検索しない
			//, { targets: 7, visible: false }	// 非表示
		]
		// 色を変える rowCallback createdRow
		, createdRow: function ( row, data, index ) {
			var stat = data['status'];
			//console.log('createRow  stat='+stat);
			if ( stat== 1) {
				$('td', row).eq(6).addClass('red');
			}else if(stat== 2){
				$('td', row).eq(6).addClass('blue');
			}
		}
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


	// 詳細、編集のurl
	var url_edit = "<!--HP{$documentRoot}HP-->wfapply.php";

	// 申請ボタン
	table.on('click', '.b_input', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var row_info_id = data['row_info_id'];
		location.href = url_edit + '?mode=input&rid=' + row_info_id;
		return false;
	});
	// 詳細ボタン
	table.on('click', '.b_detail', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var wf_id = data['wf_id'];
		location.href = url_edit + '?mode=detail&wfid=' + wf_id;
		return false;
	});
	// 確認ボタン
	table.on('click', '.b_check', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var wf_id = data['wf_id'];
		location.href = url_edit + '?mode=check&wf_id=' + wf_id;
		return false;
	});
	// 削除ボタン
	table.on('click', '.b_delete', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var wf_id = data['wf_id'];
		deleteWorkflow(url_edit, wf_id);
	});
});
-->
</script>
