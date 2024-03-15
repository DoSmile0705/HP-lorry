// スライドメニュー
$(function(){
$(".jsc_slide").on('click', function() {
  $(this).next().slideToggle();
  $(this).toggleClass('open');
});
});
$('.jsc_slide_btn').on('click', function() {
  $(this).closest('.slide_parent').find('.slide_item').slideToggle();
  $(this).closest('.slide_parent').toggleClass('slide_collapsed');
  $(this).toggleClass('btn_open');
});

$(window).on('load resize orientationchange', function(){
    $('.detail_box').each(function() {
        var detail_ttl = $(this).children('.ttl_link_wrap').innerHeight();
        var detail_txt = $(this).innerHeight();
        var box_height = detail_txt - detail_ttl;
        if (window.matchMedia( "(max-width: 768px)" ).matches) {
          $(this).children('.new_detail').css('height', '' );
        } else {
          $(this).children('.new_detail').css('height', box_height + 'px' );
        }
   });

   $('.leftBox').each(function() {
    var detail_ttl = $(this).children('.browsing_btn_service').outerHeight();
    var detail_txt = $(this).parent('.qaWrap_item').innerHeight();
    var box_height = detail_txt - detail_ttl;
    if (window.matchMedia( "(max-width: 768px)" ).matches) {
//      $(this).children('.leftBox_img').css('height', '' );
      $(this).children('.browsing_btn_service').css('width', '' );
    } else {
//      $(this).children('.leftBox_img').css('height', box_height + 'px' );
      $(this).children('.browsing_btn_service').css('width', $(this).width() + 'px' );
    }
  });

});

// $(window).resize(function(){
//     var w = $(window).width();
//     var x = 768;
//     if (w >= x) {
//         $('.footer_search .slide_item').css({
//             display: 'block'
//         });
//     } else {
//         $('.footer_search .slide_item').css({
//             display: 'none'
//         });
//     }
// });

// header
/* $(window).on('load resize orientationchange', function(){
    var height=$("header").height();
      if ($(window).innerWidth() <= 768) {
        $("body").css("margin-top", height );
      } else {
        $("body").css("margin-top", '' );
      }
}); */

$(function () {
  var changePoint = 100, isSmall = false;
  $(window).on('scroll', function () {
    if ($(this).scrollTop() > changePoint) {
      if ($(window).width() <= 768) {
        $('header').addClass('is-small');
        isSmall = true;
      }
    } else {
      if (!$('body').hasClass('is-fixed')) {
        $('header').removeClass('is-small');
        isSmall = false;
      }
    }
  });
  var scrollPos = 0, isOpen = false;
  $('.js-sp-toggle-menu').on('click', function () {
    if (!isOpen) {
      scrollPos = $(window).scrollTop();
      $(this).addClass('is-open');
      $('.header_sp_nav').addClass('is-open');
      if (!isSmall) {
        $(this).children('.nav_txt').text('閉じる');
      }
      $('body').addClass('is-fixed');
      isOpen = true;
    } else {
      $(this).removeClass('is-open');
      $('.header_sp_nav').removeClass('is-open');
      if (!isSmall) {
        $(this).children('.nav_txt').text('メニュー');
      }
      $('body').removeClass('is-fixed');
      $(window).scrollTop(scrollPos);
      isOpen = false;
    }
  });
});
$(function(){
  $('.footer_sp_btn_search_close').on('click', function(){
    $('.footer_sp_btn_search').addClass('is-hidden');
  });
});
//画像幅750pxで画像の末尾_pcを_spに切り替える ※Windowリサイズ対応
/**
$(window).on('load resize', function(){
    //windowの幅をxに代入
    var x = $(window).width();
    //windowの分岐幅をyに代入
    var y = 768;
    if (x <= y) {
    $('img').each(function(){
      $(this).attr('src',$(this).attr('src').replace('_pc.', '_sp.'));
    });
  }else{
    $('img').each(function(){
      $(this).attr('src',$(this).attr('src').replace('_sp.', '_pc.'));
    });
  }
});
 */
$(".btn_add").on('click', function() {
  $(this).children(".ico_add").toggleClass("clicked");
});



// トップに戻る
$(function() {
  var appear = false;
  var pagetop = $('#page_top');
  $(window).on('scroll', function () {
    if ($(this).scrollTop() > 400) {
      if (appear == false) {
        appear = true;
        if (window.matchMedia( "(max-width: 768px)" ).matches) {
          pagetop.stop().animate({
            'bottom': '20vw'
          }, 300);
        } else {
          pagetop.stop().animate({
            'bottom': '50px'
          }, 300);
        }
      }
    } else {
      if (appear) {
        appear = false;
        pagetop.stop().animate({
          'bottom': '-75px'
        }, 300);
      }
    }
  });
});

// お知らせ部分のスライド
$(function(){
    $(".jsc_slide_info").on('click', function() {
      $(this).next().slideToggle();
    });
  });

// ページ内スクロール
/* $(function(){
  $('a[href^="#"]').click(function(){
    let speed = 500;
    let href= $(this).attr("href");
    let target = $(href == "#" || href == "" ? 'html' : href);
    let position = target.offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
}); */
jQuery(function(){
  var windowWidth = $(window).width();
  var windowSm = 768; // スマホに切り替わる横幅
    if ((768 >= windowWidth)&&(415 <= windowWidth)) {
     var headerHeight = 60; // スマホのheaderの高さ
    } else if ((414 >= windowWidth)&&(320 <= windowWidth)) {
     var headerHeight = 40; // スマホのheaderの高さ
    } else {
     var headerHeight = 0; // pcのheaderの高さ
    }
    jQuery('a[href^="#"]').click(function() {
    var speed = 500;
    var href= jQuery(this).attr("href");
    var target = jQuery(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top-headerHeight;
    jQuery('body,html').animate({scrollTop:position}, speed, 'swing');
    return false;
   });
});
// スマホとPCで判別して文言を変更する
$(function(){
var userAgent = window.navigator.userAgent.toLowerCase();
var sp_txt = document.getElementsByClassName("sp_txt");
var pc_txt = document.getElementsByClassName("pc_txt");

if (userAgent.indexOf('iphone') > 0
|| userAgent.indexOf('ipad') > 0
|| userAgent.indexOf('android') > 0 ) {
  // スマホの場合

  if(sp_txt[0]){ //コンソールエラーになるため確認中
    sp_txt[0].classList.add("spOnly");
  }
  if(pc_txt[0] && pc_txt[0].classList.contains('pcOnly')){//コンソールエラーになるため確認中
    pc_txt[0].classList.remove("pcOnly");
  }
}else{
  // PCの場合
  if(pc_txt[0]){//コンソールエラーになるため確認中
    pc_txt[0].classList.add("pcOnly");
  }
  if(sp_txt[0] && sp_txt[0].classList.contains('spOnly')){//コンソールエラーになるため確認中
    sp_txt[0].classList.remove("spOnly");
  }
}
});

// カレンダークリア
function clearCalendar(obj){
  $('#'+obj).val('');
}