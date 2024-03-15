// 768以下
$(function(){
if (window.matchMedia( "(max-width: 768px) and (min-width: 415px)" ).matches) {
	var position = $('#search2').offset().top;
	position -= 60;
	$('html,body').delay(1000).animate({scrollTop: position}, 0, 'swing');
}
});

// 414以下
$(function(){
if (window.matchMedia( "(max-width: 414px) and (min-width: 320px)" ).matches) {
	var position = $('#search2').offset().top;
	position -= 40;
	$('html,body').delay(1000).animate({scrollTop: position}, 0, 'swing');
}
});
