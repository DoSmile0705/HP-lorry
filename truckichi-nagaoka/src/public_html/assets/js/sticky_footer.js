
$(function() {
    var btn = $('.footer_sp_btn_search');    
    btn.hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            btn.fadeIn();
        } else {
            btn.fadeOut();
        }
    });
});