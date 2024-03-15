<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>

<script type="text/javascript">
$(document).ready(function(){
var table_col;
	// modal:参照カラム選択	ここから
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

	// 一覧取得のurl
	var url_api = "<!--HP{$documentRoot}HP-->api/v1/objects/columns/";

	//------------
	// DataTable
	table_col = $("#jqlist_col").DataTable({
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
		// 新着情報対象選択と参照カラム選択のどちらのボタンを押下されたかによって、タイトルを変更する
		// 行を選択された時の判定にも使う
		var button = $(event.relatedTarget);
		var title = (button.data('name')=='new_information') ? '新着情報対象選択':'参照カラム選択';
		var modal = $(this);
		modal.find('.modal-title').text(title);
	});
	// 選択ボタン
	table_col.on('click', '.b_select', function(){
		var modal_title = $("#selColumnModalLabel").text();
		var tr = $(this).closest('tr');
		var data = table_col.row( tr ).data();
		var table_info_id = data['table_info_id'];
		var table_visible_name = data['table_visible_name'];
		var column_info_id = data['column_info_id'];
		var column_visible_name = data['column_visible_name'];
		
		if( modal_title=='新着情報対象選択'){
			if($('#tbl_new_information_target').find('input[name="new_information_target[table_name][]"]').val() == '' &&
				$('#tbl_new_information_target').find('input[name="new_information_target[column_name][]"]').val() == ''
			){
				$('#tbl_new_information_target').find('input[name="new_information_target[column_name][]"]').parent().parent().remove();
			}
			$('#tbl_new_information_target').append(
				$('<tr>').append(
					$('<td>').append(
						$('<input>').attr('type', 'text').attr('name', 'new_information_target[table_name][]').attr('class','form-control input-sm').attr('readonly', 'readonly').val(table_visible_name)
					).append(
						$('<input>').attr('type', 'hidden').attr('name', 'new_information_target[table_info_id][]').val(table_info_id)
					)
				).append(
					$('<td>').append(
						$('<input>').attr('type', 'text').attr('class','form-control input-sm').attr('name', 'new_information_target[column_name][]').attr('readonly', 'readonly').val(column_visible_name)
					).append(
						$('<input>').attr('type', 'hidden').attr('name', 'new_information_target[column_info_id][]').val(column_info_id)
					)
				).append(
					$('<td>').append(
						$('<input>').attr('type', 'checkbox')
					)
				)
			);

		}else{
			$('[name="table_info_id"]').val(table_info_id);
			$('[name="table_name"]').val(table_visible_name);
			$('[name="column_info_id"]').val(column_info_id);
			$('[name="column_name"]').val(column_visible_name);

		}
		$('#selColumn').modal('hide');
	});
	// modal:参照カラム選択	ここまで
	
	
	
	$('#delete_new_information_target').click(function(){
		$('#tbl_new_information_target').find('input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				$(this).parent().parent().remove();
			}
		})
		if(document.getElementById('tbl_new_information_target').rows.length == 1){
			$('#tbl_new_information_target').append(
				$('<tr>').append(
					$('<td>').append(
						$('<input>').attr('type', 'text').attr('name', 'new_information_target[table_name][]').attr('readonly', 'readonly')
					)
				).append(
					$('<td>').append(
						$('<input>').attr('type', 'text').attr('name', 'new_information_target[column_name][]').attr('readonly', 'readonly')
					)
				).append(
					$('<td>').append(
						$('<input>').attr('type', 'checkbox')
					)
				)
			);
		}
	});
	showHideComponentForm($('#component_type').val());
	$("#component_type").change(function(){
		showHideComponentForm($(this).val());
	});
});
function showHideComponentForm(component_type){
	if(component_type == <!--HP{$componentTypeListPanel|escape}HP-->){
		$('.list_panel_form').show();
		$('.display_rows_form').show();
		$('.implant_form').hide();
		$('.new_information_panel_form').hide();
	}else if(component_type == <!--HP{$componentTypeLinkPanel|escape}HP-->){
		$('.list_panel_form').hide();
		$('.display_rows_form').hide();
		$('.implant_form').hide();
		$('.new_information_panel_form').hide();
	}else if(component_type == <!--HP{$componentTypeImplant|escape}HP-->){
		$('.list_panel_form').hide();
		$('.display_rows_form').hide();
		$('.implant_form').show();
		$('.new_information_panel_form').hide();
	}else if(component_type == <!--HP{$componentTypeApprovalItem|escape}HP--> || component_type == <!--HP{$componentTypeApplyItem|escape}HP-->){
		$('.list_panel_form').hide();
		$('.display_rows_form').show();
		$('.implant_form').hide();
		$('.new_information_panel_form').hide();
	}else if(component_type == <!--HP{$componentTypeNewInformationPanel|escape}HP-->){
		$('.list_panel_form').hide();
		$('.display_rows_form').show();
		$('.implant_form').hide();
		$('.new_information_panel_form').show();
	}else{
		$('.list_panel_form').hide();
		$('.display_rows_form').show();
		$('.implant_form').hide();
		$('.new_information_panel_form').hide();
	}
}
</script>