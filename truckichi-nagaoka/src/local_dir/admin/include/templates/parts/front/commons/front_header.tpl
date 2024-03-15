<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">

<!--HP{if empty($meta_title) && empty($meta_description) && empty($meta_keywords)}HP-->
  <!--HP{if !empty($path_meta)}HP-->
    <!--HP{include file="$path_meta"}HP-->
  <!--HP{/if}HP-->
<!--HP{else}HP-->
    <title> <!--HP{$meta_title}HP--> </title>
    <meta name="description" content="<!--HP{$meta_description}HP-->">
    <meta name="keywords" content="<!--HP{$meta_keywords}HP-->">
    <meta property="og:title" content="<!--HP{$meta_title}HP-->" />
    <meta property="og:description" content="<!--HP{$meta_description}HP-->" />
<!--HP{/if}HP-->
    <meta property="og:url" content="<!--HP{$meta_og_url}HP-->" />
    <meta property="og:type" content="<!--HP{$meta_og_type}HP-->">
    <meta property="og:image" content="<!--HP{$meta_og_image}HP-->">

    <meta name="format-detection" content="email=no,telephone=no,address=no">
    <link rel="shortcut icon" type="image/vnd.microsoft.icon" href="/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500;700&family=Roboto:wght@700&display=swap" rel="stylesheet">
    <!--
    <link rel="stylesheet" href="/assets/css/dist/vendor/slick/slick.css">
    <link rel="stylesheet" href="/assets/css/dist/vendor/slick/slick-theme.css">
    <link rel="stylesheet" href="/assets/css/src/base/base.css">
    <link rel="stylesheet" href="/assets/css/dist/common.css">
    <link rel="stylesheet" href="/assets/css/dist/search.css">
    <link rel="stylesheet" href="/assets/css/dist/form.css">
    -->
    <link rel="stylesheet" href="/assets/css/style.css">
    <script src="/assets/js/jquery-3.4.1.min.js"></script>
    <!--
    <script type="text/javascript" src="/assets/js/slick.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/object-fit-images/3.2.3/ofi.js"></script>
    -->
    <!--HP{$custom_header}HP-->
<!--HP{if !empty($path_css)}HP-->
    <!--HP{include file="custom_common/css.tpl"}HP-->
    <!--HP{include file="$path_css"}HP-->
<!--HP{/if}HP-->
    <!--HP{$smarty.const.GA_TAG}HP-->
</head>
<!--HP{if empty($smarty.const.PAGE_INFO_LIST[$page_url].body_class)}HP-->
<body>
<!--HP{else}HP-->
<body class="<!--HP{$smarty.const.PAGE_INFO_LIST[$page_url].body_class}HP-->">
<!--HP{/if}HP-->
  <!--HP{$smarty.const.GA_TAG_BODY}HP-->
  <!--HP{if $smarty.const.PAGE_INFO_LIST[$page_url].header !== false}HP-->
    <header class="header">
      <input type="checkbox" id="toggle-slide-menu" style="display: none;">
      <div class="header_navigation">
        <div class="container">
          <div class="header_wrap">
            <div class="header_logo">
              <h1><a href="<!--HP{$smarty.const.SITE_TOP_URL}HP-->" class="header_logo_wrap"><img src="/assets/img/common/logo.webp" alt="トラック市" width="215" height="35" decoding="async" loading="eager" class="header_logo_img"><span class="header_logo_txt">長岡店</span></a></h1>
            </div>
            <div class="header_mypage_menu">
              <!-- ログイン時ここから -->
              <!--
              <div class="header_mypage_menu_user header_sp_none">
                <img src="/assets/img/common/header_ico_user.png" alt="" width="16" height="17" decoding="async" loading="eager" class="header_mypage_menu_userIcon">
                <span class="header_mypage_menu_userName">長岡太郎様</span>
              </div>
              -->
              <!-- ログイン時ここまで -->
              <!-- ログアウト時ここから -->
              
              <div class="header_mypage_menu_invite header_sp_none">
                <button class="header_mypage_menu_inviteBtn color_green"><a href="/member/guide/ " class="header_mypage_menu_inviteBtnWrap">
                  <span class="header_mypage_menu_inviteBtnHead">会員<br>特典</span>
                  <p class="header_mypage_menu_inviteBtnText">気になるトラックの<br>値下げ情報をお知らせ！</p>
                  <span class="common_link_arrow arrow_green"></span>
                </a></button>
              </div>
              
              <!-- ログアウト時ここまで -->
              <ul class="header_mypage_menu_btn">
                <!-- ログイン時ここから -->
                <!--
                <li class="header_mypage_menu_btnItem color_green header_sp_none"><a href="/member/top/" class="header_mypage_menu_btnItemWrap">
                  <img src="/assets/img/common/header_ico_mypage.png" alt="" width="20" height="20" decoding="async" loading="eager" class="header_mypage_menu_btnItemIcon">
                  <span class="header_mypage_menu_btnItemText">マイページ</span>
                </a></li>
                <li class="header_mypage_menu_btnItem color_green header_sp_none"><a href="/member/logout/" class="header_mypage_menu_btnItemWrap">
                  <img src="/assets/img/common/header_ico_logout.png" alt="" width="20" height="20" decoding="async" loading="eager" class="header_mypage_menu_btnItemIcon">
                  <span class="header_mypage_menu_btnItemText">ログアウト</span>
                </a></li>
                -->
                <!-- ログイン時ここまで -->
                <!-- ログアウト時ここから -->
                
                <li class="header_mypage_menu_btnItem color_green header_sp_none"><a href="/member/login/" class="header_mypage_menu_btnItemWrap">
                  <img src="/assets/img/common/header_ico_login.png" alt="" width="20" height="20" decoding="async" loading="eager" class="header_mypage_menu_btnItemIcon">
                  <span class="header_mypage_menu_btnItemText">ログイン</span>
                </a></li>
                
                <!-- ログアウト時ここまで -->
                <li class="header_mypage_menu_btnItem color_green"><a href="/member/browsing_history/" class="header_mypage_menu_btnItemWrap">
                  <img src="/assets/img/common/header_ico_history.png" alt="" width="20" height="20" decoding="async" loading="eager" class="header_mypage_menu_btnItemIcon">
                  <span class="header_mypage_menu_btnItemText">閲覧履歴</span>
                </a></li>
                <li class="header_mypage_menu_btnItem color_green"><a href="/member/check/" class="header_mypage_menu_btnItemWrap">
                  <img src="/assets/img/common/common_ico_favorite.png" alt="" width="20" height="20" decoding="async" loading="eager" class="header_mypage_menu_btnItemIcon">
                  <span class="header_mypage_menu_btnItemText">気になる!</span>
                </a></li>
              </ul>
            </div>
            <div class="header_contact header_sp_none">
              <div class="common_contact_tel"><a href="tel:0120-864-109" class="common_contact_tel_wrap">
                <p class="common_contact_telCatch color_green">ハローよい トラック</p>
                <p class="common_contact_telNo"><img src="/assets/img/common/ico_telephone_green.png" alt="" width="18" height="23" decoding="async" loading="eager" class="common_contact_telNoIcon"><span class="common_contact_telNoText color_green">0120-864-109</span></p>
                <img src="/assets/img/common/common_open_hour.svg" alt="" width="212" height="10" decoding="async" loading="eager" class="common_contact_telHour">
              </a></div>
            </div>
            <div class="header_sp_btn header_pc_none">
              <label for="toggle-slide-menu" class="header_sp_btnLabel _menu">
                <span class="header_sp_btnBar">
                  <span class="header_sp_btnBarLine line1"></span>
                  <span class="header_sp_btnBarLine line2"></span>
                  <span class="header_sp_btnBarLine line3"></span>
                </span>
                <span class="header_sp_btnText">メニュー</span>
              </label>
            </div>
          </div>
        </div>
      </div>
      <div class="header_slide_menu header_pc_none">
        <div class="header_slide_menu_container">
          <!-- ログイン時ここから -->
          <!--
          <div class="header_slide_menu_welcome"><div class="container">
            <div class="header_slide_menu_member"><span class="header_slide_menu_memberName">●●●●●●●●</span><span>様</span></div>
          </div></div>
          -->
          <!-- ログイン時ここまで -->
          <!-- ログアウト時ここから -->
          
          <div class="header_slide_menu_welcome"><div class="container">
            <div class="header_slide_menu_guest">
              <p class="header_slide_menu_guestName">ゲスト 様</p>
              <div class="header_slide_menu_guestBtns">
                <button class="header_slide_menu_guestBtns_btn btn_green"><a href="/member/login/" class="header_slide_menu_guestBtns_btn_link"><img src="/assets/img/common/header_ico_login_white.png" alt="" width="20" height="20" decoding="async" class="btn_icon"><span class="btn_text">ログイン</span></a></button>
                <button class="header_slide_menu_guestBtns_btn btn_white"><a href="/member/guide/" class="header_slide_menu_guestBtns_btn_link">新規会員登録</a></button>
              </div>
            </div>
          </div></div>
          
          <!-- ログアウト時ここまで -->
          <!--HP{include file="parts/front/commons/sp_nav.tpl"}HP-->
          <div class="header_slide_menuBtns"><div class="container header_slide_menuBtnsWrap">
            <!-- ログイン時ここから -->
            <!--
            <button class="header_slide_menuBtns_btn btn_white"><a href="/member/logout/" class="header_slide_menuBtns_btn_link"><img src="/assets/img/common/header_ico_logout.png" alt="" width="20" height="20" decoding="async" class="btn_icon"><span class="btn_text">ログアウト</span></a></button>
            -->
            <!-- ログイン時ここまで -->
            <button class="header_slide_menuBtns_btn btn_white  header_slide_menu_btn"><a href="/" class="header_slide_menuBtns_btn_link"><img src="/assets/img/common/header_ico_home.png" alt="" width="20" height="20" decoding="async" class="btn_icon"><span class="btn_text">ホームに戻る</span></a></button>
          </div></div>
        </div>
      </div>
      <nav  class="header_menu header_sp_none"><div class="container header_menu_container">
        <ul class="header_menu_list">
          <li class="header_menu_item"><a href="/stock/list/" class="header_menu_itemWrap"><span>中古トラック販売</span></a></li>
          <li class="header_menu_item"><a href="/kaitori/" class="header_menu_itemWrap"><span>トラックの買取</span></a></li>
          <li class="header_menu_item"><a href="/inspection/" class="header_menu_itemWrap"><span>車検整備について</span></a></li>
          <li class="header_menu_item"><a href="/access/" class="header_menu_itemWrap"><span>店舗案内</span></a></li>
          <li class="header_menu_item"><a href="/faq_salle/" class="header_menu_itemWrap"><span>よくある質問<br><small class="menu_item_small">(中古トラックをお求めの方へ)</small></span></a></li>
        </ul>
      </div></nav>
    </header>
<!--HP{/if}HP-->
    <main class="main">