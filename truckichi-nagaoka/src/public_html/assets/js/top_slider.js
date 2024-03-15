// JavaScript Document
  // objectFitImages();

$(document).ready(function(){
  let options = {
    autoplay: true,
    type: 'loop',
    interval: 5000,
    rewind: true,
    speed: 300,
    focus: 'center',
    padding: '100px',
    perPage: 1,
    perMove: 1,
    pagination: true,
    fixedWidth: '100%',
    arrows: true,
    breakpoints: {
      768: {
        padding: '0'
      }
    }
  }
  new Splide( '#top_splide_slider', options ).mount();
});




