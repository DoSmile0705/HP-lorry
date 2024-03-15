$(function () {
  $(".jsc_top_search_slide").on("click", function () {
    $(".jsc_top_search_slide_contents").stop().slideToggle();
    $(this).toggleClass("on");
  });
});



$(function () {
  $(".buy_sec_ttl, .js_accordion_header").not(".js-no-event").on("click", function () {
    $(this).next().slideToggle();
    $(this).toggleClass("open");
  });
});
