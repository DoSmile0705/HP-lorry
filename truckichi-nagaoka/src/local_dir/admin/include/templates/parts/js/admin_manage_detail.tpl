<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	$("#preview_service_select").change(function(){
		preview_display();
	});
	<!--HP{if $tableData.table_name == 'vt_tenant'}HP-->
	<!--HP{if isset($tenantType)}HP-->
	<!--HP{if $tenantType >= 1 && $tenantType <=7}HP-->
		$('tr[id^="tr_shop"]').each(function(){
			$(this).show();
		});
		$('tr[id^="tr_com"]').each(function(){
			$(this).hide();
		});
	<!--HP{else}HP-->
		$('tr[id^="tr_com"]').each(function(){
			$(this).show();
		});
		$('tr[id^="tr_shop"]').each(function(){
			$(this).hide();
		});
	<!--HP{/if}HP-->
	<!--HP{/if}HP-->
	<!--HP{/if}HP-->
	preview_display();
	
	// 入力種別:オブジェクト選択（ヘッダー）の設定がしてある子情報をDataTablesで表示する
	// 詳細、編集のurl
	var url_edit = "<!--HP{$documentRoot}HP-->manage.php";

	<!--HP{foreach from=$detailView key=d_key item=d_v}HP-->
		var editor<!--HP{$d_key}HP-->;
		var table<!--HP{$d_key}HP-->;
		// Footerにfilterを表示する
		// serverSide:falseの時に表示する
		<!--HP{if $d_v.tableData.server_side_flg!=1}HP-->
		$('#jqlist<!--HP{$d_key}HP--> tfoot th').each( function(){
			var filter_id = 'foot_filter'+ String(this.cellIndex)+'table<!--HP{$d_key}HP-->';
			var title = $(this).text();
			if(title=='\xa0'){
				$(this).html( '<input type="hidden" class="form-control foot_filter" id="'+filter_id+'" />' );
			}else{
				$(this).html( '<input type="text" class="form-control foot_filter" id="'+filter_id+'" />' );
			}
		});
		<!--HP{/if}HP-->

		<!--HP{if !$previewFlag}HP-->
		//------------
		// editorの設定
		//editor<!--HP{$d_key}HP--> = new $.fn.dataTable.Editor({
		//	ajax: {
		//		type:"PUT"
		//		, url: '<!--HP{$documentRoot}HP-->api/v1/objects/<!--HP{$d_v.tableData.table_info_id}HP-->/'
		//	}
		//	, table: "#jqlist<!--HP{$d_key}HP-->"
		//	, idSrc:'virtual_row_id'
		//	, fields: [
		//		<!--HP{foreach from=$d_v.columnDisplay item=v}HP-->
		//		<!--HP{if $v.inline_editable==1}HP-->
		//			<!--HP{if $v.inline_select==1}HP-->
		//			{ label: null, name:'<!--HP{$v.column_name}HP-->', type: "select"
		//				, options: [
		//					<!--HP{foreach from=$v.select_item key='key' item='row'}HP-->
		//					{ label: "<!--HP{$row|escape}HP-->", value: "<!--HP{$key|escape}HP-->" },
		//					<!--HP{/foreach}HP-->
		//				]
		//			},
		//			<!--HP{elseif $v.form_type==$smarty.const.COLUMN_VALUE_FORM_TYPE_CALENDER}HP-->
		//			{ label: null, name:'<!--HP{$v.column_name}HP-->', type:'datetime', def:function(){return new Date();}, format:'YYYY/MM/DD' },
		//			<!--HP{else}HP-->
		//			{ label: null, name:'<!--HP{$v.column_name}HP-->' },
		//			<!--HP{/if}HP-->
		//		<!--HP{/if}HP-->
		//		<!--HP{/foreach}HP-->
		//	]
		//	, formOptions: {
		//		inline: {
		//			onBlur: 'submit'
		//			, submit: 'changed'	//'allIfChanged'ではない
		//		}
		//	}
		//});


		// dblclickで編集開始
		//$('#jqlist<!--HP{$d_key}HP-->').on( 'dblclick', 'tbody td.editable', function(e){
		//	<!--HP{if $d_v.tableData.server_side_flg==1}HP-->
		//	// ↓serverSide:trueの時はこちら
		//	editor<!--HP{$d_key}HP-->.inline( table<!--HP{$d_key}HP-->.cell( this ).index(), { onBlur: 'submit' } );
		//	<!--HP{else}HP-->
		//	// ↓serverSide:falseの時はこちら
		//	editor<!--HP{$d_key}HP-->.inline( this, { onBlur: 'submit' });
		//	<!--HP{/if}HP-->
		//});

		// submit前に確認
		//editor<!--HP{$d_key}HP-->.on( 'preSubmit', function ( e, aft_data, action ){
		//	if(action=='edit'){
		//		modifier = editor<!--HP{$d_key}HP-->.modifier();
		//		if ( modifier ) {
		//			// UPDATEの確認
		//			var dataIdx = table<!--HP{$d_key}HP-->.cell( modifier ).index().column;
		//			var col_name = table<!--HP{$d_key}HP-->.column( dataIdx ).dataSrc();
		//			console.log('dataIdx:'+dataIdx+' col_name:'+col_name);
		//			var data = table<!--HP{$d_key}HP-->.row( modifier ).data();
		//			var key = data['virtual_row_id'];
		//			console.log('key:'+key);
		//			var bef = data[col_name];	// 修正前
		//			var aft = aft_data.data[key][col_name];	// 修正後
		//			if(bef===aft){
		//				return false;
		//			}else{
		//				if (confirm("編集を確定しますか？ 修正前:"+bef+" → 修正後:"+aft)) {
		//					return true;
		//				} else {
		//					editor<!--HP{$d_key}HP-->.close();
		//					return false;
		//				}
		//			}
		//		}
		//	}
		//	return true;
		//});
		<!--HP{/if}HP-->

		//------------
		// DataTable
		table<!--HP{$d_key}HP--> = $("#jqlist<!--HP{$d_key}HP-->").DataTable({
			ajax: {
				type:"POST"
				, url: '<!--HP{$documentRoot}HP-->api/v1/objects/<!--HP{$d_v.tableData.table_info_id}HP-->/'
				, dataSrc: 'data'
				// 検索条件等をカスタムパラメータとして追加する
				, data: function ( d ) {
					d.post_for_get='true';	// データを取得するためのPOST
					d.header_view='true';	// オブジェクト選択（ヘッダー）が設定してあるテーブルの詳細の下に表示される一覧用
					d.q = '<!--HP{$d_v.tableData.table_info_id}HP-->_<!--HP{$d_v.customQuery}HP-->';
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
				<!--HP{foreach from=$d_v.columnDisplay item=v}HP-->
				<!--HP{if $v.inline_editable==1}HP-->
					<!--HP{if $v.inline_select==1}HP-->
					, {data: '<!--HP{$v.column_name}HP-->', className: 'editable',
						render: function (data, type, row){ return row.<!--HP{$v.column_name}HP-->_render; }
					}
					<!--HP{else}HP-->
					, {data: '<!--HP{$v.column_name}HP-->', className: 'editable'}
					<!--HP{/if}HP-->
				<!--HP{else}HP-->
				, {data: '<!--HP{$v.column_name}HP-->'}
				<!--HP{/if}HP-->
				<!--HP{/foreach}HP-->
			]
			, responsive: true
			<!--HP{if $d_v.tableData.server_side_flg==1}HP-->
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
			// 列設定
			, columnDefs: [
				{ targets: 0, visible:false }		// record_idを非表示に
				, { targets: 1, orderable: false }	// ボタンの列でソートしない
				, { targets: 1, searchable: false }	// ボタンの列で検索しない
			]
		});

		// reloadされた時にFooterのFilterに入力済の文字を表示する
		// serverSide:falseの時でFooterにfilterを表示した時だけ必要
		// https://datatables.net/forums/discussion/33182
		<!--HP{if $d_v.tableData.server_side_flg!=1}HP-->
		var state<!--HP{$d_key}HP--> = table<!--HP{$d_key}HP-->.state.loaded();
		if(state<!--HP{$d_key}HP-->){
			table<!--HP{$d_key}HP-->.columns().eq(0).each(function (colIdx){
				var colSearch = state<!--HP{$d_key}HP-->.columns[colIdx].search;
				if(colSearch.search){
					var filter_id = 'foot_filter'+ String(colIdx)+'table<!--HP{$d_key}HP-->';
					$('#'+filter_id).val(colSearch.search);
				}
			});
			//table<!--HP{$d_key}HP-->.draw();
		}
		<!--HP{/if}HP-->

		// Footerのfilterに文字入力された場合
		// serverSide:falseの時でFooterにfilterを表示した時だけ必要
		<!--HP{if $d_v.tableData.server_side_flg!=1}HP-->
		table<!--HP{$d_key}HP-->.columns().every( function(){
			var that = this;
			$('.foot_filter').on( 'keyup change', function(){
				var col_idx = that.index();
				var tbl_idx = this.parentNode.cellIndex;
				tbl_idx = table<!--HP{$d_key}HP-->.column.index( 'toData', tbl_idx );

				if(col_idx==tbl_idx){
					if( that.search() !== this.value ){
						table<!--HP{$d_key}HP-->
							.columns( col_idx )
							.search( this.value )
							.draw();
					}
				}
			});
		});
		<!--HP{/if}HP-->

		// プレビューの場合
		table<!--HP{$d_key}HP-->.on("click", ".b_detail9, .b_edit9, .b_delete9, .b_subcate9", function(){
			return false;
		});
		// 詳細ボタン
		table<!--HP{$d_key}HP-->.on('click', '.b_detail1', function(){
			tr = $(this).closest('tr');
			var data = table<!--HP{$d_key}HP-->.row( tr ).data();
			var record_id = data['virtual_row_id'];
			location.href= url_edit + '?mode=detail&manage_id=<!--HP{$d_v.tableData.table_info_id}HP-->' + '&record_id=' + record_id;
			return false;
		});
		// 編集ボタン
		table<!--HP{$d_key}HP-->.on('click', '.b_edit1', function(){
			tr = $(this).closest('tr');
			var data = table<!--HP{$d_key}HP-->.row( tr ).data();
			var record_id = data['virtual_row_id'];
			//alert('編集 record_id' + record_id);
			location.href = url_edit + '?mode=edit&manage_id=<!--HP{$d_v.tableData.table_info_id}HP-->' + '&record_id=' + record_id;
			return false;
		});
		// 削除ボタン
		table<!--HP{$d_key}HP-->.on('click', '.b_delete1', function(){
			tr = $(this).closest('tr');
			var data = table<!--HP{$d_key}HP-->.row( tr ).data();
			var record_id = data['virtual_row_id'];
			deleteManageConfirmView(url_edit, <!--HP{$d_v.tableData.table_info_id}HP-->, record_id);
		});
		// サブカテゴリ追加ボタン
		table<!--HP{$d_key}HP-->.on('click', '.b_subcate1', function(){
			tr = $(this).closest('tr');
			var data = table<!--HP{$d_key}HP-->.row( tr ).data();
			var record_id = data['virtual_row_id'];
			location.href = url_edit + '?mode=add&manage_id=<!--HP{$d_v.tableData.table_info_id}HP-->' + '&record_id=' + record_id;
			return false;
		});

	<!--HP{/foreach}HP-->
	
});

function preview_display()
{
<!--HP{if isset($previewService) && !empty($previewService)}HP-->
	var serviceId = $("#preview_service_select option:selected").val();
<!--HP{foreach from=$previewService item=v}HP-->
	if(serviceId == <!--HP{$v.service_id}HP-->){
		var url = '<!--HP{$v.service_url}HP-->';
		var type = '<!--HP{$v.service_type}HP-->';
		var width = '<!--HP{$v.service_width}HP-->';
	}
<!--HP{/foreach}HP-->
	$("#preview_type_hidden").attr("value",type);
	$("#preview_front_iframe").attr("width",width);
	$("#preview_front_form").attr("action",url);
	$("#preview_front_form").submit();
	return false;
<!--HP{/if}HP-->
}
-->

//数値カンマ
$('#tr_price>td').each(function(){
	addFigure($(this));
});
$('#tr_price_ex>td').each(function(){
	addFigure($(this));
});
$('#tr_price_business>td').each(function(){
	addFigure($(this));
});
$('#tr_price_business_ex>td').each(function(){
	addFigure($(this));
});
$('#tr_price_special>td').each(function(){
	addFigure($(this));
});
$('#tr_price_special_ex>td').each(function(){
	addFigure($(this));
});
$('#tr_mileage>td').each(function(){
	addFigure($(this));
});
$('#tr_displacement>td').each(function(){
	addFigure($(this));
});
$('#tr_gross_weight>td').each(function(){
	addFigure($(this));
});
$('#tr_load_capacity>td').each(function(){
	addFigure($(this));
});
$('#tr_recycling_fee>td').each(function(){
	addFigure($(this));
});
$('#tr_amount_payment>td').each(function(){
	addFigure($(this));
});
$('#tr_amount_payment_ex>td').each(function(){
	addFigure($(this));
});
$('#tr_purchase_price>td').each(function(){
	addFigure($(this));
});
$('#tr_purchase_price_ex>td').each(function(){
	addFigure($(this));
});

function addFigure(elem){
	elem.text(elem.text().replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' ));
}
</script>