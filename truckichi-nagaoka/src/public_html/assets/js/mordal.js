// ウィンドウを開く
//グローバル変数
var sX_syncerModal = 0 ;
var sY_syncerModal = 0 ;

function scrollposition(){
	//スクロール位置を記録する
	var dElm = document.documentElement , dBody = document.body;
	sX_syncerModal = dElm.scrollLeft || dBody.scrollLeft;	//現在位置のX座標
	sY_syncerModal = dElm.scrollTop || dBody.scrollTop;	//現在位置のY座標
}

$(function(){
$( '.js-modal-open' ).each( function() {
     $( this ).on( 'click', function() {
          var target = $( this ).data( 'target' );
          var modal = document.getElementById( target );
          scrollposition();
          $( modal ).fadeIn( 300 );
          document.body.style.overflow = "hidden";
          
          return false;
     });
});
});
$(function(){
// ウィンドウを閉じる
$( '.js-modal-close' ).on( 'click', function() {
    //スクロール位置を戻す
     window.scrollTo( sX_syncerModal , sY_syncerModal );
    $( '.js-modal' ).fadeOut( 300 );
    document.body.style.overflow = "visible";
    return false;
});
});