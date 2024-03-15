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
$('dl[class*="notice_type"]').find("a").click(function(){
    var getType = $(this).parents("dl").attr('class');
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