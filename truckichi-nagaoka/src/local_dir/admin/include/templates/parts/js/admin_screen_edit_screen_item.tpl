<link type="text/css" href="<!--HP{$documentRoot}HP-->/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
/**
 * @modified by yuuki.narishige
 * @date 2014/05/20 
 */
$(function() {
	// .layout_item_boxおよび.hide_boxから.show_boxへドラッグ可能に
	$(".layout_item_box > div, .hide_box > div").draggable({
		connectToSortable: '.show_box',
		helper: 'clone',
		opacity: 0.7
	});
	// ドロップしたオブジェクトのID（sortableのコールバック関数内で使用）
	var droppedElementId;
	// .show_box内でソート可能に
	$(".show_box").sortable({
		connectWith: 'div',
		placeholder: 'dragdrop-highlight',
		opacity: 0.7,
		// 他のSortable要素からオブジェクトを受け取った時
		receive: function(event, ui) {
			var text = ui.item.children().children().children().children().text();
			if(text){
				// ドラッグ元のオリジナルオブジェクトを非表示にする
				$('.hide_box').find('td').each(function(){
					if($(this).text() == text){
						$(this).parent().parent().parent().parent().hide();
					}
				});
			} else {
				ui.item.children().children().children().children().children().removeAttr('disabled');
				$('.layout_item_type_section').unbind("focus", "blur");
				$('.layout_item_type_section').focus(function(){
					if($(this).hasClass('dummy_text')){
						$(this).css('color', '#000000').val('').removeClass('dummy_text');
					}
				}).blur(function(){
					if($(this).val().length == 0){
						$(this).css('color', '#888888').val('テキストを入力').addClass('dummy_text');
					}
				}).blur();
			}
			enableDeleteButton();
			$(this).sortable("refresh");
			
			// ドロップされた要素のidを保持
			droppedElementId = $( ui.item ).attr('id');

		},
		// 並び替えが終了した時
		stop: function( event, ui ){
			//console.log(ui.item.find('td')[0].outerHTML);
			var dom_str = ui.item.find('td')[0].outerHTML;
			if ( !hasShowBox(dom_str, event.clientX, event.clientY) )
			{
				// 未保存の画面項目はそのまま処理
				var delete_item_id = $( ui.item ).attr('id');
				if ( !delete_item_id )
				{
					var button = $(ui.item).find("button");
					delete_item_id = $(button).attr("data-item_id");
				}
				if ( delete_item_id )
				{
					if (/temp_/.test(delete_item_id) )
					{
						$('.hide_box #' + delete_item_id).show();
					}
					else {
						$('.hide_box #temp_' + delete_item_id).show();
						$('.hide_box #temp_' + delete_item_id).css('display', 'block');
						$('.hide_box #' + delete_item_id).css('display', 'block');
					}
					$( ui.item).remove();
				}
			}
			else {
				if ( droppedElementId  ) {
					$(ui.item).addClass('show_box_div');
					$(ui.item).find('td').addClass('show_box_td');
					// 保持していおいたidを、ドロップされた要素に設定
					if(/layout_item/.test(droppedElementId)){//レイアウト項目の場合は識別用IDをつける
						$( ui.item).attr('id', droppedElementId+'_'+ (+new Date()));
					}else{
						$( ui.item).attr( 'id', droppedElementId );
					}
					if ( /temp_/.test(droppedElementId) )
					{
						$(ui.item).find('button.screen_cond_edit').hide();
					}
					droppedElementId = null;
				}
			}
		}
	});
	
	enableDeleteButton();
	$('.layout_item_type_section').focus(function(){
		if($(this).hasClass('dummy_text')){
			$(this).css('color', '#000000').val('').removeClass('dummy_text');
		}
	}).blur(function(){
		if($(this).val().length == 0){
			$(this).css('color', '#888888').val('テキストを入力').addClass('dummy_text');
		}
	}).blur();
	
	function hasShowBox(dom_str, x, y) {
		var item = document.elementFromPoint( x, y );
		//console.log(item.outerHTML);
		if ( item.outerHTML === dom_str
			|| $(item).hasClass('show_box')
			|| $(item).hasClass('screen_cond_edit')
			|| $(item).hasClass('show_box_container')
			|| $(item).hasClass('show_box_div')
			|| $(item).hasClass('show_box_p')
			|| $(item).hasClass('show_box_tb')
			|| $(item).hasClass('show_box_tr')
			|| $(item).hasClass('show_box_td')
			|| $(item).hasClass('fa-pencil') )
		{
			return true;
		}
		return false;
	}

	/* カラムの一括追加ボタン */
	$(".add-all").click(function() {
		var $show_box = $(this).closest(".show_box_container").find(".show_box");
		var $hide_box = $(".edit_screen_item .hide_box");
		
		$hide_box.children('div').each(function() {
			$this = $(this);
			if ( $this.is(":hidden") ) {
				return;
			}
			
			$show_box.append( $(this).clone() );
			$(this).hide();
			
			enableDeleteButton()
		});
	});
	
	/* カラムの一括削除ボタン */
	$(".del-all").click(function() {
		var $show_box = $(this).closest(".show_box_container").find(".show_box");
		
		$show_box.children('div').each(function() {
			if ( /temp_/.test($(this).attr('id')) )
			{
				$('.hide_box #' + $(this).attr('id')).show();
			}
			else {
				$('.hide_box #temp_' + $(this).attr('id')).show();
				$('.hide_box #temp_' + $(this).attr('id')).css('display', 'block');
			}
			$(this).remove();
		});
	});
	
	/* 各カラムの削除ボタンのイベントを登録 */
	function enableDeleteButton() {
		$("a.screen_close").unbind("click");
		$("a.screen_close").click(function(){
			var delete_item_id = $('input:hidden[name="setting_cond_item_id"]').val();
			if(/temp_/.test(delete_item_id)){//未保存の画面項目はそのまま処理
				$('.hide_box #' + delete_item_id).show();
			}else{
				$('.hide_box #temp_' + delete_item_id).show();
			}
			$('.screen_item_draft #' + $('input:hidden[name="setting_cond_item_id"]').val()).remove();
			$('#selScreenItem').modal('hide');
		});
	}
	
	
	// モーダル表示時
	$('#selScreenItem').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		var item_id = button.closest('div').attr('id');
		var item_name = button.attr("data-displayname");
		$('#displayname').text(item_name);
		
		if (/temp_/.test(item_id)) {//temp_を含む未登録項目の時、条件設定項目を隠す
			$(".item_condition_setting").hide();
		}else{
			$(".item_condition_setting").show();
		}
		
		$('input:hidden[name="setting_cond_item_id"]').val(item_id);
		
		//開いた項目にすでに設定が入っている場合は取得
		var selected_condition_target = $('.screen_item_draft #'+item_id).attr("data-condition_target");
		
		//対象のテーブルに紐づく項目を一式取得
		var table_name = $('input:hidden[name="table_info_name"]').val(); //テーブル名を取得
		var url_api = '<!--HP{$smarty.const.ADMIN_URL}HP-->'+'api/v1/objects/columns/?q=table_name:'+table_name;
		
		$.ajax({
			dataType: 'jsonp',
			url: url_api,
			success: function(data){
				$('select[name="condition_items"] > option').remove();
				$('select[name="condtion_items_options"] > option').remove();
				$('select[name="condition_items"]').append($('<option>').html('選択してください').val(""));
				$.each(data.data, function(i,item){
					if(item.system_column_flg == 0){
						$('select[name="condition_items"]').append($('<option>').html(item.column_visible_name).val(item.column_info_id).attr("data-form_type",item.form_type));
						if(item.input_field_options !== undefined && item.input_field_options != null && item.input_field_options != ""){//対象に選択肢要素があったら
							$.each(item.input_field_options, function(i2,item2){
								$('select[name="condtion_items_options"]').append($('<option>').html(item2.name).val(item2.value).attr("data-column_id",item.column_info_id));
							});
						}
					}
				});
				if(selected_condition_target !== undefined && selected_condition_target != null && selected_condition_target != ""){//条件が設定されている場合
					console.log(selected_condition_target);
					$('select[name="condition_items"]').val(selected_condition_target).change();
					
				}else{//条件未設定の場合
					//条件設定欄を一旦リセット
					condition_modal_reset();
				}
			}
		});
		
	});
	//条件対象項目選択時の条件値設定表示用処理
	$(document).on('change', 'select[name="condition_items"]', function () {
		//すでに設定済みの項目があるかを調べる
		var selected_condition_target_select = $('.screen_item_draft #'+$('input:hidden[name="setting_cond_item_id"]').val()).attr("data-condition_target_select");
		var input_condition_target_text = $('.screen_item_draft #'+$('input:hidden[name="setting_cond_item_id"]').val()).attr("data-condition_target_text");
		
		
		var condition_form_type = $('select[name="condition_items"] option:selected').attr('data-form_type');
		var condition_form_value = $('select[name="condition_items"]').val();
		$("#condition_select").hide();
		$('select[name="condition_select_value"] > option').remove();
		$("#condition_input").hide();
		$('input[name="condition_input_value"]').val("");
		if(condition_form_type == 3 || condition_form_type == 4 || condition_form_type == 5 || condition_form_type == 7){ //選択形式の場合
			$("#condition_select").show();
			$('select[name="condtion_items_options"] > option').each(function(i,item){
				if(item.dataset.column_id == condition_form_value){
					$('select[name="condition_select_value"]').append($('<option>').html(item.label).val(item.value));
				}
			});
			if(selected_condition_target_select !== undefined && selected_condition_target_select != null && selected_condition_target_select != ""){//すでに値が設定されている場合は選択済みにする
				$('select[name="condition_select_value"]').val(selected_condition_target_select);
			}
			
		}else if(condition_form_type == 1 || condition_form_type == 2 || condition_form_type == 6 || condition_form_type == 8 || condition_form_type == 9){
			$("#condition_input").show();
			if(input_condition_target_text !== undefined && input_condition_target_text != null && input_condition_target_text != ""){//すでに入力済みの場合値を入れる
				$('input[name="condition_input_value"]').val(input_condition_target_text);
			}
		}
	});
	
	//条件設定ボタン処理
	$("a#register_condition_setting").click(function(){
		var condition_target = $('select[name="condition_items"]').val(); //条件設定対象項目
		var condition_target_select = $('select[name="condition_select_value"]').val(); //条件設定対象項目
		var condition_target_text = $('input[name="condition_input_value"]').val();
		
		//対象のdivにdataを設定する
		$('.screen_item_draft #' + $('input:hidden[name="setting_cond_item_id"]').val()).attr('data-condition_target',condition_target);
		$('.screen_item_draft #' + $('input:hidden[name="setting_cond_item_id"]').val()).attr('data-condition_target_select',condition_target_select);
		$('.screen_item_draft #' + $('input:hidden[name="setting_cond_item_id"]').val()).attr('data-condition_target_text',condition_target_text);
		
		//モーダル内をリセット
		condition_modal_reset();
		
		//モーダルを閉じる
		$('#selScreenItem').modal('hide');
	});
	
	//条件設定欄を一旦リセットする処理
	function condition_modal_reset(){
		$("#condition_select").hide();
		$('select[name="condition_select_value"] > option').remove();
		$("#condition_input").hide();
		$('input[name="condition_input_value"]').val("");
	}
	
});
</script>
