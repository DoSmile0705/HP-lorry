// JavaScript Document
$(function(){
let options = {
  autoplay: false,
  type: 'slide',
  rewind: true,
  speed: 300,
  // focus: 'center',
  // padding: '100px',
  perPage: 3,
  perMove: 1,
  direction: 'ttb',
  pagination: true,
  fixedWidth: '100%',
  height: '240px',
  arrows: false,
}
new Splide( '#float-hisotry-slider', options ).mount();
new Splide( '#float-favorite-slider', options ).mount();


// 閲覧履歴
$('.jsc_float_btn_history').click(function () {
  $(this).addClass('hide');
  $('.common_float_menu.history_wrap').addClass('show');
  return false;
});

$('.jsc_float_close_history').click(function () {
  $('.jsc_float_btn_history').removeClass('hide');
  $('.common_float_menu.history_wrap').removeClass('show');
  return false;
});


// 気になる！
$('.jsc_float_btn_favorite').click(function () {
  $(this).addClass('hide');
  $('.common_float_menu.favorite_wrap').addClass('show');
  return false;
});

$('.jsc_float_close_favorite').click(function () {
  $('.jsc_float_btn_favorite').removeClass('hide');
  $('.common_float_menu.favorite_wrap').removeClass('show');
  return false;
});

$(window).on('scroll', function () {
  if ($(window).innerWidth() > 768) {
    let changePoint = $(window).innerHeight() / 2;
    if ($(this).scrollTop() > changePoint) {
      $('.jsc_float_btn_history').removeClass('hide');
      $('.jsc_float_btn_favorite').removeClass('hide');
    } else {
      $('.jsc_float_btn_history').addClass('hide');
      $('.jsc_float_btn_favorite').addClass('hide');
      $('.common_float_menu.history_wrap').removeClass('show');
      $('.common_float_menu.favorite_wrap').removeClass('show');
    }
  }
});
});