<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.multidatespicker.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/tipsy.css" rel="stylesheet" />
<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/datepicker.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<!--HP{$documentRoot}HP-->/css/ui.fancytree.css">
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.multidatespicker.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.tipsy.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/date.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery.datepicker.js"></script>
<style>
ul.fancytree-container {
    border: none;
}
textarea{
	min-height:250px !important;
}

.ui-datepicker select.ui-datepicker-year{
    margin-right: 0.1rem;
    width: auto;
}
.ui-datepicker select.ui-datepicker-month{
    margin-left: 0.3rem;
    width: auto;
}

</style>

<!-- jQuery File Upload -->
<script src="js/load-image.min.js"></script>

<script type="text/javascript">
<!--
function getParam(key) {
	var url   = location.href;
	parameters    = url.split("?");
	params   = parameters[1].split("&");
	var paramsArray = [];
	for ( i = 0; i < params.length; i++ ) {
		neet = params[i].split("=");
		paramsArray.push(neet[0]);
		paramsArray[neet[0]] = neet[1];
	}
	var value = paramsArray[key];
	return value;
}

jQuery(document).ready(function(){

	var sub_flg = false;
	var finish = getParam('finish');
	var table_department;

	if(finish !== undefined){
		sub_flg = true;
		alert('登録しました');
		location.href = '<!--HP{$documentRoot}HP-->manage.php?manage_id=<!--HP{$manageId}HP-->'
	} else {
		var err_alert = "";
		$("span[id^=error_]").each(function(){
			err_alert += $(this).text()+"\n";
		});
		if(err_alert != "") alert(err_alert);
	}

	$("a.blue").click(function(){sub_flg = true;});
	$("a.gray").click(function(){sub_flg = true;});
	
	<!--HP{if !isset($previewFlag) || !$previewFlag}HP-->
	$(window).bind('beforeunload', function(e) {
		if(!sub_flg) return "編集途中ですが、変更内容を破棄し移動しますか？";
	});
	<!--HP{/if}HP-->


	if ($('*[name=deposit_for_drawing]')[0]) {
		$('*[name=deposit_for_drawing]')[0].type = "hidden";
		var len = $('.image_a').length;
		for (i = 0; i < len; i++) {
			if ($('*[name=deposit_for_drawing]')[0].value != $('.image_a')[i].id) {
				$('.image_a')[i].style.border = "5px solid rgb(255, 255, 255)";
			} else {
				$('.image_a')[i].style.border = "5px solid rgb(51, 0, 102)";
			}
		}
		$('.image_a').click(function(){
			var len = $('.image_a').length;
			for (i = 0; i < len; i++) {
				var obj = $('.image_a')[i];
				if (obj.id != $(this).attr("id")) {
					$('.image_a')[i].style.border = "5px solid rgb(255, 255, 255)";
				}
			}
			if ($(this).css("border") == "5px solid rgb(51, 0, 102)") {
				$(this).css("border", "5px solid rgb(255, 255, 255)");
				$('*[name=deposit_for_drawing]')[0].value = null;
			} else {
				$('*[name=deposit_for_drawing]')[0].value = $(this).attr("id");
				$(this).css("border", "5px solid rgb(51, 0, 102)");
			}
		});
	}


	// 中間テーブルが指定してあるカラムの処理 ここから
	<!--HP{foreach from=$columnDisplay key=key item=v}HP-->
	<!--HP{foreach from=$v key=key2 item=v2}HP-->
	<!--HP{if $v2.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_JUNCTION_TABLE}HP-->

	// .hide_boxから.show_boxへドラッグ可能に
	$("#hide_box_<!--HP{$v2.column_info_id}HP--> > div").draggable({
		connectToSortable: '#show_box_<!--HP{$v2.column_info_id}HP-->',
		helper: 'clone',
		opacity: 0.7
	});
	// ドロップしたオブジェクトのID（sortableのコールバック関数内で使用）
	var droppedElementId;
	// .show_box内でソート可能に
	$("#show_box_<!--HP{$v2.column_info_id}HP-->").sortable({
		connectWith: 'div',
		placeholder: 'dragdrop-highlight',
		opacity: 0.7,
		// 他のSortable要素からオブジェクトを受け取った時
		receive: function(event, ui) {
			var text = ui.item.children().children().children().children().text();
			if(text){
				// ドラッグ元のオリジナルオブジェクトを非表示にする
				$('#hide_box_<!--HP{$v2.column_info_id}HP-->').find('td').each(function(){
					if($(this).text() == text){
						$(this).parent().parent().parent().parent().hide();
					}
				});
			}
			enableDeleteButton('<!--HP{$v2.column_info_id}HP-->');
			$(this).sortable("refresh");

			// ドロップされた要素のidを保持
			droppedElementId = $( ui.item ).attr('id');

		},
		// 並び替えが終了した時
		stop: function( event, ui ){ 
			if ( droppedElementId  ) {
				// 別のcolumn_info_idのshow_boxからのドラッグはキャンセルする
				
				var id_src = $(this).attr("id");	// ドラッグ元
				if( 0<=id_src.indexOf("show_box") ){
					$(this).sortable("cancel");
				}
				// 保持していおいたidを、ドロップされた要素に設定
				$( ui.item ).attr( 'id', droppedElementId );
				droppedElementId = null;
			}

		}
	});

	enableDeleteButton('<!--HP{$v2.column_info_id}HP-->');

	/* カラムの一括追加ボタン */
	$("#add-all_<!--HP{$v2.column_info_id}HP-->").click(function() {
		var $show_box = $(this).closest(".show_box_container").find(".show_box");
		var $hide_box = $(".edit_screen_item #hide_box_<!--HP{$v2.column_info_id}HP-->");

		$hide_box.children('div').each(function() {
			$this = $(this);
			if ( $this.is(":hidden") ) {
				return;
			}

			$show_box.append( $(this).clone() );
			$(this).hide();

			enableDeleteButton('<!--HP{$v2.column_info_id}HP-->');
		});
	});

	/* カラムの一括削除ボタン */
	$("#del-all_<!--HP{$v2.column_info_id}HP-->").click(function() {
		var $show_box = $(this).closest(".show_box_container").find(".show_box");

		$show_box.children('div').each(function() {
			$('#hide_box_<!--HP{$v2.column_info_id}HP--> #' + $(this).attr('id')).show();
			$(this).remove();
		});
	});
	<!--HP{/if}HP-->
	<!--HP{/foreach}HP-->
	<!--HP{/foreach}HP-->
		   
	/* 各カラムの削除ボタンのイベントを登録 */
	function enableDeleteButton(cid) {
		$("#show_box_"+cid+" div img.screen_close").unbind("click");
		$("#show_box_"+cid+" div img.screen_close").click(function(){
			$('#hide_box_'+cid+' #' + $(this).parent().attr('id')).show();
			$(this).parent().remove();
		});
	}
	// 中間テーブルが指定してあるカラムの処理 ここまで


	<!--HP{if $userAssociationFlag}HP-->
	// modal:ユーザー所属選択
	// Footerにfilterを表示する
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
		var col_name_user = button.data('column_name');		// 対象のカラム名
		
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
			//table_department.ajax.reload();
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
			//var name = data['name'];
			setManage(col_name_user, virtual_row_id);
			$('#selDepartment').modal('hide');
		});
	});

	// モーダルCLOSE時
	$('#selDepartment').on('hide.bs.modal', function (event) {
		table_department.off('click', '.b_select');
	});
	<!--HP{/if}HP-->
});
var buttonDisplayFlag = true;
$(function() {
	// 単一選択カレンダー
	$('.date-pick').datepicker({
		dateFormat: 'yy-mm-dd'
		, buttonImage: "<!--HP{$documentRoot}HP-->img/icons/calendar.png"
		, buttonText: "カレンダー表示"
		, buttonImageOnly: true
		, showOn: "button"
	});
	// 複数選択カレンダー
	$('.date-pick-multiple').multiDatesPicker({
		dateFormat: 'yy-mm-dd'
		, buttonImage: "<!--HP{$documentRoot}HP-->img/icons/calendar.png"
		, buttonText: "カレンダー表示"
		, buttonImageOnly: true
		, showOn: "button"
		, separator: ","
		, showButtonPanel: true
	});

	// 日本語化
	$.datepicker.regional['ja'] = {
		changeMonth:true,
		changeYear:true,
		closeText: '閉じる',
		prevText: '<前',
		nextText: '次>',
		currentText: '今日',
		monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
		monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
		dayNames: ['日曜日','月曜日','火曜日','水曜日','木曜日','金曜日','土曜日'],
		dayNamesShort: ['日','月','火','水','木','金','土'],
		dayNamesMin: ['日','月','火','水','木','金','土'],
		weekHeader: '週',
		dateFormat: 'yy/mm/dd',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: '年'};
	$.datepicker.setDefaults($.datepicker.regional['ja']);

	
	$('#referable_check').on('switchChange.bootstrapSwitch', function(){
		if($(this).prop('checked') == true){
			$('.referable_group').bootstrapSwitch('state', true);
			$('#backstaff_check').bootstrapSwitch('state', true);
		}
		else{
			$('.referable_group').bootstrapSwitch('state', false);
			$('#backstaff_check').bootstrapSwitch('state', false);
		}
	});

	$('#backstaff_check').on('switchChange.bootstrapSwitch', function(){
		if($(this).prop('checked') == true){
			$('.backstaff_group').bootstrapSwitch('state', true);
		}
		else{
			$('.backstaff_group').bootstrapSwitch('state', false);
		}
	});
	$('.hovertip').tipsy({
		gravity: 'sw',
		opacity: 1,
		html: true
	});

	<!--HP{if isset($tenantType)}HP-->
	showHideTenantInfo(<!--HP{$tenantType}HP-->);
	<!--HP{elseif $tableData.table_name == 'vt_tenant'}HP-->
	showHideTenantInfo($('input[name="tenant_type"]:checked').val());
	$('input[name="tenant_type"]').change(function(){
		showHideTenantInfo($(this).val());
	});
	<!--HP{/if}HP-->

	/**
	 * jQuery File Uploadの設定
	 * @added by narishige
	 * @date 2014-06-10
	 */
	(function() {
		// TODO: ↓現状は「見積り＆見積り設定の場合」というハードコーディングをしているので、
		// 今後特定のフィールド名に依存しないように修正する
		var selector = "input[name=estimate_setup_file], input[name=estimate_file]";
		
		$( "input[type=file]" ).filter( selector ).each( function() {
			// 戻るボタンで遷移してきた場合、
			// 「ファイルは選択されているがシートが未選択」という状況が起こり得るので、
			// 最初にfileフォームをリフレッシュしておく
			clearSelectFile( this );
		});
		// イベントハンドラ登録
		$( "input[type=file]" ).filter( selector ).each( function() { 
			// ファイルアップロードハンドラの初期化
			setupjQueryFileUpload.call( this );
			
			// クリアボタン押下時のイベントハンドラ登録
			$(this).parent().parent()
			.find('input[type="button"][value="クリア"]')
			.on('click', function() {
				// fileフォームが再生成されるため、再度検索して取得
				var fileinput = $(this).closest('td').find('input[type=file]')[0];
				
				// ファイルアップロードハンドラの初期化（対応するfileフォームが再生成されるため必要）
				setupjQueryFileUpload.call( fileinput );
				
				// シート選択のドロップダウンリストを削除
				removeSheetList.call( fileinput );
				
			});
		});
		
	
		function setupjQueryFileUpload () {
	 		var $this = $(this);
	 		var $entry = $this.closest('td')
	 		var inputname = $this.attr('name');
	 		var sheetname_form_name = inputname + '_sheet_name';

	 		// ファイルアップロード機能の初期設定
			$this.fileupload({
				url: '<!--HP{$documentRoot}HP-->manage.php?mode=fileupload&manage_id=<!--HP{$manageId}HP--><!--HP{if isset($headerID)}HP-->&header_id=<!--HP{$headerID}HP--><!--HP{/if}HP-->',
				dataType: 'json',
				dropZone: $entry,
				
				// [replaceFileInput]
				// これをtrueにすると、選択したファイルがformに残らなくなり、フォーム全体をsubmitするときに
				// ファイルをmanage.php?mode=add_completeに渡せなくなる＝困るので、falseにしておく。
				// ただしfalseにすると、クラシックブラウザで動作しなくなる可能性あり
				// @see: https://github.com/blueimp/jQuery-File-Upload/wiki/Frequently-Asked-Questions#why-is-the-file-input-field-cloned-and-replaced-after-each-selection
				replaceFileInput: false, 
				
				formData: { inputname: inputname },
				
				add: function(e, data) {
					// バリデーション
					var uploadErrors = [];
					var acceptFileTypes = /^application\/vnd\.(ms-excel|openxmlformats-officedocument\.spreadsheetml)/i;
					
					//alert(data.originalFiles[0]['type']);
					if(data.originalFiles[0]['type'].length && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
					    uploadErrors.push('Not an accepted file type');
					    // フォームをリフレッシュ
					    var $td = $this.closest('td');
					    clearSelectFile( $this[0] );
					    setupjQueryFileUpload.call( $td.find('input[type=file]')[0] );
					}/*
					if(data.originalFiles[0]['size'].length && data.originalFiles[0]['size'] > 5000000) {
					    uploadErrors.push('Filesize is too big');
					}*/
					if(uploadErrors.length > 0) {
					    alert(uploadErrors.join('\n'));
					} else {
					    data.submit();
					}
				},
				done: function (e, data) {
					// ドロップダウンリスト作成（作成済みの場合は内容を空にする）
					var $list = $entry.find( 'select[name=' + sheetname_form_name +']' );
					if ( $list.size() == 0 ) {
						$list = $( '<span class="sheet_select_container">&nbsp;&nbsp;シート：\
										<select name="'+ sheetname_form_name +'"></select>\
									</span>' ).children(':first');
						$entry.append( $list );
					} else {
						$list.empty();
					}
					// 各シートについてループ
					$.each( data.result[inputname], function(i, sheetName){
						//console.log( sheetName );
						$list.append( '<option value="'+sheetName+'">'+sheetName+'</option>' );
					});
				}
			});
			// ファイル選択時のイベントハンドラ登録
			$this.on('change', function(){
				// ファイル未選択ならば、シート選択のドロップダウンリストを削除
				if ( $(this).val() == '' ) {
					removeSheetList.call( this );
				};
			})
		}
		
		function removeSheetList() {
			var sheetname_form_name = $(this).attr('name') + '_sheet_name';
			$(this).closest('td').find( 'select[name=' + sheetname_form_name +']' ).remove();
		}
	})();



	/**
	 * jQuery File multi Uploadの設定
	 */
	(function() {

		//liテンプレート *liにDB登録用の情報を持たせる
        var multi_file_template_img = ''
            + '<li class="file_multi_image __inputname___li" data-inputname="__inputname__"  data-file_name="__filename__" data-upload_file="__upload_file__" data-thumb_file="__thumb_file__" data-db_registed="__db_registed__" >'
            + '<figure><img src="__thumb_url__" />'
            + '<a class="file_multi_delete">'
            + '<i class="fa fa-times  fa-border"></i>'
            + '</a><figcaption><a href="__upload_url__">__filename__</a></figcaption></figure>'
            + '</li>';

		//＋ファイルアップロード　クリックでファイル選択画面表示
	    $('.file_upload_multi_add_button').on('click', function () {
			var item_name  = $(this).data('inputname');　
	        $('#file_multi_'+item_name).click();
  			return false;
	    });

		//サムネイル削除アイコンクリック時
		$(document).on("click", ".file_multi_delete", function(){
		　	var parentLi = $(this).parent().parent();
			var inputname =parentLi.data('inputname');
			//削除用エリアへコピー
			var arr = {};
			arr['file_name'] = parentLi.data('file_name');　
			arr['upload_file'] = parentLi.data('upload_file');　
			arr['thumb_file'] = parentLi.data('thumb_file');　
			arr['db_registed'] = parentLi.data('db_registed');　
			var deljson = JSON.stringify(arr);
			var deljson_text = "";

			var delval = $('input[name="' + inputname + '_filemulti_del"]').val();
			if (delval ==""){
				var arrs = {};
				arrs[0] = arr;
				deljson_text = JSON.stringify(arrs);
			}else{
				var deljsons = (new Function("return " + delval))();		//stringをjsonに
				var key = Object.keys(deljsons).length;
				deljsons[key] = arr;
				deljson_text = JSON.stringify(deljsons);
			}
			$('input[name="' + inputname + '_filemulti_del"]').val(deljson_text);

			//li削除
			parentLi.remove();

			//json再作成
			var newval = getFilemultiJson(inputname + '_li');
			$('input[name="' + inputname + '"]').val(newval);

		});
		$( function() {
		   // リストを並べ替え可能に
		   $( ".file_multi_list" ).sortable();
		 } );

		$('.file_multi_list').sortable({
		   update: function() { 
				var inputname  = $(this).data('inputname');　
				var newval = getFilemultiJson(inputname + '_li');
				$('input[name="' + inputname + '"]').val(newval);
			}
		 });    

		//DROPエリア制御
		$('.file_multidrop_zone').on("dragenter", function(e){
	        e.stopPropagation();
	        e.preventDefault();
	    });
	    $('.file_multidrop_zone').on("dragover", function(e){
	        e.stopPropagation();
	        e.preventDefault();
	    });
		$('.file_multidrop_zone').on("drop", function(_e){
			var item_name  = $(this).data('inputname');　
	        var e = _e;
	        if( _e.originalEvent ){
	            e = _e.originalEvent;
	        }
	        e.stopPropagation();
	        e.preventDefault();

			// ファイルを取り出します
			var files = e.dataTransfer.files;
			upload_cnt = 0;
			//アップロード前チェック
			if (checkFilemultiBefore(item_name,files.length)===false){
				return;
			}
			// 1件ずつアップロード関数を呼びます
			for (var i = 0; i < files.length; i++) {
				ajaxUploadFileMulti(item_name, files[i]);
			}
	    });


		//input type="file"でファイル選択された
		$('.file_multi_upload').on('change', function(e){
			var item_name  = $(this).data('inputname');　
			//アップロード前チェック
			if (checkFilemultiBefore(item_name,$(this)[0].files.length)===false){
				return;
			}
			//ファイルを取得
			for (var i=0; i<$(this)[0].files.length; i++) {
				// 一件ずつアップロード
				ajaxUploadFileMulti(item_name, $(this)[0].files[i]);
			}
		});


		// ファイルアップロード
		function ajaxUploadFileMulti(inputname,file){

 			var fd = new FormData();
 			fd.append(inputname, file);
 			fd.append("inputname", inputname );
 
			let options = {
					type:'POST',
					url: '<!--HP{$documentRoot}HP-->manage.php?mode=fileuploadmulti&manage_id=<!--HP{$manageId}HP--><!--HP{if isset($headerID)}HP-->&header_id=<!--HP{$headerID}HP--><!--HP{/if}HP-->',
					data: fd,
					cache: false,
					contentType: false,
					processData: false,
					dataType: 'json'
				};

			$.ajax(
			options
				).done(function(d){
				//json返ってきたので処理
					var thumbUrl= '<!--HP{$documentRoot}HP-->manage.php?mode=filemultidl&type=thumb&db_registed=false&uploadname='+d.thumb_file+'&filename='+d.file_name+'&manage_id=<!--HP{$manageId}HP--><!--HP{if isset($recordId)}HP-->&record_id=<!--HP{$recordId}HP--><!--HP{/if}HP-->';
					var uploadUrl= '<!--HP{$documentRoot}HP-->manage.php?mode=filemultidldb_registed=false&uploadname='+d.upload_file+'&filename='+d.file_name+'&manage_id=<!--HP{$manageId}HP--><!--HP{if isset($recordId)}HP-->&record_id=<!--HP{$recordId}HP--><!--HP{/if}HP-->';
	                var imgli = multi_file_template_img.replace(/__filename__/g, d.file_name).replace(/__inputname__/g, inputname).replace(/__upload_file__/g, d.upload_file).replace(/__thumb_file__/g, d.thumb_file).replace(/__db_registed__/g, d.db_registed).replace(/__thumb_url__/g, thumbUrl).replace(/__upload_url__/g, uploadUrl);

					$("#thumb_ul_"+inputname).append(imgli);
					$("#icon_no_image_" + inputname).hide();
					$("#file_multi_" + inputname).val('');
					var newval = getFilemultiJson(inputname + '_li');
					$('input[name="' + inputname + '"]').val(newval);
				}).fail(function(d){

				}).always(function(){
				//完了
			});
		}
	})();

});

function getFilemultiJson(inputname){		//複数ファイルの情報をDB登録する形式json化

	var arr = {};
	var i = 0;
	var ulitem = '.file_multi_image.' + inputname;
	//引数の項目に紐づいたul内のli分ループ
	$(ulitem).each(function(index,dataset) {
		arr[i] = {};
		arr[i]['file_name'] = $(this).data('file_name');　
		arr[i]['upload_file'] = $(this).data('upload_file');　
		arr[i]['thumb_file'] = $(this).data('thumb_file');　
		arr[i]['db_registed'] = $(this).data('db_registed');　
		i++;
	});
	if(i==0){
		return '';
	}else{
		return  JSON.stringify(arr);
	}
}
function checkFilemultiBefore(inputname,countUpload){		//複数ファイルアップロード前のチェック
	
	//アップロード数チェック
	var maxUpload=100;		//最大アップロード数

	var uploadJson=$('input[name="' + inputname + '"]').val();
	if (uploadJson!=""){
		var uploadArr = JSON.parse(uploadJson);
		var uploadArrKeys = Object.keys(uploadArr);
		var countUploaded = uploadArrKeys.length;
	}else{
		var countUploaded = 0;
	}
	if (countUploaded + countUpload >maxUpload){
		alert( '最大アップロード数 '+maxUpload +  'を超えたアップロードはできません');
		return false;
	}

	return true;

}

function formPreviewSubmit(url){
	$(window).off('beforeunload');
	var $form = $('#formEditManage');
	var beforeAction = $form.attr('action');
	$form.attr('target', '_blank');
	$form.attr('action', url);
	$form.submit();
	$form.attr('action', beforeAction);
	$form.removeAttr('target');
}

function formItemPreviewSubmit(url){
	$(window).off('beforeunload');
	var $form = $('#formEditManage');
	var beforeAction = $form.attr('action');
	$form.attr('target', '_blank');
	$form.attr('action', url);
	$form.submit();
	$form.attr('action', beforeAction);
	$form.removeAttr('target');
}
function formNormalPreviewSubmit(url){
	$(window).off('beforeunload');
	var $form = $('#formEditManage');
	var beforeAction = $form.attr('action');
	$form.attr('target', '_blank');
	$form.attr('action', url);
	$form.submit();
	$form.attr('action', beforeAction);
	$form.removeAttr('target');
}

/**
 * 指定URLにフォームをsubmit
 */
function formSubmitTo( url )
{
	$(window).off('beforeunload');
	var $form = $('#formEditManage');
	$form.attr('action', url);
	$form.submit();
}

/**
 * 
 */
function formSubmit ()
{
	// show_boxの内容をinputタグに
	
	<!--HP{foreach from=$columnDisplay key=key item=v}HP-->
	<!--HP{foreach from=$v key=key2 item=v2}HP-->
	<!--HP{if $v2.input_type == $smarty.const.COLUMN_VALUE_INPUT_TYPE_JUNCTION_TABLE}HP-->
	var posts = $('#show_box_<!--HP{$v2.column_info_id}HP-->').sortable('toArray');
	for(var j=0; j<posts.length; j++){
		var postVal = posts[j];
		var lastUnderline = postVal.lastIndexOf('_');
		postVal = postVal.substr(lastUnderline+1);
		$("#div_hidden").append('<input type="hidden" name="<!--HP{$v2.column_name}HP-->[]" value="' + postVal + '">');
	}
	<!--HP{/if}HP-->
	<!--HP{/foreach}HP-->
	<!--HP{/foreach}HP-->
	
	$(window).off('beforeunload');
	$('#formEditManage').submit();
}

/**
 * category tree by tanaka
$(function(){
	//チェンジイベント
	$("input:checkbox").change(function() {
		var cid = $(this).attr('id');
		var ids = cid.split("_");
		var pid = ids[0];
		findParent($(this), pid);

		// 親を探す
		function findParent(_this, pid) {
			if ( pid != "" ) {
				$("input:checkbox[id*=_]").each(function(index) {
					var id = $(this).attr('id')
		//console.log($(this).attr('id'));
					var _ids = id.split("_");
					var _pid = _ids[0];
					var _cid = _ids[1];
					if ( pid == _cid ) {
		//console.log(_cid);
						if (_this.is(':checked')) {
							$(this).prop("checked", "checked");
						} else {
							$(this).removeProp("checked");
						}
						findParent($(this), _pid);
					}
				});
			} else {
				console.log("end");
			}
		}
	});
});
 */
 
/**
 * ツリー形式の入力フォーム初期化 （Fancytree）
 */
$(function(){
	var log = console.log.bind(console);
	var glyph_opts = {
		preset: "awesome4",
		map: {
		  expanderClosed: "fa fa-chevron-circle-right",
		  expanderLazy: "fa fa-chevron-circle-right",
		  expanderOpen: "fa fa-chevron-circle-left"
		}
	};
	
	// @todo hard coding
	var setting = {
		'#tree_category':{ is_multi:true, name:'category', source: window.tree_category },
		'#tree_tag':{ is_multi:true, name:'tag', source: window.tree_tag }
	};
	$('#tree_category, #tree_tag').each(function()
	{
		var $tree = $(this);
		var id = '#'+$tree.attr('id');
		var is_multi = setting[id].is_multi;

		$tree.fancytree({ 
			// データ
			source: setting[id].source,
			//
			activeVisible: true,
			// チェックボックス表示
			checkbox: is_multi,
			extensions: ["glyph", "edit", "dnd5"],
			glyph: glyph_opts,
			edit: {
				triggerStart: ["dblclick"],
				close: function (event, data)
				{
					var node = data.node;
					// 空白トルツメ
					node.setTitle( node.title.replace(/\s/g,'') );
					// 新規追加ノードの場合
					if ( node.key.charAt(0) === "_" )
					{
						// 削除ボタン追加
						var $delbtn = $('<span class="del btn btn-secondary btn-xs"> × </span>').appendTo(node.span);
						$delbtn.on('click', function () {
							node.remove();
						});
					}
					log(event, data.node);
				}
			},

			dnd5: {
		        dragStart: function(node, data) {
		          /* This function MUST be defined to enable dragging for the tree.
		           *
		           * Return false to cancel dragging of node.
		           * data.dataTransfer.setData() and .setDragImage() is available
		           * here.
		           */
		//          data.dataTransfer.setDragImage($("<div>hurz</div>").appendTo("body")[0], -10, -10);
		          return true;
		        },
		        dragDrag: function(node, data) {
		          data.dataTransfer.dropEffect = "move";
		        },
		        dragEnd: function(node, data) {
		        },

		        // --- Drop-support:

		        dragEnter: function(node, data) {
		          // node.debug("dragEnter", data);
		          data.dataTransfer.dropEffect = "move";
		          // data.dataTransfer.effectAllowed = "copy";
		          return true;
		        },
		        dragOver: function(node, data) {
		          data.dataTransfer.dropEffect = "move";
		          // data.dataTransfer.effectAllowed = "copy";
		        },
		        dragLeave: function(node, data) {
		        },
		        dragDrop: function(node, data) {
		          /* This function MUST be defined to enable dropping of items on
		           * the tree.
		           */
		          var transfer = data.dataTransfer;

		          node.debug("drop", data);

		          // alert("Drop on " + node + ":\n"
		          //   + "source:" + JSON.stringify(data.otherNodeData) + "\n"
		          //   + "hitMode:" + data.hitMode
		          //   + ", dropEffect:" + transfer.dropEffect
		          //   + ", effectAllowed:" + transfer.effectAllowed);

		          if( data.otherNode ) {
		            // Drop another Fancytree node from same frame
		            // (maybe from another tree however)
		            var sameTree = (data.otherNode.tree === data.tree);

		            data.otherNode.moveTo(node, data.hitMode);
		          } else if( data.otherNodeData ) {
		            // Drop Fancytree node from different frame or window, so we only have
		            // JSON representation available
		            node.addChild(data.otherNodeData, data.hitMode);
		          } else {
		            // Drop a non-node
		            node.addNode({
		              title: transfer.getData("text")
		            }, data.hitMode);
		          }
		          node.setExpanded();
		        }
		      },

			// ノードアイコン
			icon: false,
			// 開閉エフェクト
			//toggleEffect: false,
			toggleEffect: null,
			// 初期化時コールバック
			init: function (event, data, flag)
			{
				$tree.fancytree("getTree").visit(function(node){
					// 3階層目まで開く
					if ( node.getLevel() < 3 )
					{
						node.setExpanded(true);
					}
				});
				var $newbtn = $('<button class="btn btn-success">New</button>').appendTo($tree);
				// 新規追加ボタン
				$newbtn.on('click', function (e) {
				    var node = $tree.fancytree('getActiveNode') || $tree.fancytree('getRootNode');
 				    node.editCreateNode('child', 'Node title');
					return false;
				});
			},
			// 選択時コールバック
			activate: function (event, data)
			{
				var $t = $( event.toElement );
				if ( !$t.hasClass('fancytree-expander') && !$t.hasClass('fancytree-checkbox') )
				{
					data.node.setSelected( !data.node.selected );
				}
				// チェックボックスの場合は選択中ノードを強調表示しない
				if ( is_multi )
				{
					data.node.setFocus(false);
					data.node.setActive(false);
				}
				//data.tree.activateKey(data.node.key);
			},
		});

		
		// 送信直前にinput生成
		$('#formEditManage').on('submit', function (){
			var newNodes = [];
			// @todo hard coding 
			$tree.fancytree('getTree').generateFormElements(setting[id]['name'] + '[]', !is_multi, {
				filter: function ( node ) {
					if ( /^_\d+/.test( node.key ) )
					{
						newNodes.push( node );
					}
					return node.selected == true;
				}
			});
			$(this).find("[name^='newName_" + setting[id]['name'] + "']").remove()
			for ( var i=0; i<newNodes.length; i++ )
			{
				var node = newNodes[i];
				$(this).append("<input type='hidden' name='newName_" + setting[id]['name'] + "["+ node.key +"]' value='"+ node.title +"' />");
			}
			//alert(jQuery.param($(this).serializeArray()));
		});
	}); // end each()
}); // end $(function()...{})

<!--HP{if $userAssociationFlag}HP-->
function setManage(col_name_user, virtual_row_id){
	$('select[name=' + col_name_user + '] option[value=' + virtual_row_id + ']').prop('selected', true);
}

function clearManage(col_name_user){
	$('select[name=' + col_name_user + '] option[value=""]').prop('selected', true);
}
<!--HP{/if}HP-->

-->
</script>
<!--HP{if $purchaseHistoryFlag}HP-->
<script type="text/javascript">
$('[name="status_general"]').change(function() {
	buyStatusChangeDisabled(false);
	var type = <!--HP{$smarty.const.PURCHASE_TYPE_BUY|escape}HP-->;
	if($('[name="type"]').val() == type){
		<!--HP{foreach from=$smarty.const.PURCHASE_STATUS_CHANGE_DISPLAY_FLAG_GENERAL_LIST key=key item=value}HP-->
			var status = <!--HP{$value|escape}HP-->;
			if($(this).val() == status){
				<!--HP{foreach from=$smarty.const.PURCHASE_AUTO_DISPLAY_DOC_GENERAL_LIST key=doc_key item=doc_value}HP-->
					if(!$('[name="display_flag[<!--HP{$doc_value|escape}HP-->]"]').prop('checked')){
						$('[name="display_flag[<!--HP{$doc_value|escape}HP-->]"]').trigger("click");
					}
				<!--HP{/foreach}HP-->
			}else if($(this).val() == <!--HP{$smarty.const.PURCHASE_STATUS_GENERAL_OPPORTUNITY|escape}HP--> || $(this).val() == ''){
				$('[name^="display_flag"]').each(function(){
					if($(this).prop('checked')){
						$(this).trigger("click");
					}
				});
			}
		<!--HP{/foreach}HP-->
	}
});
$('[name="status_whole_sale"]').change(function() {
	buyStatusChangeDisabled(false);
	var type = <!--HP{$smarty.const.PURCHASE_TYPE_BUY|escape}HP-->;
	if($('[name="type"]').val() == type){
        <!--HP{foreach from=$smarty.const.PURCHASE_STATUS_CHANGE_DISPLAY_FLAG_WHOLE_SALE_LIST key=key item=value}HP-->
		var status = <!--HP{$value|escape}HP-->;
		if($(this).val() == status){
			<!--HP{foreach from=$smarty.const.PURCHASE_AUTO_DISPLAY_DOC_WHOLE_SALE_LIST key=doc_key item=doc_value}HP-->
				if(!$('[name="display_flag[<!--HP{$doc_value|escape}HP-->]"]').prop('checked')){
					$('[name="display_flag[<!--HP{$doc_value|escape}HP-->]"]').trigger("click");
				}
			<!--HP{/foreach}HP-->
		}else if($(this).val() == <!--HP{$smarty.const.PURCHASE_STATUS_WHOLE_SALE_OPPORTUNITY|escape}HP--> || $(this).val() == ''){
			$('[name^="display_flag"]').each(function(){
				if($(this).prop('checked')){
					$(this).trigger("click");
				}
			});
		}
		<!--HP{/foreach}HP-->
	}
});
$('[name="status_sell"]').change(function() {
	var type = <!--HP{$smarty.const.PURCHASE_TYPE_PURCHASE|escape}HP-->;
	if($('[name="type"]').val() == type){
        <!--HP{foreach from=$smarty.const.PURCHASE_STATUS_CHANGE_DISPLAY_FLAG_SELL_LIST key=key item=value}HP-->
		var status = <!--HP{$value|escape}HP-->;
		if($(this).val() == status){
			<!--HP{foreach from=$smarty.const.PURCHASE_AUTO_DISPLAY_DOC_SELL_LIST key=doc_key item=doc_value}HP-->
				if(!$('[name="display_flag[<!--HP{$doc_value|escape}HP-->]"]').prop('checked')){
					$('[name="display_flag[<!--HP{$doc_value|escape}HP-->]"]').trigger("click");
				}
			<!--HP{/foreach}HP-->
		}else if($(this).val() == ''){
			$('[name^="display_flag"]').each(function(){
				if($(this).prop('checked')){
					$(this).trigger("click");
				}
			});
		}
		<!--HP{/foreach}HP-->
	}
});
changeDisabled($('[name="type"]'));
$('[name="type"]').change(function() {
	changeDisabled($(this));
});


function changeDisabled(this_type){
	var type_buy = <!--HP{$smarty.const.PURCHASE_TYPE_BUY|escape}HP-->;
	var type_purchase = <!--HP{$smarty.const.PURCHASE_TYPE_PURCHASE|escape}HP-->;
	if($(this_type).val() == type_buy){//購入
		//買取→活性
		purchaseChangeDisabled(true);
		//購入→非活性
		buyChangeDisabled(false);
	}else if($(this_type).val() == type_purchase){//買取
		//購入→活性
		buyChangeDisabled(true);
		//買取→非活性
		purchaseChangeDisabled(false);
	}else{
		//全て活性
		purchaseChangeDisabled(false);
		buyChangeDisabled(false);
	}
}

function buyChangeDisabled(bool){
	buyStatusChangeDisabled(bool);
	$('[name="amount_payment"]').prop('disabled',bool);
	$('[name="amount_payment_ex"]').prop('disabled',bool);
	$('[name="delivery_place"]').prop('disabled',bool);
	if(bool){
		$('[name="amount_payment"]').val('');
		$('[name="amount_payment_ex"]').val('');
		$('[name="delivery_place"]').val('');
	}
	<!--HP{foreach from=$smarty.const.PURCHASE_DISPLAY_COPY_WHOLE_SALE_LIST key=key item=value}HP-->
		$('[name="<!--HP{$value|escape}HP-->"]').prop('disabled',bool);
		if(bool){
			$('[name="<!--HP{$value|escape}HP-->"]').val('');
		}
	<!--HP{/foreach}HP-->
	<!--HP{foreach from=$smarty.const.PURCHASE_DISPLAY_COPY_GENERAL_LIST key=key item=value}HP-->
		$('[name="<!--HP{$value|escape}HP-->"]').prop('disabled',bool);
		if(bool){
			$('[name="<!--HP{$value|escape}HP-->"]').val('');
		}
	<!--HP{/foreach}HP-->
}

function purchaseChangeDisabled(bool){
	$('[name="status_sell"]').prop('disabled',bool);
	$('[name="purchase_price"]').prop('disabled',bool);
	$('[name="purchase_price_ex"]').prop('disabled',bool);
	if(bool){
		$('[name="status_sell"]').val('');
		$('[name="purchase_price"]').val('');
		$('[name="purchase_price_ex"]').val('');
	}
	<!--HP{foreach from=$smarty.const.PURCHASE_DISPLAY_COPY_SELL_LIST key=key item=value}HP-->
		$('[name="<!--HP{$value|escape}HP-->"]').prop('disabled',bool);
		if(bool){
			$('[name="<!--HP{$value|escape}HP-->"]').val('');
		}
	<!--HP{/foreach}HP-->
}

function buyStatusChangeDisabled(bool){
	if($('[name="status_general"]').val() && !bool){
		$('[name="status_whole_sale"]').prop('disabled',true);
		$('[name="status_whole_sale"]').val('');
		$('[name="status_general"]').prop('disabled',false);
	}else if($('[name="status_whole_sale"]').val() && !bool){
		$('[name="status_whole_sale"]').prop('disabled',false);
		$('[name="status_general"]').prop('disabled',true);
		$('[name="status_general"]').val('');
	}else{
		$('[name="status_general"]').prop('disabled',bool);
		$('[name="status_whole_sale"]').prop('disabled',bool);
		if(bool){
			$('[name="status_general"]').val('');
			$('[name="status_whole_sale"]').val('');
		}
	}
}

</script>
<!--HP{/if}HP-->
<!--HP{if $noticeFlag}HP-->
<script type="text/javascript">

$('[name="type"]').change(function() {
	let $place_top = $('[name="place[<!--HP{$smarty.const.DISPLAY_PLACE_TOP}HP-->]"]');
	let $place_mypage = $('[name="place[<!--HP{$smarty.const.DISPLAY_PLACE_MYPAGE}HP-->]"]');
	if($(this).val() == ''){
        offDisplayPlace($place_top);
        offDisplayPlace($place_mypage);
	}else if($(this).val() == <!--HP{$smarty.const.NOTICE_TYPE_INFO}HP-->){
        onDisplayPlace($place_top);
        offDisplayPlace($place_mypage);
	}else if($(this).val() == <!--HP{$smarty.const.NOTICE_TYPE_MEMBER}HP-->){
        offDisplayPlace($place_top);
        onDisplayPlace($place_mypage);
	}else{
        onDisplayPlace($place_top);
        onDisplayPlace($place_mypage);
	}
});
function onDisplayPlace($place){
    if($place.parents().hasClass('bootstrap-switch-off')){
        $place.trigger("click");
    }
}
function offDisplayPlace($place){
    if(!$place.parents().hasClass('bootstrap-switch-off')){
        $place.trigger("click");
    }
}
</script>
<!--HP{/if}HP-->

<script type="text/javascript">
	$(function(){
		$("input:visible,select:visible,textarea:visible").each(function(i){
			$(this).attr('tabindex',i + 1);
		});

	});
</script>