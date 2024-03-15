<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//showHideStockItemType();	// 関数がない
	showHideCooperateSite();
	showHideInqueryFile('<!--HP{$tableNameTRequest}HP-->');
	showHideJunctionRef();
	$("#table_type").change(function(){
	//	showHideStockItemType();	// 関数がない
		showHideJunctionRef();
	});
	<!--HP{if !empty($cooperateSite)}HP-->
	$("#table_type").change(function(){
		showHideCooperateSite();
	});
	<!--HP{/if}HP-->
	$("#table_type").change(function(){
		showHideInqueryFile('<!--HP{$tableNameTRequest}HP-->');
	});
		   
		   

var table_col;
	//-----------------
	// modal:参照カラム選択（オブジェクトタイプが「中間テーブル」の時に表示するモーダル）	ここから
	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	$('#jqlist_col tfoot th').each( function(){
		var filter_id = 'foot_filter'+ String(this.cellIndex);
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" />' );
		}
	});

	//------------
	// DataTable
	table_col = $("#jqlist_col").DataTable({
		ajax: {
			type:"POST"
			, url: "<!--HP{$documentRoot}HP-->api/v1/objects/columns/"
			, dataSrc: 'data'
			, data: function ( d ) {
				d.post_for_get='true';	// データを取得するためのPOST
				d.q = query='';			// 検索条件:テーブルタイプは全て
			}
		}
		, columns: [
			// 0列目はボタン表示
			{
				data: null,
				render: function ( data, type, row, meta ) {
					// 選択ボタン
					btn_select	= '<button class="btn btn-info btn-link btn-icon btn-sm b_select" aria-label="選択"><i class="fa fa-check-square"></i></button>';
					return btn_select;
				}
			}
			// 1列目以降
			, {data: 'table_info_id'}
			, {data: 'table_name'}
			, {data: 'table_visible_name'}
			, {data: 'column_info_id'}
			, {data: 'column_name'}
			, {data: 'column_visible_name'}
		]
		, responsive: true
		, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: true		// 検索機能 使う
		, stateSave: false		// ページ数、件数切替、ソート状態を保持する時true stateSave=falseで作成する
		, processing: true		// 「処理中」表示
		, orderMulti: true		// 複数の列でソートする
		, order: [ [ 1, 'asc' ], [ 4, 'asc' ] ]	// order
		// 列設定
		, columnDefs: [
			{ targets: 0, orderable: false }	// ボタンの列でソートしない
			, { targets: 0, searchable: false }	// ボタンの列で検索しない
		]
	});


	// Footerのfilterに文字入力された場合
	// serverSide:falseの時でFooterにfilterを表示した時だけ必要
	table_col.columns().every( function(){
		var that = this;
		$('.foot_filter').on( 'keyup change', function(){
			var col_idx = that.index();
			var tbl_idx = this.parentNode.cellIndex;
			tbl_idx = table_col.column.index( 'toData', tbl_idx );
			
			if(col_idx==tbl_idx){
				if( that.search() !== this.value ){
					table_col
						.columns( col_idx )
						.search( this.value )
						.draw();
				}
			}
		});
	});

	// モーダル表示時
	$('#selColumn').on('show.bs.modal', function (event) {
		// 参照オブジェクト１と参照オブジェクト２のどちらのボタンを押下されたかによって、タイトルを変更する
		// 行を選択された時の判定にも使う
		var button = $(event.relatedTarget);
		var title = (button.data('name')=='select_ref1') ? '参照カラム選択１':'参照カラム選択２';
		var modal = $(this);
		modal.find('.modal-title').text(title);
		table_col.ajax.reload();
	});

	// 選択ボタン
	table_col.on('click', '.b_select', function(){
		var modal_title = $("#selColumnModalLabel").text();
		var tr = $(this).closest('tr');
		var data = table_col.row( tr ).data();

		if( modal_title=='参照カラム選択１'){
			$('[name="ref_table_id1"]').val(data['table_info_id']);
			$('[name="ref_table_name1"]').val(data['table_visible_name']);
			$('[name="ref_column_id1"]').val(data['column_info_id']);
			$('[name="ref_column_name1"]').val(data['column_visible_name']);
		}else{
			$('[name="ref_table_id2"]').val(data['table_info_id']);
			$('[name="ref_table_name2"]').val(data['table_visible_name']);
			$('[name="ref_column_id2"]').val(data['column_info_id']);
			$('[name="ref_column_name2"]').val(data['column_visible_name']);
		}
		
		$('#selColumn').modal('hide');
	});
	// modal:参照カラム選択（入力種別＝オブジェクト選択とユーザー所属選択）	ここまで

});
</script>
