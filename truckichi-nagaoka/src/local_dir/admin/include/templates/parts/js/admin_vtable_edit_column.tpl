<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js?"></script>
<script type="text/javascript">
var max_code_value = <!--HP{$maxCodeValue|escape}HP-->;
$(document).ready(function(){

var table_col;
var table_stdobj;
var table_key;
	//-----------------
	// modal:参照カラム選択（入力種別＝オブジェクト選択とユーザー所属選択）	ここから
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
			// 検索条件を追加
			// 入力種別:ユーザ組織の時、テーブルタイプはユーザ組織
			// 入力種別:オブジェクト選択の時、テーブルタイプは全て
			// 入力種別:期間（終了）の時、自身のテーブル内の自分以外のカラム
			, data: function ( d ) {
				d.post_for_get='true';	// データを取得するためのPOST
				var query='';
				if($('#input_type').val() == <!--HP{$inputTypeSelectAssociation|escape}HP-->){
					query = 'table_type:<!--HP{$tableTypeAssociation}HP-->';
				}else if($('#input_type').val() == <!--HP{$inputTypeSelectMaster|escape}HP-->){
					query = '';
				}else if($('#input_type').val() == <!--HP{$inputTypePeriodEnd|escape}HP-->){
					tmp_columnType = $('#column_type').val();
					query = 'table_id:<!--HP{$tid|escape}HP-->';
					query += (' form_type:' + $('#form_type').val());
					if(tmp_columnType){
						query += (' column_type:' + tmp_columnType);
						// カラムタイプに応じたインプットタイプを指定
						if(tmp_columnType==<!--HP{$columnTypeTimestamp|escape}HP-->){
							query += (' input_type:<!--HP{$inputTypeTimestamp|escape}HP-->');
						}else if(tmp_columnType==<!--HP{$columnTypeDate|escape}HP-->){
							query += (' input_type:<!--HP{$inputTypeDate|escape}HP-->');
						}else if(tmp_columnType==<!--HP{$columnTypeTime|escape}HP-->){
							query += (' input_type:<!--HP{$inputTypeTime|escape}HP-->');
						}
					}
					query += ' column_id_ne:<!--HP{$cid|escape}HP-->';
					query += ' system_column_flg:<!--HP{$systemColumnFlgOff}HP-->';
				}
				if(query){
					d.q = query;
				}
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
		// 期間情報参照設定とオブジェクト参照設定のどちらのボタンを押下されたかによって、タイトルを変更する
		// 行を選択された時の判定にも使う
		// select_user:オブジェクト参照設定（入力種別＝ユーザー所属選択）
		// select_master:オブジェクト参照設定（入力種別＝オブジェクト選択）
		// period:期間情報参照設定（入力種別＝日付（終了））
		var button = $(event.relatedTarget);
		var b_period = (button.data('name')=='period') ? true: false;
		var title = (button.data('name')=='period') ? '期間情報参照設定':'参照カラム選択';
		var modal = $(this);
		modal.find('.modal-title').text(title);
		if(b_period){
			table_col.column( 1 ).visible( false );
			table_col.column( 2 ).visible( false );
			table_col.column( 3 ).visible( false );
			table_col.column( 4 ).visible( false );
		}
		table_col.ajax.reload();
	});

	// 選択ボタン
	table_col.on('click', '.b_select', function(){
		var modal_title = $("#selColumnModalLabel").text();
		var tr = $(this).closest('tr');
		var data = table_col.row( tr ).data();

		if( modal_title=='期間情報参照設定'){
			$('[name="start_column_id"]').val(data['column_info_id']);
			$('[name="start_column_name"]').val(data['column_visible_name']);
		}else{
			$('[name="parent_table_id"]').val(data['table_info_id']);
			$('[name="parent_table_name"]').val(data['table_visible_name']);
			$('[name="parent_column_id"]').val(data['column_info_id']);
			$('[name="parent_column_name"]').val(data['column_visible_name']);
		}
		
		$('#selColumn').modal('hide');
	});
	// modal:参照カラム選択（入力種別＝オブジェクト選択とユーザー所属選択）	ここまで

	//-----------------
	// modal:参照カラム選択（入力種別＝標準オブジェクト選択の時）	ここから
	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	$('#jqlist_stdobj tfoot th').each( function(){
		var filter_id = 'foot_filter'+ String(this.cellIndex);
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" />' );
		}
	});

	//------------
	// DataTable（入力種別＝標準オブジェクト選択の時）
	table_stdobj = $("#jqlist_stdobj").DataTable({
		ajax: {
			type:"POST"
			, url: "<!--HP{$documentRoot}HP-->api/v1/referable-object/"
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
			, {data: 'table_name'}
			, {data: 'column_name'}
		]
		, responsive: true
		, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: true		// 検索機能 使う
		, stateSave: false		// ページ数、件数切替、ソート状態を保持する時true stateSave=falseで作成する
		, processing: true		// 「処理中」表示
		, orderMulti: true		// 複数の列でソートする
		, order: [ [ 1, 'asc' ], [ 2, 'asc' ] ]	// order
		// 列設定
		, columnDefs: [
			{ targets: 0, orderable: false }	// ボタンの列でソートしない
			, { targets: 0, searchable: false }	// ボタンの列で検索しない
		]
	});


	// Footerのfilterに文字入力された場合
	// serverSide:falseの時でFooterにfilterを表示した時だけ必要
	table_stdobj.columns().every( function(){
		var that = this;
		$('.foot_filter').on( 'keyup change', function(){
			var col_idx = that.index();
			var tbl_idx = this.parentNode.cellIndex;
			tbl_idx = table_stdobj.column.index( 'toData', tbl_idx );
			
			if(col_idx==tbl_idx){
				if( that.search() !== this.value ){
					table_stdobj
						.columns( col_idx )
						.search( this.value )
						.draw();
				}
			}
		});
	});

	// モーダル表示時
	//$('#selStdObj').on('show.bs.modal', function (event) {
	//	table_stdobj.ajax.reload();
	//});
	
	// 選択ボタン
	table_stdobj.on('click', '.b_select', function(){
		var tr = $(this).closest('tr');
		var data = table_stdobj.row( tr ).data();
		$('[name="referenced_table_name"]').val(data['table_name']);
		$('[name="referenced_column_name"]').val(data['column_name']);
		$('#selStdObj').modal('hide');
	});
	// modal:参照カラム選択（入力種別＝標準オブジェクト選択の時）	ここまで

	//-----------------
	// modal:参照カラム選択（入力種別＝ヘッダーと中間テーブルの時）	ここから
	// Footerにfilterを表示する
	// serverSide:falseの時に表示する
	$('#jqlist_key tfoot th').each( function(){
		var filter_id = 'foot_filter'+ String(this.cellIndex);
		var title = $(this).text();
		if(title=='\xa0'){
			$(this).html( '<input type="hidden" class="form-control foot_filter" />' );
		}else{
			$(this).html( '<input type="text" class="form-control foot_filter" />' );
		}
	});

	//------------
	// DataTable（入力種別＝ヘッダーと中間テーブルの時）
	table_key = $("#jqlist_key").DataTable({
		ajax: {
			type:"POST"
			, url: "<!--HP{$documentRoot}HP-->api/v1/relation-key/"
			, dataSrc: 'data'
			// 検索条件を追加
			// 入力種別:オブジェクト選択（ヘッダー）の時、table_idが自分以外
			// 入力種別:オブジェクト選択（中間テーブル）の時、テーブルタイプは中間テーブルでtable_idが自分以外
			, data: function ( d ) {
				d.post_for_get='true';	// データを取得するためのPOST
				var query = 'table_id_ne:<!--HP{$tid}HP-->'
				if($('#input_type').val() == <!--HP{$inputTypeJunctionTable|escape}HP-->){
					query += ' table_type:<!--HP{$tableTypeJunctionTable}HP-->';
					query += ' junction:true';
				}
				if(query){
					d.q = query;
				}
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
			, {data: 'table_name'}
			, {data: 'table_visible_name'}
			, {data: 'column_name'}
			, {data: 'column_visible_name'}
			, {data: 'relation_key_config_id'}
			, {data: 'table_info_id'}
		]
		, responsive: true
		, serverSide: false		// server-sideで処理しない、最初に一括で読み込む
		, dom: 'lrtip'			// lfrtipのfを除く（右上の検索フィールドを非表示に）
		, searching: true		// 検索機能 使う
		, stateSave: false		// ページ数、件数切替、ソート状態を保持する時true stateSave=falseで作成する
		, processing: true		// 「処理中」表示
		, orderMulti: true		// 複数の列でソートする
		, order: [ [ 1, 'asc' ], [ 3, 'asc' ] ]	// order
		// 列設定
		, columnDefs: [
			{ targets: 0, orderable: false }	// ボタンの列でソートしない
			, { targets: 0, searchable: false }	// ボタンの列で検索しない
			, { targets: 5, visible:false }		// relation_key_config_idを非表示に
			, { targets: 6, visible:false }		// table_info_idを非表示に
		]
	});


	// Footerのfilterに文字入力された場合
	// serverSide:falseの時でFooterにfilterを表示した時だけ必要
	table_key.columns().every( function(){
		var that = this;
		$('.foot_filter').on( 'keyup change', function(){
			var col_idx = that.index();
			var tbl_idx = this.parentNode.cellIndex;
			tbl_idx = table_key.column.index( 'toData', tbl_idx );
			
			if(col_idx==tbl_idx){
				if( that.search() !== this.value ){
					table_key
						.columns( col_idx )
						.search( this.value )
						.draw();
				}
			}
		});
	});

	// モーダル表示時
	$('#selKey').on('show.bs.modal', function (event) {
		table_key.ajax.reload();
	});

	// 選択ボタン
	table_key.on('click', '.b_select', function(){
		var tr = $(this).closest('tr');
		var data = table_key.row( tr ).data();
		$('[name="relation_key_config_id"]').val(data['relation_key_config_id']);
		$('[name="refer_table_name"]').val(data['table_visible_name']);
		$('[name="refer_column_name"]').val(data['column_visible_name']);
		$('[name="table_info_id"]').val(data['table_info_id']);
		$('#selKey').modal('hide');
	});
	// modal:参照カラム選択（入力種別＝ヘッダーと中間テーブルの時）	ここまで

	selectReload('<!--HP{if isset($columnInfo.column_type)}HP--><!--HP{$columnInfo.column_type|escape}HP--><!--HP{/if}HP-->', '<!--HP{if isset($columnInfo.form_type)}HP--><!--HP{$columnInfo.form_type|escape}HP--><!--HP{/if}HP-->', '<!--HP{if isset($columnInfo.search_type)}HP--><!--HP{$columnInfo.search_type|escape}HP--><!--HP{/if}HP-->', false);
	<!--HP{if isset($columnInfo.column_type) && $columnInfo.column_type == $columnTypeText}HP-->
	showHideCryptFlgForm(true);
	showHidePlaceHolderForm(true);
	<!--HP{else}HP-->
	showHideCryptFlgForm(false);
	showHidePlaceHolderForm(false);
	<!--HP{/if}HP-->
	$("#column_type").change(function(){
		selectReload($(this).val(), $("#form_type").val(), $("#search_type").val(), true);
		if($(this).val() == <!--HP{$columnTypeText}HP-->){
			showHideCryptFlgForm(true);
			showHidePlaceHolderForm(true);
		}else{
			showHideCryptFlgForm(false);
			showHidePlaceHolderForm(false);
		}
	});
	$("#form_type").change(function(){
		selectReload($("#column_type").val(), $("#form_type").val(), $("#search_type").val(), false);
		if($(this).val() == <!--HP{$formTypeText|escape}HP--> || $(this).val() == <!--HP{$formTypeTextarea|escape}HP-->){
			if($('#input_type').val() !== ''){
				showHideInputLengthForm(true);
				if($("#column_type").val() == <!--HP{$columnTypeDecimal|escape}HP-->){
					showHideInputLengthDecForm(true);
				}else{
					showHideInputLengthDecForm(false);
				}
				showHideDefaultValueForm(true);
			}else{
				showHideInputLengthForm(false);
				showHideInputLengthDecForm(false);
				showHideDefaultValueForm(false);
			}
		}else if($(this).val() == <!--HP{$formTypeQrcode|escape}HP-->){
			if($('#input_type').val() !== ''){
				showHideInputLengthForm(true);
				showHideInputLengthDecForm(false);
				showHideDefaultValueForm(true);
			}else{
				showHideInputLengthForm(false);
				showHideInputLengthDecForm(false);
				showHideDefaultValueForm(false);
			}
		}else{
			showHideInputLengthForm(false);
			showHideInputLengthDecForm(false);
			showHideDefaultValueForm(false);
		}
		// カラムタイプが文字列の時は、初期表示エリアは非表示に
		if($("#column_type").val() == <!--HP{$columnTypeText|escape}HP-->){
			showHideDefaultValueForm(false);
		}

		if($(this).val() != <!--HP{$formTypeCheckboxSingle|escape}HP-->){
			showHideRequiredFlgForm(true);
		}else{
			showHideRequiredFlgForm(false);
		}
		if($(this).val() == <!--HP{$formTypeCheckboxMulti|escape}HP--> || $(this).val() == <!--HP{$formTypeRadio|escape}HP-->){
			showHideMultiSelectFormDisplayTypeForm(true);
		}else{
			showHideMultiSelectFormDisplayTypeForm(false);
		}
	});
	$("#input_type").change(function(){
		if($('#input_type').val() !== '' &&
			($("#form_type").val() == <!--HP{$formTypeText|escape}HP--> || $("#form_type").val() == <!--HP{$formTypeTextarea|escape}HP--> || $("#form_type").val() == <!--HP{$formTypeQrcode|escape}HP-->)
		){
			showHideInputLengthForm(true);
			if($("#column_type").val() == <!--HP{$columnTypeDecimal|escape}HP-->){
				showHideInputLengthDecForm(true);
			}else{
				showHideInputLengthDecForm(false);
			}
			showHideDefaultValueForm(true);
		}else{
			showHideInputLengthForm(false);
			showHideInputLengthDecForm(false);
			showHideDefaultValueForm(false);
		}
		if($(this).val() == <!--HP{$inputTypeAutoNumber|escape}HP--> && $("#form_type").val() == <!--HP{$formTypeText|escape}HP-->){
			showHideInputLengthForm(false);
			showHideInputLengthDecForm(false);
			showHideDefaultValueForm(false);
			showHideCryptFlgForm(false);
			showHideAutoNumberForm(true);
		}else{
			showHideAutoNumberForm(false);
		}
		// カラムタイプが文字列の時は、初期表示エリアは非表示に
		if($("#column_type").val() == <!--HP{$columnTypeText|escape}HP-->){
			showHideDefaultValueForm(false);
		}
		
		showHideVirtualTableForm(false);
		showHideSelectVirtualTableNormalButton(false);
		showHideSelectVirtualTableMasterButton(false);
		showHideReferTable(false);
		
		if($(this).val() == <!--HP{$inputTypeSelectAssociation|escape}HP-->){
			showHideVirtualTableForm(true);
			showHideSelectVirtualTableNormalButton(true);
		}else if($(this).val() == <!--HP{$inputTypeSelectMaster|escape}HP-->){
			showHideVirtualTableForm(true);
			showHideSelectVirtualTableMasterButton(true);
		}else if ($(this).val() == <!--HP{$inputTypeHeaderItem|escape}HP--> ) {
			showHideReferTable(true);
		}else if ( $(this).val() == <!--HP{$inputTypeJunctionTable|escape}HP--> ) {
			showHideReferTable(true, <!--HP{$tableTypeJunctionTable}HP-->);
		}
		if($(this).val() == <!--HP{$inputTypeSelectDefaultObject|escape}HP-->){
			showHideDefaultObjectForm(true);
		}else{
			showHideDefaultObjectForm(false);
		}
		if($(this).val() == <!--HP{$inputTypeSelectItem|escape}HP--> && $('#form_type').val() != <!--HP{$formTypeCheckboxSingle|escape}HP-->){
			showHideSelectItemForm(true);
			showHideSelectSingleForm(false);
		}else if($(this).val() == <!--HP{$inputTypeSelectItem|escape}HP-->){
			showHideSelectItemForm(false);
			showHideSelectSingleForm(true);
		}else{
			showHideSelectItemForm(false);
			showHideSelectSingleForm(false);
		}
		if($(this).val() == <!--HP{$inputTypeSelectDefaultObject|escape}HP--> || $(this).val() == <!--HP{$inputTypeReferableGroup|escape}HP-->){
			$('#required_flg_hidden').val(1);
			$('#required_flg').attr('checked', 'checked').attr('disabled', 'disabled');
		}else{
			$('#required_flg_hidden').val(0);
			$('#required_flg').removeAttr('disabled');
		}
		if($(this).val() == <!--HP{$inputTypePeriodEnd|escape}HP-->){
			showHidePeriodForm(true);
		}else{
			showHidePeriodForm(false);
		}
		$('input[name=referenced_table_name]').val('');
		$('input[name=referenced_column_name]').val('');
		$('input[name=parent_table_name]').val('');
		$('input[name=parent_column_name]').val('');
		$('input[name=start_column_name]').val('');
		$('input[name="refer_table_name"]').val('');
		$('input[name="relation_key_config_id"]').val('');
		$('input[name="refer_column_name"]').val('');
		$('input[name="table_info_id"]').val('');
	});
	$('#required_flg').attr('readonly', 'readonly');
	if($('#tooltip_visible_flg').attr('checked')){
		$('#tootip_text_required_icon').show();
	}else{
		$('#tootip_text_required_icon').hide();
	}
	$('#tooltip_visible_flg').on('switchChange.bootstrapSwitch', function(){
		if($(this).prop('checked')){
			$('#tootip_text_required_icon').show();
		}else{
			$('#tootip_text_required_icon').hide();
		}
	});
	if($('#placeholder_visible_flg').attr('checked')){
		$('#placeholder_text_required_icon').show();
	}else{
		$('#placeholder_text_required_icon').hide();
	}
	$('#placeholder_visible_flg').on('switchChange.bootstrapSwitch', function(){
		if($(this).prop('checked')){
			$('#placeholder_text_required_icon').show();
		}else{
			$('#placeholder_text_required_icon').hide();
		}
	});
	$("#search_type").change(function(){
		if($(this).val() != <!--HP{$searchTypeNone|escape}HP-->){
			showHideSearchableDisplayRowForm(true);
		}else{
			showHideSearchableDisplayRowForm(false);
		}
	});
});

var input_type = '<!--HP{if isset($columnInfo.input_type)}HP--><!--HP{$columnInfo.input_type|escape}HP--><!--HP{/if}HP-->';
function selectReload(column_type, form_type, search_type, column_type_change){
	$.ajax({
		dataType: 'jsonp',
		data: {
			'tid': <!--HP{$tid|escape}HP-->,
			<!--HP{if isset($cid)}HP-->
			'cid': <!--HP{$cid|escape}HP-->,
			<!--HP{/if}HP-->
			'column_type': column_type,
			'form_type': form_type
		},
		cache: true,
		url: './vtable.php?mode=edit_column_select_json',
		success: function(data){
			$("#form_type").empty();
			$("#form_type").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data['form_type'], function(i,item){
				if(String(item.value) === form_type && column_type_change == false){
					$("#form_type").append($('<option>').attr({value: item.value,selected: true}).text(item.text));
				}
				else{
					$("#form_type").append($('<option>').attr({value: item.value}).text(item.text));
				}
			});
			$("#input_type").empty();
			$("#input_type").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data['input_type'], function(i,item){
				if(String(item.value) === input_type && column_type_change == false){
					$("#input_type").append($('<option>').attr({value: item.value,selected: true}).text(item.text));
				}
				else{
					$("#input_type").append($('<option>').attr({value: item.value}).text(item.text));
				}
			});
			input_type = '';
			$("#search_type").empty();
			$("#search_type").append($('<option>').attr({value: ''}).text('--選択してください--'));
			$.each(data['search_type'], function(i,item){
				if(String(item.value) === search_type && column_type_change == false){
					$("#search_type").append($('<option>').attr({value: item.value,selected: true}).text(item.text));
				}
				else{
					$("#search_type").append($('<option>').attr({value: item.value}).text(item.text));
				}
			});

			if($("#form_type").val() == <!--HP{$formTypeText|escape}HP--> || $("#form_type").val() == <!--HP{$formTypeTextarea|escape}HP-->){
				if($('#input_type').val() !== ''){
					showHideInputLengthForm(true);
					if($("#column_type").val() == <!--HP{$columnTypeDecimal|escape}HP-->){
						showHideInputLengthDecForm(true);
					}else{
						showHideInputLengthDecForm(false);
					}
					showHideDefaultValueForm(true);
				}else{
					showHideInputLengthForm(false);
					showHideInputLengthDecForm(false);
					showHideDefaultValueForm(false);
				}
			}else if($("#form_type").val() == <!--HP{$formTypeQrcode|escape}HP-->){
				if($('#input_type').val() !== ''){
					showHideInputLengthForm(true);
					showHideInputLengthDecForm(false);
					showHideDefaultValueForm(true);
				}else{
					showHideInputLengthForm(false);
					showHideInputLengthDecForm(false);
					showHideDefaultValueForm(false);
				}
			}else{
				showHideInputLengthForm(false);
				showHideInputLengthDecForm(false);
				showHideDefaultValueForm(false);
			}
			if($("#form_type").val() != <!--HP{$formTypeCheckboxSingle|escape}HP-->){
				showHideRequiredFlgForm(true);
			}else{
				showHideRequiredFlgForm(false);
			}
			if($("#form_type").val() == <!--HP{$formTypeCheckboxMulti|escape}HP--> || $("#form_type").val() == <!--HP{$formTypeRadio|escape}HP-->){
				showHideMultiSelectFormDisplayTypeForm(true);
			}else{
				showHideMultiSelectFormDisplayTypeForm(false);
			}

			if($('#input_type').val() !== '' &&
				($("#form_type").val() == <!--HP{$formTypeText|escape}HP--> || $("#form_type").val() == <!--HP{$formTypeTextarea|escape}HP--> || $("#form_type").val() == <!--HP{$formTypeQrcode|escape}HP-->)
			){
				showHideInputLengthForm(true);
				if($("#column_type").val() == <!--HP{$columnTypeDecimal|escape}HP-->){
					showHideInputLengthDecForm(true);
				}else{
					showHideInputLengthDecForm(false);
				}
				showHideDefaultValueForm(true);
			}else{
				showHideInputLengthForm(false);
				showHideInputLengthDecForm(false);
				showHideDefaultValueForm(false);
			}
			// カラムタイプが文字列の時は、初期表示エリアは非表示に
			if($("#column_type").val() == <!--HP{$columnTypeText|escape}HP-->){
				showHideDefaultValueForm(false);
			}
			
			showHideVirtualTableForm(false);
			showHideSelectVirtualTableNormalButton(false);
			showHideSelectVirtualTableMasterButton(false);
			showHideReferTable(false);
			
			if($('#input_type').val() == <!--HP{$inputTypeSelectAssociation|escape}HP-->){
				showHideVirtualTableForm(true);
				showHideSelectVirtualTableNormalButton(true);
			}else if($('#input_type').val() == <!--HP{$inputTypeSelectMaster|escape}HP-->){
				showHideVirtualTableForm(true);
				showHideSelectVirtualTableMasterButton(true);
			}else if ($('#input_type').val() == <!--HP{$inputTypeHeaderItem|escape}HP--> ){
				showHideReferTable(true);
			}else if ( $('#input_type').val() == <!--HP{$inputTypeJunctionTable|escape}HP-->) {
				showHideReferTable(true, <!--HP{$tableTypeJunctionTable}HP-->);
			}
			if($("#input_type").val() == <!--HP{$inputTypeSelectDefaultObject|escape}HP-->){
				showHideDefaultObjectForm(true);
			}else{
				showHideDefaultObjectForm(false);
			}
			if($("#input_type").val() == <!--HP{$inputTypeAutoNumber|escape}HP-->){
				showHideInputLengthForm(false);
				showHideInputLengthDecForm(false);
				showHideDefaultValueForm(false);
				showHideCryptFlgForm(false);
				showHideAutoNumberForm(true);
			}else{
				showHideAutoNumberForm(false);
			}
			if($("#input_type").val() == <!--HP{$inputTypeSelectItem|escape}HP--> && $('#form_type').val() != <!--HP{$formTypeCheckboxSingle|escape}HP-->){
				showHideSelectItemForm(true);
				showHideSelectSingleForm(false);
			}else if($("#input_type").val() == <!--HP{$inputTypeSelectItem|escape}HP-->){
				showHideSelectItemForm(false);
				showHideSelectSingleForm(true);
			}else{
				showHideSelectItemForm(false);
				showHideSelectSingleForm(false);
			}
			if($("#input_type").val() == <!--HP{$inputTypeSelectDefaultObject|escape}HP--> || $("#input_type").val() == <!--HP{$inputTypeReferableGroup|escape}HP-->){
				$('#required_flg_hidden').val(1);
				$('#required_flg').attr('checked', 'checked').attr('disabled', 'disabled');
			}else{
				$('#required_flg_hidden').val(0);
				$('#required_flg').removeAttr('disabled');
			}
			if($("#input_type").val() == <!--HP{$inputTypePeriodEnd|escape}HP-->){
				showHidePeriodForm(true);
			}else{
				showHidePeriodForm(false);
			}
			if($('#search_type').val() != <!--HP{$searchTypeNone|escape}HP-->){
				showHideSearchableDisplayRowForm(true);
			}else{
				showHideSearchableDisplayRowForm(false);
			}
		}
	});
}
</script>
