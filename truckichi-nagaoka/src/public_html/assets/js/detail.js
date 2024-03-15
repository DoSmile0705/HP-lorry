function alignGridBox() {
  let trans = 0;
  $('.detail_grid_align').each(function(i, grid) {
    $(grid).css('transform', 'none');
    if ($(window).innerWidth() > 768) {
      let prev = $(grid).prev('.detail_grid_container');
      if ($(prev).length) {
        let prev_actual_height = $(prev).children('.detail_grid_actual').innerHeight();
        let prev_offset = $(prev).offset();
        let my_offset = $(grid).offset();
        trans = my_offset.top - prev_offset.top - prev_actual_height;
        $(grid).css('transform', 'translateY(-'+ trans +'px)');
      }
    }
  });
  $('.detail_section_align').each(function (i, section){
    $(section).css('transform', 'none');
    if ($(window).innerWidth() > 768) {
      let prev = $(section).prev('.detail_section_align');
      if ($(prev).length) {
        let prev_base = $(prev).find('.detail_section_align_base');
        let prev_height = $(prev_base).innerHeight();
        let prev_offset= $(prev_base).offset();
        let my_offset = $(section).offset();
        trans = my_offset.top - prev_offset.top - prev_height;
        $(section).css('transform', 'translateY(-'+ trans +'px)');
      }
    }
  });
  $('main.main').css('height', 'auto');
  if ($(window).innerWidth() > 768) {
    let main_height = $('main.main').innerHeight();
    $('main.main').height(main_height - trans);
  }
}
$(function() {
  alignGridBox();
  $(window).on('resize', function() {alignGridBox();});
  let options = {
    autoplay: false,
    type: 'loop',
    rewind: true,
    speed: 300,
    perPage: 1,
    perMove: 1,
    fixedWidth: '100%',
    arrows: true,
    pagination: false,
    classes: {
      arrows: 'splide__arrows main_slider_arrows',
      arrow : 'splide__arrow main_slider_arrow',
      prev  : 'splide__arrow--prev main_slider_prev',
      next  : 'splide__arrow--next main_slider_next',
    }
  }
  let main_slide = new Splide( '#detail-main-slide', options );
  options = {
    autoplay: false,
    type: 'slide',
    rewind: false,
    speed: 300,
    // perPage: 6,
    perMove: 1,
    width: '100%',
    fixedWidth: '80px',
    fixedHeight: '60px',
    arrows: true,
    pagination: false,
    isNavigation: true,
    breakpoints: {
      768: {
        fixedWidth: '60px',
        fixedHeight: '45px',
      }
    },
    classes: {
      arrows: 'splide__arrows thumb_slider_arrows',
      arrow : 'splide__arrow thumb_slider_arrow',
      prev  : 'splide__arrow--prev thumb_slider_prev',
      next  : 'splide__arrow--next thumb_slider_next',
    }
  }
  let thumb_slide = new Splide( '#detail-thumb-slide', options );
  main_slide.sync(thumb_slide);
  main_slide.mount();
  thumb_slide.mount();
  //
  let lum_img = document.querySelectorAll(".luminous");
  if (lum_img.length) {
    // lum_img.forEach((img) => {new Luminous(img);});
    new LuminousGallery(lum_img);
  }

});
