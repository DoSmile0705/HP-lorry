// JavaScript Document

$('.float_slider').slick({ 
    autoplay: false, 
    dots: true, 
    arrows: false,
  });


$('.float_menu .btn_close').on('click', function() {
  $(this).parent().fadeOut();
});



$(window).on("scroll", function() {
  if (2000 < $(this).scrollTop()) {
    $(".float_menu").css({
      opacity: "1",
    });
  } else {
    $(".float_menu").css({
      opacity: "0",
    });
  }
});


$(window).on("scroll", function() {
  documentHeight = $(document).height();
  scrollPosition = $(this).height() + $(this).scrollTop();
  footerHeight = $("#footer").innerHeight();

  if (documentHeight - scrollPosition <= footerHeight) {
    $(".float_menu").addClass("stop");
  } else {
    $(".float_menu").removeClass("stop");
  }
});













