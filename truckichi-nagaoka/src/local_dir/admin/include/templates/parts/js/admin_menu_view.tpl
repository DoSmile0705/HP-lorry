<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>

<script type="text/javascript">
<!--
jQuery(function($){
var editor;
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
	var url_api = "<!--HP{$documentRoot}HP-->api/v1/menus/";

	//------------
	// editorの設定
	editor = new $.fn.dataTable.Editor({
		ajax: {
			type:"PUT"
			, url: url_api
		}
		, table: "#jqlist"
		, idSrc:'menu_id'
		, fields: [
			{ label: null, name:'menu_name'}
			, { label: null, name:'menu_type', type: "select"
				, options: [
					<!--HP{foreach from=$menuType key='key' item='val'}HP-->
					{ label: "<!--HP{$val|escape}HP-->", value: "<!--HP{$key|escape}HP-->" },
					<!--HP{/foreach}HP-->
				]
			}
			, { label: null, name:'child_item', type: "select"
				, options: [
					{ label: "", value: "0" },
					<!--HP{foreach from=$childItems key='key' item='val'}HP-->
					{ label: "<!--HP{$val.visible_name|escape}HP-->", value: "<!--HP{$val.table_info_id|escape}HP-->" },
					<!--HP{/foreach}HP-->
				]
			}
		]
		, formOptions: {
			inline: {
				onBlur: 'submit'
				, submit: 'changed'	//'allIfChanged'ではない
			}
		}
	});

	// dblclickで編集開始
	$('#jqlist').on( 'dblclick', 'tbody td.editable', function(e){
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
				var key = data['menu_id'];
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
			, {data: 'menu_id'}
			, {data: 'menu_name', className: 'editable'}
			, {data: 'menu_type', className: 'editable',
				render: function (data, type, row){ return row.menu_type_name; }
			}
			, {data: 'parent_menu'}
			, {data: 'child_item', className: 'editable',
				render: function (data, type, row){ return row.child_item_name; }
			}
			, {data: 'update_user'}
			, {data: 'update_time'}
			//, {data: 'menu_type_name'}
			//, {data: 'child_item_name'}
		]
		, responsive: true
		, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: true		// 検索機能 使う
		, stateSave: true		// ページ数、件数切替、ソート状態を保持する時true API state.clearでクリア可能
		, processing: true		// 「処理中」表示
		, orderMulti: true		// 複数の列でソートする
		, order: [ [ 7, 'desc' ] ]	// order
		// 列設定
		, columnDefs: [
			{ targets: 0, orderable: false }	// ボタンの列でソートしない
			, { targets: 0, searchable: false }	// ボタンの列で検索しない
			//, { targets: 8, visible: false }	// 非表示
			//, { targets: 9, visible: false }	// 非表示
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
	var url_edit = "<!--HP{$documentRoot}HP-->menu.php";
	
	// 詳細ボタン
	table.on('click', '.b_detail', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var menu_id = data['menu_id'];
		location.href = url_edit + '?mode=detail_menu&mid=' + menu_id;
		return false;
	});
	// 編集ボタン
	table.on('click', '.b_edit', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var menu_id = data['menu_id'];
		location.href = url_edit + '?mode=edit_menu&mid=' + menu_id;
		return false;
	});
	// 削除ボタン
	table.on('click', '.b_delete', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var menu_id = data['menu_id'];
		deleteMenuConfilm(url_edit, menu_id);
	});

});
-->
</script>