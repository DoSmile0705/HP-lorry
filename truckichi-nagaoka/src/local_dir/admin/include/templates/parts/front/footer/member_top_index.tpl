<script>
//cookie取得
function getCookies(name){
    //登録済みcookieがあれば取得
    var cookies = document.cookie;
    var cookiesArray = cookies.split(';'); 
    for(var c of cookiesArray){ 
        var cArray = c.split('=');
        if( $.trim(cArray[0]) == name){
            var className = cArray[1];
            break;
        }
    }
    return className;
}

//閲覧済みのお知らせを保存
function getClickedNotice(){

var path="; path=/";
$('li[class*="notice_type"]').find("a").click(function(){
    var getType = $(this).parents("li").attr('class');
    var className = getCookies("className");
    //cookieがあれば
    if(className){
        //cookieを追加
        var add =$(this).attr("class");
        classNameAdd =":"+add;
        className=className+classNameAdd;
    }else{
        //cookieを設定
        var className = $(this).attr("class");
    }   
    if(className){
        document.cookie ='className='+className+path; 
    }
});
}

getClickedNotice();

</script>
<script type="text/javascript">

    $(function () {
        $(".pagination").pagination({
            items:   <!--HP{$contact_info_page}HP-->, //ページングの数
            displayedPages: 2,//表示したいページング要素数
            prevText:"＜ 前のページへ",
            nextText:"次のページへ ＞",
            cssStyle: 'light-theme',
            onPageClick: function (currentPageNumber) {
                showPage(currentPageNumber);
            }
        })
    });
    function showPage(currentPageNumber) {
        var page = "#page-" + currentPageNumber;
        $('.selection').hide();
        $(page).show();
    }

</script>
<script type="text/javascript">

	$(function() {
		$('.slide_item a').on('click', function() {
			$('.header_sp_btn').click();
		});

		$('.tab_class').css('border', '1px solid #cccccc');
        $('[name="tab_name"]:checked').next().css('backgroundColor', '#fff');
        $('[name="tab_name"]:checked').next().css('color', '#333');
		$('[name="tab_name"]').on('click', function() {
		   if($(this).prop("checked")){
			   $(this).next().css('backgroundColor', '#fff');
			   $(this).next().css('color', '#333');
			   $('[name="tab_name"]').not($(this)).next().css('backgroundColor', '#333');
			   $('[name="tab_name"]').not($(this)).next().css('color', '#fff');
		   }
		});

	});

</script>
<script src="/assets/js/float_menu_list.js"></script>
