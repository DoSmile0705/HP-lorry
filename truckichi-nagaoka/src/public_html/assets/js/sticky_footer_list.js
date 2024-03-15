
$(function() {
  var stickyFooter = $('.jsc_sp_sticky_footer');
  stickyFooter.hide();
  $(window).scroll(function () {
      if ($(this).scrollTop() > 500) {
          stickyFooter.fadeIn();
      } else {
          stickyFooter.fadeOut();
      }
  });
});
