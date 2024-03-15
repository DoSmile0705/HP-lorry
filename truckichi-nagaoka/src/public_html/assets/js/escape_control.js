// 離脱防止ポップアップ
$(function () {
  // ポップアップは一度だけ表示する
  let popup_viewed = 0;
  function showEscapeControl() {
    if (!popup_viewed) {
      popup_viewed = true;
      $('.escape_control').addClass('_is_active');
    }
  }
  // 閉じるボタン
  $('.__close_escape_modal_btn').on('click', function() {
    $('.escape_control').removeClass('_is_active');
  });
  // 背景クリックでも閉じる
  $('.escape_control').on('click', function() {
    $(this).removeClass('_is_active');
  });
  // コンテンツ内クリックは抑止
  $('.escape_control_content').on('click', function(event) {
    event.stopPropagation();
  });
  // ウィンドウが非アクティブになったとき
  $(window).on('blur', function() {
    showEscapeControl();
  });
  // ウィンドウが非表示（タブ移動など）になったとき
  $(document).on('visibilitychange', function() {
    const state = document.visibilityState;
    if (state === 'hidden') {
      showEscapeControl();
    }
  });
  // マウスカーソルがウィンドウ外に出たとき
  $('html body').on('mouseleave', function(event) {
    // コンテンツエリアより上（ツールバーエリア）に移動したとき
    if (event.originalEvent.clientY <= 0) {
      showEscapeControl();
    }
  });
  // 「戻る」選択時
  let hash = location.hash;
  if (hash != '#!') {
    // history.replaceState(null, null, '#back');
    history.pushState(null, null, '#!');
  }
  $(window).on('popstate', function (e) {
    if (location.hash != '#!') {
      showEscapeControl();
    } 
    return;
  });
  $('.js_escape_avoid').on('click', function() {
    popup_viewed = true;
  });
});
