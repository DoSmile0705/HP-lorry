
$("#btn_slide1").click(function() {
    if( $("#btn_slide1").prop('checked')){
      $('.plan_print_style').css('display','flex');
    }else{
      $('.plan_print_style').css('display','none');
    }
  });

$("#btn_slide2").click(function() {
    if( $("#btn_slide2").prop('checked')){
      $('.jsc_print_style').css('display','flex');
    }else{
      $('.jsc_print_style').css('display','none');
//      $('.plan_print_style').css('display','none');
//      $("#btn_slide1").prop('checked', false);
    }
  });
