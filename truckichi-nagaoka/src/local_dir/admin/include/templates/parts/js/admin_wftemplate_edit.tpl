<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>

<script type="text/javascript">
<!--
jQuery(document).ready(function(){
// admin_wftemplate_add.tpl と admin_wftemplate_edit.tplにincludeされます

var table_group;
var table_obj;

	// modal:グループ選択	ここから
	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	$('#jqlist_group tfoot th').each( function(){
		//var filter_id = 'foot_filter'+ String(this.cellIndex);
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" />' );
		}
	});

	// 一覧取得のurl
	var url_api_group = "<!--HP{$documentRoot}HP-->api/v1/groups/";

	//------------
	// DataTable
	table_group = $("#jqlist_group").DataTable({
		ajax: {
			type:"POST"
			, url: url_api_group
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
					btn_select	= '<button class="btn btn-info btn-link btn-icon btn-sm b_select_group" aria-label="選択"><i class="fa fa-check-square"></i></button>';
					return btn_select;
				}
			}
			// 1列目以降
			, {data: 'group_id'}
			, {data: 'group_name'}
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
	table_group.columns().every( function(){
		var that = this;
		$('.foot_filter').on( 'keyup change', function(){
			var col_idx = that.index();
			var tbl_idx = this.parentNode.cellIndex;
			tbl_idx = table_group.column.index( 'toData', tbl_idx );
			
			if(col_idx==tbl_idx){
				if( that.search() !== this.value ){
					table_group
						.columns( col_idx )
						.search( this.value )
						.draw();
				}
			}
		});
	});

	// モーダル表示時
	$('#selGroup').on('show.bs.modal', function (event) {
		// 申請元グループ選択と順序のどちらのボタンを押下されたかによって、タイトルを変更する
		// 行を選択された時の判定にも使う
		var button = $(event.relatedTarget);
		var title = (button.data('name')=='orggroup') ? '申請元グループ選択':'グループ選択';
		var modal = $(this);
		modal.find('.modal-title').text(title);
	});

	// 選択ボタン
	table_group.on('click', '.b_select_group', function(){
		var modal_title = $("#selGroupModalLabel").text();
		var tr = $(this).closest('tr');
		var data = table_group.row( tr ).data();
		var group_id = data['group_id'];
		var group_name = data['group_name'];

		if( modal_title=='申請元グループ選択'){
			$('*[name=orggroup_id]').val(group_id);
			$('*[name=orggroup]').val(group_name);

		}else{
			var rowcount = $("#group_rows > tr").length;
			var row = rowcount + 1;

			$("#group_rows").append('<tr id="tr_groupdelete_'+row+'">'+
				'<td class="groupno"><INPUT type="text" size="5" name="group_order[]" class="form-control input-sm" value=""></td>' +
				'<td>'+group_name+'</td>'+
				'<td><input type="checkbox" id="groupdelete_'+row+'" />'+
				'<input type="hidden" name="groups[]" value="'+group_id+'" /></td>'+
				'</tr>');
		}

		$('#selGroup').modal('hide');
	});
	// modal:グループ選択	ここまで

	// modal:オブジェクト選択	ここから
	// Footerにfilterを表示する
	$('#jqlist_obj tfoot th').each( function(){
		//var filter_id = 'foot_filter'+ String(this.cellIndex);
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" />' );
		}
	});

	// 一覧取得のurl
	var url_api_obj = "<!--HP{$documentRoot}HP-->api/v1/objects/";

	//------------
	// DataTable
	table_obj = $("#jqlist_obj").DataTable({
		ajax: {
			type:"POST"
			, url: url_api_obj
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
					btn_select	= '<button class="btn btn-info btn-link btn-icon btn-sm b_select_obj" aria-label="選択"><i class="fa fa-check-square"></i></button>';
					return btn_select;
				}
			}
			// 1列目以降
			, {data: 'table_info_id'}
			, {data: 'visible_name'}
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
	table_obj.columns().every( function(){
		var that = this;
		$('.foot_filter').on( 'keyup change', function(){
			var col_idx = that.index();
			var tbl_idx = this.parentNode.cellIndex;
			tbl_idx = table_obj.column.index( 'toData', tbl_idx );
			
			if(col_idx==tbl_idx){
				if( that.search() !== this.value ){
					table_obj
						.columns( col_idx )
						.search( this.value )
						.draw();
				}
			}
		});
	});

	// 選択ボタン
	table_obj.on('click', '.b_select_obj', function(){
		var tr = $(this).closest('tr');
		var data = table_obj.row( tr ).data();
		var table_info_id = data['table_info_id'];
		var visible_name = data['visible_name'];

		var rowcount = $("#item_rows > tr").length;
		var row = rowcount + 1;
		$("#item_rows").append('<tr id="tr_itemdelete_'+row+'">'+
				'<td>'+table_info_id+'</td>' +
				'<td>'+visible_name+'</td>'+
				'<td><input type="checkbox" id="itemdelete_'+row+'" />'+
				'<input type="hidden" name="items[]" value="'+table_info_id+'" /></td>'+
				'</tr>');
		$('#selAppObj').modal('hide');
	});
	// modal:オブジェクト選択	ここまで

});

// 順序の削除
function deleteWfTemplateGroup(){
	$('#sortable_group').find('input[type="checkbox"]').each(function(){
		if($(this).prop('checked')){
			$(this).parent().parent().remove();
		}
	});
}

// 承認オブジェクトの削除
function deleteWfTemplateItem(){
	$('#sortable_item').find('input[type="checkbox"]').each(function(){
		if($(this).prop('checked')){
			$(this).parent().parent().remove();
		}
	});
}

	var option={
       stop : function(){
           var i=0;
           $("tr td.groupno","#sortable_group tbody").each(function(i,v){
			$(this).html(++i);
           });
       }
   };
   $(function() {
//       $("#sortable_group tbody").sortable(option);
//       $("#sortable_group tbody").disableSelection();
   });

-->
</script>