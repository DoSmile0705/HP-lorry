<script type="text/javascript">
var clearFlag = false;

function clearConditions() {
	$('#search-panel-footer input[name="word"]').val('');
	$('#search-panel-footer input[name="price_min"]').val('');
	$('#search-panel-footer input[name="price_max"]').val('');
	// $('input[name="shape[]"]').prop('checked', false);
	// $('input[name="shape[]"]').closest('label').removeClass('checked');
	$('#search-panel-footer select').val('');
	$('#search-panel-footer select[name="name"]').empty();
	$('#search-panel-footer select[name="name"]').append(
		$('<option />')
			.val('')
			.text('メーカーを選択')
	);
	$('#search-panel-footer input[type="checkbox"]').prop('checked', false);

	$('#search-panel-footer select[name="name"]').attr('disabled', 'disabled').closest('span').hide();

	clearFlag = true;
	return false;
}
var carNameJson = <!--HP{$carNameList|@json_encode}HP-->;

$('#search-panel-header-maker').on('change', changeMaker);

function changeMaker(){
	var makerVal = $('#search-panel-header-maker').val();
	$('#search-panel-header-name').empty();
	if (typeof carNameJson[makerVal] !== 'undefined') {
		var result = carNameJson[makerVal];
		for(let k in result){
			var item = result[k];
			var key = '';
			if (k == '<!--HP{if isset($smarty.get.name)}HP--><!--HP{$smarty.get.name}HP--><!--HP{/if}HP-->' && clearFlag == false) {
				var opt = $('<option />').val(k).text(item).prop('selected', true);
			}else{
				var opt = $('<option />').val(k).text(item);
			}
			$('#search-panel-header-name').append(opt);
		}
		// $('#search-panel-header .search_car_name').removeClass('unselect');
		$('#search-panel-header-name').removeAttr('disabled').closest('span').show();
	}else{
		$('#search-panel-header-name').append(
			$('<option />')
				.val('')
				.text('メーカーを選択')
		);
		$('#search-panel-header-name').attr('disabled', 'disabled').closest('span').hide();
		// $('#search-panel-header .search_car_name').addClass('unselect');
	}
}

changeMaker();

$(function(){
var maker_id = $('#search-panel-header select[name="maker"]').val();
var brand_id = $('#search-panel-header select[name="name"]').val();
	if(maker_id != "" &&
		brand_id == ""){
		$('#search-panel-header select[name="maker"]').val("");
	}
});

$('#search-detail-more').on('click', function() {
	if ($(window).innerWidth() > 768) {
		$('#search-detail-expand').slideToggle();
		$(this).toggleClass('btn_open');
	} else {
		$('#search-detail-basic').slideToggle();
		$('#search-detail-basic').toggleClass('is_open');
		$(this).toggleClass('btn_open');
	}
	if ($(this).hasClass('btn_open')) {
		$(this).children('.searchDetail_form_moreTxt').text('閉じる');
	} else {
		$(this).children('.searchDetail_form_moreTxt').text('さらに詳細な条件へ');
	}
	return false;
});

$('#searchResultCondition-sort').on('click', function() {
	let panel = $(this).closest('.searchResultCondition').find('.searchResultCondition_spSortPanel');
	$(this).addClass('is_active');
	$(panel).slideDown();
	return false;
});
$('#searchResultCondition-spsort-close').on('click', function() {
	let panel = $(this).closest('.searchResultCondition_spSortPanel');
	let btn = $(this).closest('.searchResultCondition').find('#searchResultCondition-sort');
	$(btn).removeClass('is_active');
	$(panel).slideUp();
	return false;
});

$('.searchResultControl_tagWord').on('click', function (){
	$(this).remove();
	$('input[name=word]').val('');
	var wordVal = '';
	$.each($(".searchResultControl_tagWord"), function(i, val) {
		var word = $(val).text();
		if (wordVal!=''){
			wordVal = wordVal + ' ';
		}
		wordVal = wordVal + $.trim(word.replace('×',''));
	});
	$('input[name=word]').val(wordVal);
});

</script>