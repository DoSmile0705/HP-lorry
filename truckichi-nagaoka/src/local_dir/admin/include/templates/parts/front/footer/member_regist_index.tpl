<script type="text/javascript" src="/assets/front/js/regist_form.js"></script>
<script src="/assets/js/mordal.js"></script>
<script>

$('input[name="type"]').on('change', changeType);
$(document).ready(changeType);
$(window).resize(changeType);


  function changeType(){
    if(
      $('input[name="type"]:checked').val() == '<!--HP{$smarty.const.MEMBER_TYPE_STORE}HP-->' ||
      $('input[name="type"]:checked').val() == '<!--HP{$smarty.const.MEMBER_TYPE_DEALER}HP-->'
    ){
        if($('.pc_none').css('display') == 'none'){
            $('#detai_info').show();
        }else{
            $('#detai_info_btn').show();
            if($('#detai_info_btn').hasClass('is-open')){
                $('#detai_info').show();
            }
        }
//      $('.front-form').valid();
    }else{
        //一般の場合
      $('#detai_info').hide();
      $('#detai_info_btn').hide();
      $("#detai_info input").each(function(index) {
        $(this).val('');
        var elementName = $(this).attr('name');
        $('.is_error#' + elementName + '-error' ).remove();
        $(this).removeClass('is_error');
        $(this).removeClass('err_required');
        $('.form_error_message.' + elementName).remove();
      });
    }
  }
</script>
<script src="/assets/js/float_menu_list.js"></script>
