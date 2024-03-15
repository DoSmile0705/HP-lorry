$(function(){
  $(".jsc_sp_sort_btn").on("click", function() {
    $(".sp_sort_panel").stop().slideToggle();
    $(".sp_sort_btn").toggleClass('is_active');
  });
});
