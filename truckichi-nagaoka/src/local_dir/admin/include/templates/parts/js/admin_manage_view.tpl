<script type="text/javascript" src="<!--HP{$documentRoot}HP-->js/common.js"></script>

<script type="text/javascript">
<!--
var table;

// テーブルjqlist表示
jQuery(function($){
var editor;
var totalCnt =0;	// データ総数 Ajaxリクエスト完了時に取得する
var filteredCnt =0;	// 画面上部の検索条件に一致する件数
	
	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	<!--HP{if $tableData.server_side_flg!=1}HP-->
	$('#jqlist tfoot th').each( function(){
		var filter_id = 'foot_filter'+ String(this.cellIndex);
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" id="'+filter_id+'" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" id="'+filter_id+'" />' );
		}
	});
	<!--HP{/if}HP-->

	// 一覧取得のurl
	var url_api = "<!--HP{$documentRoot}HP-->api/v1/objects/<!--HP{$manageId}HP-->/";


	//------------
	// DataTable
	table = $("#jqlist").DataTable({
		ajax: {
			type:"POST"
			, url: url_api
			, dataSrc: 'data'
			// 検索条件等をカスタムパラメータとして追加する
			, data: function ( d ) {
				var set_val='';
				var query='';
				d.post_for_get='true';	// データを取得するためのPOST

				<!--HP{if $textsearchFlg == 1}HP-->
				// t_table_info.textsearch_flg ON
				set_val= $("#formManageSearch [name='<!--HP{$tableData.table_info_id}HP-->_textsearch]'").val();
				if(set_val){
					if( query ){	query +=' ';}
					query += 'textsearch:' + set_val;
				}
				<!--HP{/if}HP-->

				<!--HP{foreach from=$searchableColumn name=ck key=key item=v}HP-->
				set_val= $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->']").val();
				if(set_val){
					if( query ){	query +=' ';}
					query += '<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->:' + set_val;
				}

				set_val = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_s']").val();
				if ( set_val ) {
					if ( query ) { query += ' '; }
					query += '<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_s:' + set_val;
				}
				s_year = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_sYear']").val();
				s_month = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_sMonth']").val();
				s_day = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_sDay']").val();
				s_hour = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_sHour']").val();
				s_minute = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_sMinute']").val();
				if ( s_year && s_month && s_day && !s_hour && !s_minute ) {
					//YYYY/MM/DDは指定有り、HH:MIは指定無し
					s_hour = "00";
					s_minute = "00";
				}
				if ( s_year && s_month && s_day && s_hour && s_minute ) {
					//0埋め
					s_year = ('0000'+s_year).slice(-4);
					s_month = ('00'+s_month).slice(-2);
					s_day = ('00'+s_day).slice(-2);
					s_hour = ('00'+s_hour).slice(-2);
					s_minute = ('00'+s_minute).slice(-2);
					
					if ( query ) { query += ' '; }
					set_val = s_year + '-' + s_month + '-' + s_day + '%' + s_hour + ':' + s_minute + ':00';
					query += '<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_s:' + set_val;
				}
				else {
					if ( s_hour && s_minute )
					{
						if ( query ) { query += ' '; }
						set_val = s_hour + ':' + s_minute + ':00';
						query += '<!--HP{$v.column_name|escape}HP-->_s:' + set_val;
					}
				}

				set_val = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_e']").val();
				if ( set_val ) {
					if ( query ) { query += ' '; }
					query += '<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_e:' + set_val;
				}
				e_year = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_eYear']").val();
				e_month = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_eMonth']").val();
				e_day = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_eDay']").val();
				e_hour = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_eHour']").val();
				e_minute = $("#formManageSearch [name='<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_eMinute']").val();
				if ( e_year && e_month && e_day && !e_hour && !e_minute ) {
					//YYYY/MM/DDは指定有り、HH:MIは指定無し
					e_hour = "23";
					e_minute = "59";
				}
				if ( e_year && e_month && e_day && e_hour && e_minute ) {
					//0埋め
					e_year = ('0000'+e_year).slice(-4);
					e_month = ('00'+e_month).slice(-2);
					e_day = ('00'+e_day).slice(-2);
					e_hour = ('00'+e_hour).slice(-2);
					e_minute = ('00'+e_minute).slice(-2);
					
					if ( query ) { query += ' '; }
					set_val = e_year + '-' + e_month + '-' + e_day + '%' + e_hour + ':' + e_minute + ':59';
					query += '<!--HP{$v.table_info_id}HP-->_<!--HP{$v.column_name|escape}HP-->_e:' + set_val;
				}
				else {
					if ( e_hour && e_minute )
					{
						if ( query ) { query += ' '; }
						set_val = e_hour + ':' + e_minute + ':00';
						query += '<!--HP{$v.column_name|escape}HP-->_e:' + set_val;
					}
				}

				<!--HP{/foreach}HP-->
				if(query){
					d.q = query;
				}

				<!--HP{if $previewFlag}HP-->
				d.preview = 'on';
				<!--HP{/if}HP-->
			}
		}
		, columns: [
			// 0列目
			{data: 'virtual_row_id'}
			// 1列目はボタン表示
			, {
				data: null,
				render: function ( data, type, row, meta ) {
					// 詳細、編集、削除、サブカテゴリ追加ボタン
					var b_detail="";
					var b_edit="";
					var b_delete="";
					var b_sub_cate="";
					var ret_val = "";
					if(data.btnDetail==1 || data.btnDetail==9){
						var add_class = (data.btnDetail==9) ? ' b_detail9': ' b_detail1';
						b_detail = '<button type="button" class="btn btn-info btn-link btn-icon btn-sm' + add_class + '" aria-label="詳細"><i class="fa fa-binoculars"></i></button>';
					}
					if(data.btnEdit==1 || data.btnEdit==9){
						var add_class = (data.btnEdit==9) ? ' b_edit9': ' b_edit1';
						b_edit = '<button type="button" class="btn btn-warning btn-link btn-icon btn-sm' + add_class + '" aria-label="編集"><i class="fa fa-pencil"></i></button>';
					}
					if(data.btnDelete==1 || data.btnDelete==9){
						var add_class = (data.btnDelete==9) ? ' b_delete9': ' b_delete1';
						b_delete = '<button type="button" class="btn btn-danger btn-link btn-icon btn-sm' + add_class + '" aria-label="削除"><i class="fa fa-times"></i></button>';
					}
					if(data.btnSubCate==1 || data.btnSubCate==9){
						var add_class = (data.btnSubCate==9) ? ' b_subcate9': ' b_subcate1';
						b_sub_cate = '<button type="button" class="btn btn-success btn-link btn-icon btn-sm' + add_class + '" aria-label="サブカテゴリ追加"><i class="fa fa-level-down"></i></button>';
					}
					if( b_detail || b_edit || b_delete || b_sub_cate){
						ret_val = '<div class="btn-group">';
						if( b_detail ){	ret_val += b_detail;	}
						if( b_edit ){	ret_val += b_edit;	}
						if( b_delete ){	ret_val += b_delete;	}
						if( b_sub_cate ){	ret_val += b_sub_cate;	}
						ret_val += '</div>'
					}
					return ret_val;
				}
			}
			// 2列目以降
			<!--HP{foreach from=$columnDisplay item=v}HP-->
			<!--HP{if $v.inline_editable==1}HP-->
				<!--HP{if $v.inline_select==1}HP-->
				, {data: '<!--HP{$v.column_name}HP-->', className: 'editable',
					render: function (data, type, row){ return row['<!--HP{$v.column_name}HP-->_render']; }
				}
				<!--HP{else}HP-->
				, {data: '<!--HP{$v.column_name}HP-->', className: 'editable'}
				<!--HP{/if}HP-->
			<!--HP{else}HP-->
			, {data: null,
				render: function (data, type, row) {
					if ( Array.isArray(row['<!--HP{$v.column_name}HP-->']) )
					{
						var values = "";
						row['<!--HP{$v.column_name}HP-->'].map(function (value, i) {
							if ( i > 0 ) values += ", ";
							values += value.value;
						});
						return values;
					}
					else
					{
						return row['<!--HP{$v.column_name}HP-->'];
					}
				}
			}
			<!--HP{/if}HP-->
			<!--HP{/foreach}HP-->
		]
		, responsive: true
		<!--HP{if $tableData.server_side_flg==1}HP-->
		// ↓serverSide:trueの時はこちら
		, serverSide: true			// server-sideで処理する
		, searching: false			// 検索機能 使わない
		<!--HP{else}HP-->
		// ↓serverSide:falseの時はこちら
		, serverSide: false			// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: true			// 検索機能 使う
		<!--HP{/if}HP-->
		, stateSave: true		// ページ数、件数切替、ソート状態を保持する時true API state.clearでクリア可能
		, processing: true			// 「処理中」表示
		, orderMulti: true			// 複数の列でソートする
		//, order: [ [ 6, "desc" ] ]	// order update_timeの昇順
		//, ordering: false			// ソート機能
		//, lengthChange: false		// 件数切替
		//, scrollX: true			// スクロールバー
		//, scrollY: 200			// スクロールバー
		, displayLength: 100			// 初期表示件数
		// 列設定
		, columnDefs: [
			{ targets: 0, visible:false }		// record_idを非表示に
			, { targets: 1, orderable: false }	// ボタンの列でソートしない
			, { targets: 1, searchable: false }	// ボタンの列で検索しない
			//, { targets: 1, width: 100 }
		]
		// テーブルID毎にステータスを記憶する
		, "stateSaveCallback": function (settings, data) {
			//console.dir(settings );
			localStorage.setItem( 'DataTables-'+settings.sInstance+'_<!--HP{$manageId}HP-->', JSON.stringify(data) )
		}
		, "stateLoadCallback": function (settings, data) {
			return JSON.parse( localStorage.getItem( 'DataTables-'+settings.sInstance+'_<!--HP{$manageId}HP-->' ) )
		}
	});

	// reloadされた時にFooterのFilterに入力済の文字を表示する
	// serverSide:falseの時でFooterにfilterを表示した時だけ必要
	// https://datatables.net/forums/discussion/33182
	<!--HP{if $tableData.server_side_flg!=1}HP-->
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
	<!--HP{/if}HP-->

	// Footerのfilterに文字入力された場合
	// serverSide:falseの時でFooterにfilterを表示した時だけ必要
	<!--HP{if $tableData.server_side_flg!=1}HP-->
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
	<!--HP{/if}HP-->

	// 詳細、編集のurl
	var url_edit = "<!--HP{$documentRoot}HP-->manage.php";
		
	// JSON取得完了時
	table.on( 'xhr', function () {
		// recordsTotal（全データ件数）とrecordsFiltered（検索件数）を取得しておく
		var json = table.ajax.json();
		totalCnt = json.recordsTotal;
		filteredCnt = json.recordsFiltered;
	});

	// 表示完了時
	// serverSide:falseの時、「xx件中xx件」の表示を置き換える
	<!--HP{if $tableData.server_side_flg!=1}HP-->
	table.on('draw', function (){
		if(totalCnt != filteredCnt){
			var data_cnt_text = $("#jqlist_info").text();	// 置換前文字列

			var text_add = ' （全 '+totalCnt+' 件より抽出）';
			var leng = data_cnt_text.length;
			var idx = data_cnt_text.indexOf('（');
			if( 0<idx ){
				data_cnt_text = data_cnt_text.slice( 0, -1 * (leng-idx) ) ;
			}
			$("#jqlist_info").text(data_cnt_text+text_add);	// text_add追加
		}
		//車両情報のステータスによる背景色CSS class設定
		 for (let i = 1; i <= 6; i++) {	//ステータス数文ループ
			$('tr').has('.car_info_status_' + i).removeClass('odd')
			$('tr').has('.car_info_status_' + i).removeClass('even')
			$('tr').has('.car_info_status_' + i ).addClass('td_car_info_status_' + i);
		}
		//数値カンマ
		$('td').has('.num_format').each(function(){
			addFigure($(this));
		});
		function addFigure(elem){
			elem.text(elem.text().replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' ));
		}
		//顧客情報・購入売却情報の会員種別による背景色CSS class設定
		var member_type_length = <!--HP{$smarty.const.MEMBER_TYPE_LIST|@count}HP-->;
		for (let i = 1; i <= member_type_length; i++) {	//ステータス数文ループ
			$('tr').has('.member_type_color_' + i).removeClass('odd')
			$('tr').has('.member_type_color_' + i).removeClass('even')
			$('tr').has('.member_type_color_' + i ).addClass('td_member_type_color_' + i);
		}

	});
	<!--HP{else}HP-->
	table.on('draw', function (){
		//車両情報のステータスによる背景色CSS class設定
		 for (let i = 1; i <= 6; i++) {	//ステータス数文ループ
			$('tr').has('.car_info_status_' + i).removeClass('odd')
			$('tr').has('.car_info_status_' + i).removeClass('even')
			$('tr').has('.car_info_status_' + i ).addClass('td_car_info_status_' + i);
		}
		//数値カンマ
		$('td').has('.num_format').each(function(){
			addFigure($(this));
		});
		function addFigure(elem){
			elem.text(elem.text().replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' ));
		}
		//顧客情報・購入売却情報の会員種別による背景色CSS class設定
		var member_type_length = <!--HP{$smarty.const.MEMBER_TYPE_LIST|@count}HP-->;
		for (let i = 1; i <= member_type_length; i++) {	//ステータス数文ループ
			$('tr').has('.member_type_color_' + i).removeClass('odd')
			$('tr').has('.member_type_color_' + i).removeClass('even')
			$('tr').has('.member_type_color_' + i ).addClass('td_member_type_color_' + i);
		}

	});
	<!--HP{/if}HP-->

	// プレビューの場合
	table.on("click", ".b_detail9, .b_edit9, .b_delete9, .b_subcate9", function(){
		return false;
	});
	// 詳細ボタン
	table.on('click', '.b_detail1', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var record_id = data['virtual_row_id'];
		location.href= url_edit + '?mode=detail&manage_id=<!--HP{$manageId}HP-->' + '&record_id=' + record_id;
		return false;
	});
	// 編集ボタン
	table.on('click', '.b_edit1', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var record_id = data['virtual_row_id'];
		//alert('編集 record_id' + record_id);
		location.href = url_edit + '?mode=edit&manage_id=<!--HP{$manageId}HP-->' + '&record_id=' + record_id;
		return false;
	});
	// 削除ボタン
	table.on('click', '.b_delete1', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var record_id = data['virtual_row_id'];
		deleteManageConfirmView(url_edit, <!--HP{$manageId}HP-->, record_id);
	});
	// サブカテゴリ追加ボタン
	table.on('click', '.b_subcate1', function(){
		tr = $(this).closest('tr');
		var data = table.row( tr ).data();
		var record_id = data['virtual_row_id'];
		location.href = url_edit + '?mode=add&manage_id=<!--HP{$manageId}HP-->' + '&record_id=' + record_id;
		return false;
	});
});

	// 検索ボタン押下時、FooterのFilterをクリアする
	function clear_filter() {
		$('#jqlist tfoot th').each( function(){
			var index = this.cellIndex;
			index = table.column.index( 'toData', index );	// 表示している列に変換
			table
			.columns( index )
			.search( '' )
			.draw();
		});
	}

	$('#formManageSearch').keypress(function(e){
		if(e.which == 13){
			$('#formManageSearch').submit();
		}
	});



-->
</script>
