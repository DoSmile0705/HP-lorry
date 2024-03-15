<div class="common_breadcrumb sp_none">
  <div class="container">
    <ol class="common_breadcrumb_list">
      <li class="common_breadcrumb_listItem"><a href="<!--HP{$smarty.const.SITE_TOP_URL}HP-->" class="ico_bc_home common_breadcrumb_listItemLink">中古トラックのトラック市長岡店</a></li>
      <li class="common_breadcrumb_listItem"><a href="/stock/list/" class="common_breadcrumb_listItemLink">中古トラック全在庫（新古車・未使用車）</a></li>
<!--HP{if !empty($searchText)||$listMode=='history'||$listMode=='new'}HP-->
      <li class="common_breadcrumb_listItem"><a href="#" class="common_breadcrumb_listItemLink"><!--HP{if $listMode=='history'}HP-->閲覧したトラック<!--HP{elseif $listMode=='new'}HP-->新着入庫トラック<!--HP{else}HP-->検索結果<!--HP{/if}HP--></a></li>
<!--HP{/if}HP-->
<!--HP{if !empty($categoryOption[$smarty.get.shape])}HP-->
      <li class="common_breadcrumb_listItem"><a href="/stock/list/?shape=<!--HP{$smarty.get.shape}HP-->" class="common_breadcrumb_listItemLink"><!--HP{$categoryOption[$smarty.get.shape]|escape}HP--></a></li>
<!--HP{/if}HP-->
<!--HP{if !empty($categoryOption[$smarty.get.maker])}HP-->
      <li class="common_breadcrumb_listItem"><a href="/stock/list/?maker=<!--HP{$smarty.get.maker}HP-->" class="common_breadcrumb_listItemLink"><!--HP{$categoryOption[$smarty.get.maker]|escape}HP--></a></li>
<!--HP{/if}HP-->
<!--HP{if !empty($categoryOption[$smarty.get.size])}HP-->
      <li class="common_breadcrumb_listItem"><a href="/stock/list/?size=<!--HP{$smarty.get.size}HP-->" class="common_breadcrumb_listItemLink"><!--HP{$categoryOption[$smarty.get.size]|escape}HP--></a></li>
<!--HP{/if}HP-->
    </ol>
  </div>
</div>
<div class="container">
  <h1 class="common_page_h1"><span class="common_page_h1_en">Truck List</span><span class="common_page_h1_ja">中古トラック一覧</span></h1>
</div>
<!--HP{include file='stock/search_parts_header.tpl'}HP-->
<!--HP{include file='stock/search_parts_footer.tpl'}HP-->
<div class="searchResultControl">
  <div class="container">
    <div class="searchResultControl_tagPager">
      <div class="searchResultControl_tag">
        <div class="searchResultControl_tagBlock">
          <span class="searchResultControl_tagTtl">検索キーワード：</span>
          <ul class="searchResultControl_tagList">
            <!-- 検索ワード数分ループ ここから-->
            <li class="searchResultControl_tagWord"><span>クレーン車</span><small>×</small></li>
            <li class="searchResultControl_tagWord"><span>いすゞ</span><small>×</small></li>
            <li class="searchResultControl_tagWord"><span>エルフ</span><small>×</small></li>
            <!-- 検索ワード数分ループ ここまで-->
          </ul>
        </div>
      </div>
      <div class="searchResultControl_pager">
        <ol class="searchResultControl_pagerList">
          <!-- 検索結果ページャー 
            -- リンク有効ページは<a>タグで囲う
            -- リンク無効ページは<li>に'page_disable'クラスをつけてください
            -- 現在ページは<li>に'page_current'クラスをつけてください
            -- ページ数が4ページ以上になる場合は4ページ目以降の<li>に'sp_none'クラスをつけてください
            -- ページ数が4ページ以上になる場合は4ページ目以降に<li class='page_continue pc_none'>を表示してください
          -->
          <li class="searchResultControl_pager_nav page_disable"><span class="searchResultControl_pager_arrow page_prev"></span></li>
          <li class="searchResultControl_pager_skip page_disable"><span>最初</span></li>
          <!-- ページ数分ループ（最大５ページ） ここから-->
          <li class="searchResultControl_pager_page page_current"><span>1</span></li>
          <li class="searchResultControl_pager_page "><a href="/stock/list/?" class="searchResultControl_pager_link"><span>2</span></a></li>
          <li class="searchResultControl_pager_page "><a href="/stock/list/?" class="searchResultControl_pager_link"><span>3</span></a></li>
          <li class="searchResultControl_pager_page sp_none"><a href="/stock/list/?" class="searchResultControl_pager_link"><span>4</span></a></li>
          <li class="searchResultControl_pager_page sp_none"><a href="/stock/list/?" class="searchResultControl_pager_link"><span>5</span></a></li>
          <!-- ページ数分ループ ここまで-->
          <li class="searchResultControl_pager_page page_continue pc_none"><span>...</span></li>
          <li class="searchResultControl_pager_skip "><a href="/stock/list/?" class="searchResultControl_pager_link"><span>最後</span></a></li>
          <li class="searchResultControl_pager_nav "><a href="/stock/list/?" class="searchResultControl_pager_link"><span class="searchResultControl_pager_arrow page_next"></span></a></li>
        </ol>
      </div>
    </div>
  </div>
</div>

<section class="searchResultContainer">
  <div class="searchResultCondition">
    <div class="searchResultCondition_hit">
      <p class="searchResultCondition_hit_num"><em class="searchResultCondition_hit_numEm">33</em><span>台</span></p>
    </div>
    <div class="searchResultCondition_sortPanel">
      <label class="searchResultCondition_sortPanel_label"><img src="/assets/img/common/common_ico_sort.png" alt="" width="20" height="20" class="searchResultCondition_sortPanel_labelIco"><span  class="searchResultCondition_sortPanel_labelTxt">並び替え</span></label>
      <!-- 現在選択中の並び替え条件の<form>に 'searchResultCondition_sortPanel_current' クラスをつけてください -->
      <div class="searchResultCondition_sortPanel_form">
        <div class="searchResultCondition_sortPanel_wrap">
          <form id="sortRecommend" action="" method="get" class="">
            <input type="hidden" name="sort" value="recommend">
            <a href="javascript:sortRecommend.submit()" class="searchResultCondition_sortPanel_btn">おすすめ順</a>
          </form>
          <form id="sortPopular" action="" method="get" class="searchResultCondition_sortPanel_current">
            <input type="hidden" name="sort" value="popular">
            <a href="javascript:sortPopular.submit()" class="searchResultCondition_sortPanel_btn">人気順</a>
          </form>
        </div>
        <div class="searchResultCondition_sortPanel_wrap">
          <form id="sortModelYearAsc" action="" method="get" class="">
            <input type="hidden" name="sort" value="model_year">
            <input type="hidden" name="order" value="asc">
            <a href="javascript:sortModelYearAsc.submit()" class="searchResultCondition_sortPanel_btn">年式：古い</a>
          </form>
          <form id="sortModelYearDesc" action="" method="get" class="">
            <input type="hidden" name="sort" value="model_year">
            <input type="hidden" name="order" value="desc">
            <a href="javascript:sortModelYearDesc.submit()" class="searchResultCondition_sortPanel_btn">年式：新しい</a>
          </form>
          <p class="searchResultCondition_sortPanel_type"><span class="searchResultCondition_sortPanel_typeSpan">年式順</span></p>
        </div>
        <div class="searchResultCondition_sortPanel_wrap">
          <form id="sortMileageAsc" action="" method="get" class="">
            <input type="hidden" name="sort" value="mileage">
            <input type="hidden" name="order" value="asc">
            <a href="javascript:sortMileageAsc.submit()" class="searchResultCondition_sortPanel_btn">走行距離：少ない</a>
          </form>
          <form id="sortMileageDesc" action="" method="get" class="">
            <input type="hidden" name="sort" value="mileage">
            <input type="hidden" name="order" value="desc">
            <a href="javascript:sortMileageDesc.submit()" class="searchResultCondition_sortPanel_btn">走行距離：多い</a>
          </form>
          <p class="searchResultCondition_sortPanel_type"><span class="searchResultCondition_sortPanel_typeSpan">走行距離順</span></p>
        </div>
        <div class="searchResultCondition_sortPanel_wrap">
          <form id="sortPriceAsc" action="" method="get" class="">
            <input type="hidden" name="sort" value="price">
            <input type="hidden" name="order" value="asc">
            <a href="javascript:sortPriceAsc.submit()" class="searchResultCondition_sortPanel_btn">価格：安い</a>
          </form>
          <form id="sortPriceDesc" action="" method="get" class="">
            <input type="hidden" name="sort" value="price">
            <input type="hidden" name="order" value="desc">
            <a href="javascript:sortPriceDesc.submit()" class="searchResultCondition_sortPanel_btn">価格：高い</a>
          </form>
          <p class="searchResultCondition_sortPanel_type"><span class="searchResultCondition_sortPanel_typeSpan">価格順</span></p>
        </div>
      </div>
    </div>
    <div class="searchResultCondition_spCtrl">
      <button id="searchResultCondition-reset" class="searchResultCondition_spCtrl_btn btn_green btn_no_shadow"><a href="#search-panel-header" class="searchResultCondition_spCtrl_btn_link">条件再設定</a></button>
      <button id="searchResultCondition-sort" class="searchResultCondition_spCtrl_btn btn_green btn_no_shadow "><a class="searchResultCondition_spCtrl_btn_link">並び替え</a></button>
    </div>
    <div class="searchResultCondition_spSortPanel">
      <div class="searchResultCondition_spSortPanel_inner">
        <div class="searchResultCondition_spSortPanel_wrap">
          <label class="searchResultCondition_spSortPanel_label">特徴</label>
          <form id="sortRecommend-sp" action="" method="get" class="searchResultCondition_spSortPanel_form">
            <input type="hidden" name="sort" value="recommend">
            <a href="javascript:sortRecommend-sp.submit()" class="searchResultCondition_sortPanel_btn">おすすめ順</a>
          </form>
          <form id="sortPopular-sp" action="" method="get" class="searchResultCondition_spSortPanel_form searchResultCondition_sortPanel_current">
            <input type="hidden" name="sort" value="popular">
            <a href="javascript:sortPopular-sp.submit()" class="searchResultCondition_sortPanel_btn">人気順</a>
          </form>
        </div>
        <div class="searchResultCondition_spSortPanel_wrap">
          <label class="searchResultCondition_spSortPanel_label">年式</label>
          <form id="sortModelYearAsc-sp" action="" method="get" class="searchResultCondition_spSortPanel_form">
            <input type="hidden" name="sort" value="model_year">
            <input type="hidden" name="order" value="asc">
            <a href="javascript:sortModelYearAsc-sp.submit()" class="searchResultCondition_sortPanel_btn">古い順</a>
          </form>
          <form id="sortModelYearDesc-sp" action="" method="get" class="searchResultCondition_spSortPanel_form">
            <input type="hidden" name="sort" value="model_year">
            <input type="hidden" name="order" value="desc">
            <a href="javascript:sortModelYearDesc-sp.submit()" class="searchResultCondition_sortPanel_btn">新しい順</a>
          </form>
        </div>
        <div class="searchResultCondition_spSortPanel_wrap">
          <label class="searchResultCondition_spSortPanel_label">走行距離</label>
          <form id="sortMileageAsc-sp" action="" method="get" class="searchResultCondition_spSortPanel_form">
            <input type="hidden" name="sort" value="mileage">
            <input type="hidden" name="order" value="asc">
            <a href="javascript:sortMileageAsc-sp.submit()" class="searchResultCondition_sortPanel_btn">少ない順</a>
          </form>
          <form id="sortMileageDesc-sp" action="" method="get" class="searchResultCondition_spSortPanel_form">
            <input type="hidden" name="sort" value="mileage">
            <input type="hidden" name="order" value="desc">
            <a href="javascript:sortMileageDesc-sp.submit()" class="searchResultCondition_sortPanel_btn">多い順</a>
          </form>
        </div>
        <div class="searchResultCondition_spSortPanel_wrap">
          <label class="searchResultCondition_spSortPanel_label">価格</label>
          <form id="sortPriceAsc-sp" action="" method="get" class="searchResultCondition_spSortPanel_form">
            <input type="hidden" name="sort" value="price">
            <input type="hidden" name="order" value="asc">
            <a href="javascript:sortPriceAsc-sp.submit()" class="searchResultCondition_sortPanel_btn">安い順</a>
          </form>
          <form id="sortPriceDesc-sp" action="" method="get" class="searchResultCondition_spSortPanel_form">
            <input type="hidden" name="sort" value="price">
            <input type="hidden" name="order" value="desc">
            <a href="javascript:sortPriceDesc-sp.submit()" class="searchResultCondition_sortPanel_btn">高い順</a>
          </form>
        </div>
        <a id="searchResultCondition-spsort-close" class="searchResultCondition_spSortPanel_close"><img src="/assets/img/common/common_ico_close.png" alt="" width="24" height="24" class="searchResultCondition_spSortPanel_closeIco"><span class="searchResultCondition_spSortPanel_closeTxt">閉じる</span></a>
      </div>
    </div>
  </div>
  <div class="container">
    <p class="searchResultCondition_help"><a href="/contact/"><img src="/assets/img/common/common_ico_question.png" alt="HELP" width="18" height="18" class="searchResultCondition_helpIco"><span class="searchResultCondition_helpTxt">お探しの車が見つからなかった場合は？</span></a></p>
  </div>
  <div class="container">
    <h2 class="searchResultContainer_head">
      <p class="searchResultContainer_head_wrap">
        <img src="/assets/img/stock/stock_ico_truck.png" alt="<!--HP{if !empty($searchText)}HP-->"<!--HP{$searchText|trim|escape}HP-->"<!--HP{else}HP-->全て<!--HP{/if}HP-->の検索結果" width="25" height="15" class="searchResultContainer_head_icon">
        <span><!--HP{if !empty($searchText)}HP--><!--HP{$searchText|trim|escape}HP--><!--HP{elseif $listMode=='history'}HP-->閲覧したトラック<!--HP{elseif $listMode=='new'}HP-->新着入庫トラック<!--HP{else}HP-->全て<!--HP{/if}HP-->の検索結果</span>
      </p>
    </h2>
    <div class="searchResult">
      <!-- 検索結果ループここから（最大20件） -->
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1983_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1983_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
              <!-- 新入荷 -->
              <span class="searchResultVehicle_picture_flagTag tag_new">NEW</span>
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <!-- 非ログイン、一般ログイン時のラベルは「支払総額<br>（税込）」
              -- 業販ログイン時のラベルは「業販価格」
            -->
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id=1983"  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1984_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1984_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
              <!-- 新入荷 -->
              <span class="searchResultVehicle_picture_flagTag tag_new">NEW</span>
              <!-- おすすめ -->
              <span class="searchResultVehicle_picture_flagTag tag_rec">おすすめ</span>
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <!-- キャンペーン価格設定ありのとき、
              -- 'campaign_price'クラスを付けてください
             -->
            <p class="searchResultVehicle_price_amount campaign_price"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円
            <!-- キャンペーン価格設定ありのとき、
              -- 以下のlabelを表示してください
             -->
            <label class="searchResultVehicle_price_label label_campaign">キャンペーン価格</label>
            </p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1985_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1985_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
              <!-- 新入荷 -->
              <span class="searchResultVehicle_picture_flagTag tag_new">NEW</span>
              <!-- おすすめ -->
              <span class="searchResultVehicle_picture_flagTag tag_rec">おすすめ</span>
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <!-- 会員特価設定あり && ログイン済みのとき、
              -- 'member_price'クラスを付けてください
             -->
            <p class="searchResultVehicle_price_amount member_price"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円
            <!-- 会員特価設定あり && ログイン済みのときここから -->
            <label class="searchResultVehicle_price_label label_member">会員特価</label>
            <!-- 会員特価設定あり && ログイン済みのときここまで -->
            <!-- 会員特価設定あり && ログイン未のときここから -->
            <!--
            <label class="searchResultVehicle_price_label label_subsc btn_no_shadow"><a href="/member/guide/" target="_blank" class="label_subsc_link"><span>会員特価はこちら</span><span class="common_link_arrow arrow_green btn_arrow"></span></a></label>
            -->
            <!-- 会員特価設定あり && ログイン未のときここまで -->
          </p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle ">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606-23-185</span></p>
        <div class="searchResultVehicle_grid">
          <!-- 売約済みのときは<figure>に 'bg_sold_out'クラスを付けてください -->
          <figure class="searchResultVehicle_picture bg_sold_out"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1986_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1986_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
              <!-- 売約済み -->
              <span class="searchResultVehicle_picture_flagTag tag_soldout">売約済み</span>
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount "><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 売約済みのときリンク -->
          <button class="searchResultVehicle_btn_matching btn_white"><a href="/matching/" target="_blank" rel="noopener" class="searchResultVehicle_btn_matching_link">お探しサービス</a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1987_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1987_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <!-- 非ログイン、一般ログイン時のラベルは「支払総額<br>（税込）」
              -- 業販ログイン時のラベルは「業販価格」
            -->
            <p class="searchResultVehicle_price_ttl">業販価格</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1988_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1988_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
              <!-- 新入荷 -->
              <span class="searchResultVehicle_picture_flagTag tag_new">NEW</span>
              <!-- おすすめ -->
              <span class="searchResultVehicle_picture_flagTag tag_rec">おすすめ</span>
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <!-- キャンペーン価格設定ありのとき、
              -- 'campaign_price'クラスを付けてください
             -->
            <p class="searchResultVehicle_price_amount campaign_price"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円
            <!-- キャンペーン価格設定ありのとき、
              -- 以下のlabelを表示してください
             -->
            <label class="searchResultVehicle_price_label label_campaign">キャンペーン価格</label>
            </p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1989_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1989_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
              <!-- 新入荷 -->
              <span class="searchResultVehicle_picture_flagTag tag_new">NEW</span>
              <!-- おすすめ -->
              <span class="searchResultVehicle_picture_flagTag tag_rec">おすすめ</span>
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <!-- 会員特価設定あり && ログイン済みのとき、
              -- 'member_price'クラスを付けてください
             -->
            <p class="searchResultVehicle_price_amount member_price"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円
            <!-- 会員特価設定あり && ログイン済みのときここから -->
            <!--
            <label class="searchResultVehicle_price_label label_member">会員特価</label>
            -->
            <!-- 会員特価設定あり && ログイン済みのときここまで -->
            <!-- 会員特価設定あり && ログイン未のときここから -->
            <label class="searchResultVehicle_price_label label_subsc btn_no_shadow"><a href="/member/guide/" target="_blank" class="label_subsc_link"><span>会員特価はこちら</span><span class="common_link_arrow arrow_green btn_arrow"></span></a></label>
            <!-- 会員特価設定あり && ログイン未のときここまで -->
          </p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle ">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606-23-185</span></p>
        <div class="searchResultVehicle_grid">
          <!-- 売約済みのときは<figure>に 'bg_sold_out'クラスを付けてください -->
          <figure class="searchResultVehicle_picture bg_sold_out"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1980_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1980_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
              <!-- 売約済み -->
              <span class="searchResultVehicle_picture_flagTag tag_soldout">売約済み</span>
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount "><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 売約済みのときリンク -->
          <button class="searchResultVehicle_btn_matching btn_white"><a href="/matching/" target="_blank" rel="noopener" class="searchResultVehicle_btn_matching_link">お探しサービス</a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1981_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1981_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1982_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1982_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <!-- 検索結果が11件以上あるとき、10件表示後に以下の<div>を挿入してください-->
      <div class="searchResult_middle_panel pc_none">
        <!--HP{include file='stock/search_parts_header.tpl'}HP-->
      </div>
      <!-- <div>挿入ここまで -->
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1990-_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1990_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1991_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1991_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1992_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1992_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1993_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1993_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1994_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1994_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1995_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1995_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1996_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1996_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1997_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1997_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1998_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1998_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>
      <div class="searchResultVehicle">
        <p class="searchResultVehicle_access">問い合わせ番号<span class="searchResultVehicle_accessNum">B606</span></p>
        <div class="searchResultVehicle_grid">
          <figure class="searchResultVehicle_picture"><a href="/stock/detail/?car_id=1983">
            <!-- 車両画像 altには車両名を設定-->
            <img id="1999_front" src="/assets/img/stock/stock_dummy_thumbnail.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg front">
            <img id="1999_back" src="/assets/img/stock/stock_dummy_thumbnail_back.webp" alt="" width="270" height="202" loading="lazy" decoding="async" class="searchResultVehicle_pictureImg back" style="display: none;">
            <div class="searchResultVehicle_picture_flag">
            </div>
          </a></figure>
          <h3 class="searchResultVehicle_title"><a href="/stock/detail/?car_id=1983">【年次点検済】フォワード 7.2t 増トン 標準ベッド付 アルミブロック タダノ5段クレーン付 240ps</a></h3>
          <p class="searchResultVehicle_note">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
          <div class="searchResultVehicle_info">
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">年式</span><span class="searchResultVehicle_info_data">2017(H19)年</span></p>
            <p class="searchResultVehicle_infoP"><span class="searchResultVehicle_info_cat">走行距離</span><span class="searchResultVehicle_info_data">696,014km</span></p>
          </div>
          <div class="searchResultVehicle_price">
            <p class="searchResultVehicle_price_ttl">支払総額<br>（税込）</p>
            <p class="searchResultVehicle_price_amount"><span class="searchResultVehicle_price_amountNum"><em class="searchResultVehicle_price_amountNumEm">302</em>.5</span>万円</p>
          </div>  
        </div>
        <div class="searchResultVehicle_btn">
          <!-- 車両詳細へリンク -->
          <button class="searchResultVehicle_btn_detail btn_green"><a href="/stock/detail/?car_id="  class="searchResultVehicle_btn_detail_link">詳細はこちら</a></button>
          <!-- 「気になる」に登録 -->
          <button class="searchResultVehicle_btn_fav btn_white"><a href="/member/check/?mode=favorite&set=" class="searchResultVehicle_btn_fav_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="気になる！に追加" width="20" height="20" decoding="async" loading="eager" class="searchResultVehicle_btn_favIco"></a></button>
        </div>
      </div>                    
      <!-- 検索結果ループここまで -->
    </div>
    <div class="searchResultBottom_pager">
      <ol class="searchResultControl_pagerList">
        <!-- 検索結果ページャー 
          -- リンク有効ページは<a>タグで囲う
          -- リンク無効ページは<li>に'page_disable'クラスをつけてください
          -- 現在ページは<li>に'page_current'クラスをつけてください
          -- ページ数が4ページ以上になる場合は4ページ目以降の<li>に'sp_none'クラスをつけてください
          -- ページ数が4ページ以上になる場合は4ページ目以降に<li class='page_continue pc_none'>を表示してください
        -->
        <li class="searchResultControl_pager_nav page_disable"><span class="searchResultControl_pager_arrow page_prev"></span></li>
        <li class="searchResultControl_pager_skip page_disable"><span>最初</span></li>
        <!-- ページ数分ループ（最大５ページ） ここから-->
        <li class="searchResultControl_pager_page page_current"><span>1</span></li>
        <li class="searchResultControl_pager_page "><a href="/stock/list/?" class="searchResultControl_pager_link"><span>2</span></a></li>
        <li class="searchResultControl_pager_page "><a href="/stock/list/?" class="searchResultControl_pager_link"><span>3</span></a></li>
        <li class="searchResultControl_pager_page sp_none"><a href="/stock/list/?" class="searchResultControl_pager_link"><span>4</span></a></li>
        <li class="searchResultControl_pager_page sp_none"><a href="/stock/list/?" class="searchResultControl_pager_link"><span>5</span></a></li>
        <!-- ページ数分ループ ここまで-->
        <li class="searchResultControl_pager_page page_continue pc_none"><span>...</span></li>
        <li class="searchResultControl_pager_skip "><a href="/stock/list/?" class="searchResultControl_pager_link"><span>最後</span></a></li>
        <li class="searchResultControl_pager_nav "><a href="/stock/list/?" class="searchResultControl_pager_link"><span class="searchResultControl_pager_arrow page_next"></span></a></li>
      </ol>
    </div>

  </div>
</section>

<!--HP{include file='stock/list_history_favorite.tpl'}HP-->

<div class="list_middle_panel pc_none">
  <!--HP{include file='stock/search_parts_header.tpl'}HP-->
</div>

<!--HP{include file='stock/bottom.tpl'}HP-->
<!--HP{include file='parts/commons/modal.tpl'}HP-->

