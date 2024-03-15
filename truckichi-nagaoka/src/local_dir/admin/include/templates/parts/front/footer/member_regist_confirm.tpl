<script type="text/javascript" src="/assets/front/js/front_form.js"></script>
<script src="/assets/js/mordal.js"></script>

<script>
$('input[name="type"]').on('change', changeType);
  changeType();

  function changeType(){
    if(
      $('input[name="type"]:checked').val() == '<!--HP{$smarty.const.MEMBER_TYPE_STORE}HP-->' ||
      $('input[name="type"]:checked').val() == '<!--HP{$smarty.const.MEMBER_TYPE_DEALER}HP-->'
    ){
      $('#detai_info').show();
      $('#detai_info_btn').show();
//      $('.front-form').valid();
  
    }else{
      $('#detai_info').hide();
      $('#detai_info_btn').hide();
    }
  }
</script>