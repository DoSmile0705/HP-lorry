<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>

<script type="text/javascript">
<!--
$(document).ready(function(){
var table;
var table_department;
	// modal:プロファイル選択	ここから
	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	$('#jqlist tfoot th').each( function(){
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" />' );
		}
	});

	// 一覧取得のurl
	var url_api = "<!--HP{$documentRoot}HP-->api/v1/profiles/";

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
					// 選択ボタン
					btn_select	= '<button class="btn btn-info btn-link btn-icon btn-sm b_select" aria-label="選択"><i class="fa fa-check-square"></i></button>';
					return btn_select;
				}
			}
			// 1列目以降
			, {data: 'profile_id'}
			, {data: 'profile_name'}
			, {data: 'profile_type',
				render: function (data, type, row){ return row.profile_type_name; }
			}
		]
		, responsive: true
		, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: true		// 検索機能 使う
		, stateSave: false		// ページ数、件数切替、ソート状態を保持する時true stateSave=falseで作成する
		, processing: true		// 「処理中」表示
		, orderMulti: true		// 複数の列でソートする
		, order: [ [ 1, 'asc' ] ]	// order
		// 列設定
		, columnDefs: [
			{ targets: 0, orderable: false }	// ボタンの列でソートしない
			, { targets: 0, searchable: false }	// ボタンの列で検索しない
		]
	});


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

	// 選択ボタン
	table.on('click', '.b_select', function(){
		var tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		$('#profile_id').val(data['profile_id']);
		$('#profile_name').val(data['profile_name']);
		$('#selProfile').modal('hide');
	});
	// modal:プロファイル選択	ここまで




	// modal:ユーザー所属選択	ここから
	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	$('#jqlist_department tfoot th').each( function(){
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" />' );
		}
	});

	// モーダル表示時
	$('#selDepartment').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		var table_id_user = button.data('table_id');		// ユーザー組織のtable_id
		
		// 一覧取得のurl
		var url_api_department = "<!--HP{$documentRoot}HP-->api/v1/objects/" + table_id_user;
		
		if(!table_department){
			//------------
			// DataTable
			table_department = $("#jqlist_department").DataTable({
				ajax: {
					type:"POST"
					, url: url_api_department
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
							// 選択ボタン
							btn_select	= '<button class="btn btn-info btn-link btn-icon btn-sm b_select" aria-label="選択"><i class="fa fa-check-square"></i></button>';
							return btn_select;
						}
					}
					// 1列目以降
					, {data: 'virtual_row_id'}
					, {data: 'name'}
					, {data: 'name_kana'}
				]
				, responsive: true
				, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
				, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
				, searching: true		// 検索機能 使う
				, stateSave: false		// ページ数、件数切替、ソート状態を保持する時true stateSave=falseで作成する
				, processing: true		// 「処理中」表示
				, orderMulti: true		// 複数の列でソートする
				, order: [ [ 1, 'asc' ] ]	// order
				// 列設定
				, columnDefs: [
					{ targets: 0, orderable: false }	// ボタンの列でソートしない
					, { targets: 0, searchable: false }	// ボタンの列で検索しない
				]
			});
		}else{
			table_department.ajax.url(url_api_department).load();
		}
		
		// Footerのfilterに文字入力された場合
		// serverSide:falseの時でFooterにfilterを表示した時だけ必要
		table_department.columns().every( function(){
			var that = this;
			$('.foot_filter').on( 'keyup change', function(){
				var col_idx = that.index();
				var tbl_idx = this.parentNode.cellIndex;
				tbl_idx = table_department.column.index( 'toData', tbl_idx );
					if(col_idx==tbl_idx){
					if( that.search() !== this.value ){
						table_department
							.columns( col_idx )
							.search( this.value )
							.draw();
					}
				}
			});
		});

		// 選択ボタン
		table_department.on('click', '.b_select', function(){
			var tr = $(this).closest('tr');
			var data = table_department.row( tr ).data();
			var virtual_row_id = data['virtual_row_id'];
			var name = data['name'];
			setManage(table_id_user, virtual_row_id, name);
			$('#selDepartment').modal('hide');
		});
	});

	// モーダルCLOSE時
	$('#selDepartment').on('hide.bs.modal', function (event) {
		table_department.off('click', '.b_select');
	});
						   
	// modal:ユーザー所属選択	ここまで


	$('#required_flg').attr('readonly', 'readonly');
	showHidePasswordConfirmRequiredIcon($('#password').val());
	$('#password').change(function(){
		showHidePasswordConfirmRequiredIcon($(this).val());
	});
});

function setManage(table_id_user, virtual_row_id, name){
	$("#virtual_row_id"+table_id_user).val(virtual_row_id);
	$("#name"+table_id_user).val(name);
}

<!--HP{foreach from=$associationTable key=key item=v}HP-->
function clearManage<!--HP{$v.table_info_id}HP-->(){
	$('#virtual_row_id<!--HP{$v.table_info_id}HP-->').val("");
	$('#name<!--HP{$v.table_info_id}HP-->').val("");
}
<!--HP{/foreach}HP-->

function showHidePasswordConfirmRequiredIcon(value){
	if(value){
		$('#password_confirm_required_icon').show();
	}else{
		$('#password_confirm_required_icon').hide();
	}
}
-->
</script>
