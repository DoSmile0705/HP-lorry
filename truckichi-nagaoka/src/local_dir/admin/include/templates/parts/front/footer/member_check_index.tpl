<script type="text/javascript">
$('.bdrGrn').on('click', function(){
	$(this).prev('form').submit();
});

$('.uncheck-all').on('click', function(){
	$('input[name="manage_code[]"]').removeAttr('checked').prop('checked', false).change();	
});

$(function() {
    $('input:checkbox').change(function() {
        var cnt = $('input[name="manage_code[]"]:checked').length;
        $('span.checkboxcount').text('チェックした' + cnt + '台のトラックをまとめて');
		if($(this).prop("checked")){
			$(this).next().prop('checked', true);
		}else{
			$(this).next().prop('checked', false);
		}
    }).trigger('change');
});

function onClickContact(){
	var car_id_array = [];
	var manage_code_array = [];
	$('input[name="manage_code[]"]:checked').each(function(i){
      car_id_array.push($(this).next().val());
	  manage_code_array.push($(this).val());
    });
	
    if(car_id_array.length == 0 && manage_code_array.length == 0 ){
        return false;
    }else{
        window.location.href = '/contact/?manage_code='+manage_code_array.join(',')+'&car_id='+car_id_array.join(',');
    }
	
}
</script>
<script src="https://www.w3schools.com/lib/w3.js"></script>
<script src="/assets/js/accordion.js"></script>

    
