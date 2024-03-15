<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>

<script type="text/javascript">
<!--
jQuery(function($){
var editor;
var table;
var table_relation;

	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	$('#jqlist_col tfoot th').each( function(){
		var filter_id = 'foot_filter'+ String(this.cellIndex);
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" id="'+filter_id+'" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" id="'+filter_id+'" />' );
		}
	});

	// 一覧取得のurl
	var url_api = "<!--HP{$documentRoot}HP-->api/v1/objects/columns/";

/*
	//------------
	// editorの設定
	editor = new $.fn.dataTable.Editor({
		ajax: {
			type:"PUT"
			, url: url_api
		}
		, table: "#jqlist_col"
		, idSrc:'column_info_id'
		, fields: [
			{ label: null, name:'column_visible_name'}
		]
		, formOptions: {
			inline: {
				onBlur: 'submit'
				, submit: 'changed'	//'allIfChanged'ではない
			}
		}
	});
	
	// dblclickで編集開始
	$('#jqlist_col').on( 'dblclick', 'tbody td.editable', function(e){
		editor.inline( this, { onBlur: 'submit' });
	});

	// submit前に確認
	editor.on( 'preSubmit', function ( e, aft_data, action ){
		if(action=='edit'){
			modifier = editor.modifier();
			if ( modifier ) {
				// UPDATEの確認
				var dataIdx = table.cell( modifier ).index().column;
				var col_name = table.column( dataIdx ).dataSrc();
				var data = table.row( modifier ).data();
				var key = data['group_id'];
				console.log('key:'+key);
				var bef = data[col_name];	// 修正前
				var aft = aft_data.data[key][col_name];	// 修正後
				if(bef===aft){
					return false;
				}else{
					if (confirm("編集を確定しますか？ 修正前:"+bef+" → 修正後:"+aft)) {
						return true;
					} else {
						editor.close();
						return false;
					}
				}
			}
		}
		return true;
	});
*/
	//------------
	// DataTable（カラム一覧）
	table = $("#jqlist_col").DataTable({
		ajax: {
			type:"POST"
			, url: url_api
			, dataSrc: 'data'
			// 検索条件をカスタムパラメータとして追加する
			, data: function ( d ) {
				d.post_for_get='true';	// データを取得するためのPOST
				d.q = 'table_id:<!--HP{$tid|escape}HP-->';
			}
		}
		, columns: [
			// 0列目はボタン表示
			{
				data: null,
				render: function ( data, type, row, meta ) {
					// 詳細、編集、削除ボタン
					var b_detail="";
					var b_edit="";
					var b_delete="";
					var ret_val = "";
					if(data.btnDetail==1){
						b_detail = '<button class="btn btn-info btn-link btn-icon btn-sm b_detail" aria-label="詳細"><i class="fa fa-binoculars"></i></button>';
					}
					if(data.btnEdit==1){
						b_edit = '<button class="btn btn-warning btn-link btn-icon btn-sm b_edit" aria-label="編集"><i class="fa fa-pencil"></i></button>';
					}
					if(data.btnDelete==1){
						b_delete = '<button class="btn btn-danger btn-link btn-icon btn-sm  b_delete" aria-label="削除"><i class="fa fa-times"></i></button>';
					}
					if( b_detail || b_edit || b_delete ){
						ret_val = '<div class="btn-group">';
						if( b_detail ){	ret_val += b_detail;	}
						if( b_edit ){	ret_val += b_edit;	}
						if( b_delete ){	ret_val += b_delete;	}
						ret_val += '</div>'
					}
					return ret_val;
				}
			}
			// 1列目以降
			, {data: 'column_name'}
			, {data: 'column_type',
				render: function (val, type, row){ return row.column_type_name; }}
			, {data: 'column_visible_name', className: 'editable'}
			, {data: 'reference'}
			, {data: 'table_info_id'}
			, {data: 'column_info_id'}
		]
		, responsive: true
		, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: true		// 検索機能 使う
		, stateSave: true		// ページ数、件数切替、ソート状態を保持する時true API state.clearでクリア可能
		, processing: true		// 「処理中」表示
		, orderMulti: true		// 複数の列でソートする
		, order: [ [ 1, 'asc' ] ]	// order
		// 列設定
		, columnDefs: [
			{ targets: 0, orderable: false }	// ボタンの列でソートしない
			, { targets: 0, searchable: false }	// ボタンの列で検索しない
			, { targets: 5, visible:false }		// table_info_idを非表示に
			, { targets: 6, visible:false }		// column_info_idを非表示に
		]
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
	var url_edit = "<!--HP{$documentRoot}HP-->vtable.php";

	// 詳細ボタン
	table.on('click', '.b_detail', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var table_id = data['table_info_id'];
		var column_id = data['column_info_id'];
		location.href = url_edit + '?mode=detail_column&tid='+table_id+'&cid='+column_id;
		return false;
	});
	// 編集ボタン
	table.on('click', '.b_edit', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var table_id = data['table_info_id'];
		var column_id = data['column_info_id'];
		location.href = url_edit + '?mode=edit_column&tid='+table_id+'&cid='+column_id;
		return false;
	});
	// 削除ボタン
	table.on('click', '.b_delete', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var table_id = data['table_info_id'];
		var column_id = data['column_info_id'];
		deleteColumnConfilm(url_edit, table_id, column_id);
	});

	
	//------------
	// DataTable（リレーション一覧）
	table_relation = $("#jqlist_relation").DataTable({
		ajax: {
			type:"POST"
			, url: "<!--HP{$documentRoot}HP-->api/v1/relation-key/"
			, dataSrc: 'data'
			// 検索条件をカスタムパラメータとして追加する
			, data: function ( d ) {
				d.post_for_get='true';	// データを取得するためのPOST
				d.q = 'table_id_eq:<!--HP{$tid|escape}HP-->';
			}
		}
		, columns: [
			{data: 'column_name'}
			, {data: 'column_visible_name'}
			, {data: 'relation_key_config_id'}
		]
		, responsive: true
		, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: false		// 検索機能 使わない
		, stateSave: false		// ページ数、件数切替、ソート状態を保持しない
		, processing: true		// 「処理中」表示
		, orderMulti: true		// 複数の列でソートする
		, order: [ [ 0, 'asc' ] ]	// order
		// 列設定
		, columnDefs: [
			{ targets: 2, visible:false }		// relation_key_config_idを非表示に
		]
	});

});
-->
</script>
