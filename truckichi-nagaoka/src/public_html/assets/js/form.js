$(function () {
  $(".automatic_input").on("click", function () {
    AjaxZip3.zip2addr("zip", "", "address", "address");
  });
  $(".jsc_automatic_input_company").on("click", function () {
    AjaxZip3.zip2addr("company_zip", "", "company_address", "company_address");
  });
  $(".check_label_mail").on("click", function () {
    $(".label_mail").removeClass("optional").addClass("required");
    $(".label_tel").removeClass("required").addClass("optional");
    $('.form_box_email').removeClass('_invisible');
    $('.form_box_tel').addClass('_invisible');
    $('.form_box_email').find('input[name="mail"]').focus();
  });
  $(".check_label_tel").on("click", function () {
    $(".label_mail").removeClass("required").addClass("optional");
    $(".label_tel").removeClass("optional").addClass("required");
    $('.form_box_email').addClass('_invisible');
    $('.form_box_tel').removeClass('_invisible');
    $('.form_box_tel').find('input[name="tel"]').focus();
  });
  if ($('input[name="method_contact"]:checked').val() == undefined){
    if (window.matchMedia('(min-width:769px)').matches) {
      $('#check_mail').prop('checked', true);
      $('.form_box_tel').addClass('_invisible')
      $(".label_mail").removeClass("optional").addClass("required");
      $(".label_tel").removeClass("required").addClass("optional");
    } else {
      $('.form_box_email').addClass('_invisible');
      $('#check_phone').prop('checked', true);
      $(".label_mail").removeClass("required").addClass("optional");
      $(".label_tel").removeClass("optional").addClass("required");
    }
  }
  $(".js-acc-btn").on("click", function () {
    toggleAcc();
  });

  function toggleAcc() {
    if ($(".js-acc-btn").hasClass("is-open")) {
      hideAccContent();
    } else {
      showAccAontent();
    }
  }

  function hideAccContent() {
    $(".js-acc-content").slideUp();
    $(".js-acc-btn").removeClass("is-open");
  }

  function showAccAontent() {
    $(".js-acc-content").slideDown();
    $(".js-acc-btn").addClass("is-open");
  }
});

/* === 同意にチェック入れると押せるようになるボタン === */
$(function() {
  if ( $('.check_privacy_input').prop('checked') == false ) {
  $('input[type=submit].btnSubmit').prop('disabled', true);
  }
  $('.check_privacy_input').on('click', function() {
    $('.btn_square_green').toggleClass('nocheck');
    if ( $(this).prop('checked') == false ) {
      $('input[type=submit].btnSubmit').prop('disabled', true);
    } else {
      $('input[type=submit].btnSubmit').prop('disabled', false);
    }
  });
});
