$(function() {
    $('.jsc_select_menu li').click(function() {
        var index = $('.jsc_select_menu li').index(this);
        $('.jsc_contents_group > li').css('display','none');
        $('.jsc_contents_group > li').eq(index).css('display','block');
        $('.jsc_select_menu li').removeClass('jsc_is_active');
        $(this).addClass('jsc_is_active')
    });
});

$(function() {
    $('.jsc_sp_select_menu li').click(function() {
        var index = $('.jsc_sp_select_menu li').index(this);
        $('.jsc_sp_contents_group > li').css('display','none');
        $('.jsc_sp_contents_group > li').eq(index).css('display','block');
        $('.jsc_sp_select_menu li').removeClass('jsc_is_active');
        $(this).addClass('jsc_is_active')
    });
});
