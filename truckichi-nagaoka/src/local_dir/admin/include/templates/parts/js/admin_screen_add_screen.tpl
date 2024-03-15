<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>

<script type="text/javascript">
$(document).ready(function(){

var table;
	// modal:テーブル名選択	ここから
	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	$('#jqlist tfoot th').each( function(){
		var filter_id = 'foot_filter'+ String(this.cellIndex);
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" />' );
		}
	});

	// 一覧取得のurl
	var url_api = "<!--HP{$documentRoot}HP-->api/v1/objects/";

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
			, {data: 'table_info_id'}
			, {data: 'table_name'}
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
		$('#table_name').val(data['table_name']);
		$('#selTable').modal('hide');
	});
	// modal:テーブル名選択	ここまで
	
	
	$("#screen_type").change(function(){
		selectReload($("#screen_type").val());
	});
	selectReload('<!--HP{$screenInfo.screen_type|escape}HP-->');
	
	$('input[name="screen_div"]:radio' ).change( function() {  
		 $("select[name='screen_columns_num']").val(1);  
	}); 
});
var screen_columns_num = '<!--HP{$screenInfo.screen_columns_num|escape}HP-->';
function selectReload(screen_type){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'screen_type': screen_type
		},
		cache: true,
		url: './screen.php?mode=edit_screen_select_json',
		success: function(data){
			$("#screen_columns_num").empty();
			$("#screen_columns_num").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data, function(i,item){
				if(item.value == screen_columns_num){
					$("#screen_columns_num").append($('<option>').attr({value: item.value,selected: true}).text(item.text));
				}
				else{
					$("#screen_columns_num").append($('<option>').attr({value: item.value}).text(item.text));
				}
			});
			screen_columns_num = '';
		}
	});
}
</script>