// SNSシェア
$(function(){
    $('.jsc_modal_open').on('click',function(){
        $('.jsc_modal_detail_share').addClass('is_active');
        return false;
    });
    $('.jsc_modal_detail_share_close').on('click',function(){
        $('.jsc_modal_detail_share').removeClass('is_active');
        return false;
    });
});

// さらに詳細な条件へ
$(window).on('load resize', function(){
  var width = $(window).width();
  var devWidth = 768;
  if (width <= devWidth) {
    $('.jsc_modal_conditions_open').on('click',function(){
        $('.jsc_modal_conditons').fadeIn();
        return false;
    });
    $('.jsc_modal_conditions_close').on('click',function(){
        $('.jsc_modal_conditons').fadeOut();
        return false;
    });
  } else {
    $('.jsc_modal_conditons').css('display', 'none');
  }
});
