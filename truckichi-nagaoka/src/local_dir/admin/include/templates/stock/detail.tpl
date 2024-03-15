<!--HP{assign var="categoryList" value=","|explode:$carInfoDetail.category}HP-->
<!--HP{assign var="specification_select" value=","|explode:$carInfoDetail.specification_select}HP-->
<div class="common_breadcrumb sp_none">
  <div class="container">
    <ol class="common_breadcrumb_list">
      <li class="common_breadcrumb_listItem"><a href="<!--HP{$smarty.const.SITE_TOP_URL}HP-->" class="ico_bc_home common_breadcrumb_listItemLink">中古トラックのトラック市長岡店</a></li>
      <li class="common_breadcrumb_listItem"><a href="/stock/list/">中古トラック全在庫（新古車・未使用車）</a></li>
<!--HP{foreach from=$categoryList key=cKey item=cVal}HP-->
<!--HP{if isset($shapeOption[$cVal])}HP-->
      <li class="common_breadcrumb_listItem"><a href="/stock/list/?shape=<!--HP{$cVal}HP-->" class="common_breadcrumb_listItemLink"><!--HP{$shapeOption[$cVal]|escape}HP--></a></li>
<!--HP{/if}HP-->
<!--HP{/foreach}HP-->

<!--HP{foreach from=$categoryList key=cKey item=cVal}HP-->
<!--HP{if isset($makerOption[$cVal])}HP-->
      <li class="common_breadcrumb_listItem" class="common_breadcrumb_listItem"><a href="/stock/list/?maker=<!--HP{$cVal}HP-->" class="common_breadcrumb_listItemLink"><!--HP{$makerOption[$cVal]|escape}HP--></a></li>
<!--HP{/if}HP-->
<!--HP{/foreach}HP-->

<!--HP{foreach from=$categoryList key=cKey item=cVal}HP-->
<!--HP{if isset($sizeOption[$cVal])}HP-->
      <li class="common_breadcrumb_listItem"><a href="/stock/list/?size=<!--HP{$cVal}HP-->" class="common_breadcrumb_listItemLink"><!--HP{$sizeOption[$cVal]|escape}HP--></a></li>
<!--HP{/if}HP-->
<!--HP{/foreach}HP-->
      <li class="common_breadcrumb_listItem"><!--HP{$carInfoDetail.name|escape}HP--></li>
    </ol>
  </div>
</div>
<section class="detail detail_section_align">
  <!-- 車両名 -->
  <div class="container">
    <h1 class="detail_head">【年次点検済】レンジャー 3.75t 増トン ワイドベッド付 アルミブロック ユニック5段クレーン付 240ps</h1>
  </div>
  <div class="detail_cta_head detail_cta_head_pc_none">
    <p class="detail_cta_inquiry">問い合わせ番号<span  class="detail_cta_inquiryNum">B606</span></p>
    <div class="detail_cta_share">
      <button class="detail_cta_shareBtn btn_white"><a href="/member/check/?mode=favorite&set=" class="detail_cta_shareBtn_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="" width="14" height="13" loading="lazy"></a></button>
      <button class="detail_cta_shareBtn btn_white"><a class="detail_cta_shareBtn_link js-modal-open" data-target="modal10" aria-label="共有する"><img src="/assets/img/common/common_ico_share.png" alt="" width="13" height="14" loading="lazy"></a></button>
    </div>
  </div>
  <div class="detail_grid">
    <div class="detail_picture detail_grid_picture detail_grid_col1 detail_grid_container">
      <!--HP{include file='stock/detail_picture_gallery.tpl'}HP-->
      <div class="detail_picture_caption detail_sp_container">
        <!-- catchphrase -->
        <p class="detail_picture_captionTtl">※仕上げ中の為、価格・作業状況をご確認下さい。</p>
        <!-- description -->
        <p class="detail_picture_captionTxt">メッキパーツ架装多数！荷台カメラも付いています！</p>
        <!-- 販売中ここから -->
        <p class="detail_picture_captionMore color_green sp_none"><a href="#detail_relation" ><span class="detail_picture_captionMoreTxt">似ているトラックをお探しの方はこちら</span><span class="detail_picture_captionMoreIco common_link_arrow arrow_green arrow_down"></span></a></p>
        <!-- 販売中ここまで -->
        <!-- 売約済みここから -->
<!--
        <div class="detail_price_soldout">
          <p class="detail_price_soldoutLead">＼ 上記のトラックをお探しの方へ ／</p>
          <button class="detail_price_soldoutBtn btn_green"><a href="/matching/" target="_blank" rel="noopener" class="detail_price_soldoutBtn_link"><span>トラックお探しサービスはこちら</span><span class="detail_support_btnArrow common_link_arrow arrow_white btn_arrow"></span></a></button>
        </div>
-->
        <!-- 売約済みここまで -->
      </div>
      <div class="detail_picture_spEx detail_sp_container pc_none">
        <div class="detail_picture_spExSpec">
          <dl class="detail_picture_spExSpecDl">
            <dt class="detail_picture_spExSpecDt">年式</dt><dd class="detail_picture_spExSpecDd">2017(H19)年</dd>
            <dt class="detail_picture_spExSpecDt">走行距離</dt><dd class="detail_picture_spExSpecDd">696,014km</dd>
          </dl>
          <dl class="detail_picture_spExSpecDl">
            <dt class="detail_picture_spExSpecDt">形状</dt><dd class="detail_picture_spExSpecDd">クレーン車</dd>
            <dt class="detail_picture_spExSpecDt">ミッション</dt><dd class="detail_picture_spExSpecDd">フロア 6MT</dd>
          </dl>
        </div>
        <div class="detail_picture_spExDoc detail_cta_doc">
          <button class="detail_cta_docBtn btn_white"><a href="/stock/detail/?mode=pdf&column=inspection_certificate_picture&car_id=" class="detail_cta_docBtn_link"><img src="/assets/img/common/common_ico_inspection.png" alt="" width="18" height="18" loading="lazy" class="detail_cta_docBtnIco btn_icon"><span class="detail_cta_docBtnTxt">車検証を確認</span></a></button>
          <button class="detail_cta_docBtn btn_white"><a href="/stock/detail/?mode=pdf&column=state_table_picture&car_id=" class="detail_cta_docBtn_link"><img src="/assets/img/common/common_ico_clipboard.png" alt="" width="18" height="18" loading="lazy" class="detail_cta_docBtnIco btn_icon"><span class="detail_cta_docBtnTxt">状態表を確認</span></a></button>
        </div>
      </div>
    </div>
    <div class="detail_description detail_grid_description detail_grid_col1 detail_grid_container">
      <div class="detail_section_align_base">
        <div class="detail_descriptionBlock slide_parent">
          <h2 class="detail_description_head">上物<span class="jsc_slide_btn detail_slide_btn"></span></h2>
          <!-- specification -->
          <div class="detail_sp_container slide_item">
            <p class="detail_description_text">荷台内寸：599×238×31　北海道車体　五方開　アルミアオリ　中間/R支柱脱着可　ステンレス製埋め込みフック4対/中央4個　R支柱左右脱着式幌シート用パイプ付　アオリ三方上部/前立て鳥居/サイドガード上部アルミ縞鋼板張り　鳥居作業灯2個/U型フック2個/Jフック4個/カメラ1個　鳥居左右ステンレス製はしご/工具箱</p>
            <p class="detail_description_text">ユニック5段　2.9t吊り　URG375　ラジコン/フックイン付　差し違いアウトリガー　高さ制限/未格納警報装置　ML警報型　作業灯1個　※令和 5年 5月クレーン年次点検済</p>
          </div>
        </div>
        <div class="detail_descriptionBlock slide_parent">
          <h2 class="detail_description_head">備考<span class="jsc_slide_btn detail_slide_btn"></span></h2>
          <!-- memo -->
          <div class="detail_sp_container slide_item">
            <p class="detail_description_text">オートAC PS PW SRS ABS 集中ドアロック　左電格ミラー/ヒーター/左右電動角度調整　運転席エアサスシート/肘掛け/ヒーター付　AM/FM　ETC　バックモニター　ドライブレコーダー　アドブルー　ターボ　排気ブレーキ　クルーズコントロール　坂道発進補助装置　車線逸脱警報装置　衝突被害軽減ブレーキ　アイドリングストップ　フォグランプ　トラクションコントロール　室内LED灯/カーテン　社外テールランプ　メッキホイールカバー　フロントバイザー　ヘッドライトクリーナー　バックソナー付　ステンレス製燃料タンク200L　タイヤ止め2個　クレーン足場板2枚　ステンレス製Rフェンダーカバー/サイドガード/アオリキャッチ/ヒンジ　左シャシR3連タイヤチェーンフック2個　右シャシR FRP製工具箱　字光式ナンバープレート　消火器1個</p>
          </div>
        </div>
        <div class="detail_descriptionBlock slide_parent">
          <h2 class="detail_description_head">装備仕様<span class="jsc_slide_btn detail_slide_btn"></span></h2>
          <!-- specificationOption -->
          <div class="detail_sp_container slide_item">
            <!-- group1 -->
            <ul class="detail_description_specList">
              <li class="detail_description_specListItem">オートエアコン</li>
              <li class="detail_description_specListItem">パワーステアリング</li>
              <li class="detail_description_specListItem">パワーウィンドウ</li>
              <li class="detail_description_specListItem">エアバッグ</li>
              <li class="detail_description_specListItem">ABS</li>
              <li class="detail_description_specListItem">集中ドアロック</li>
              <li class="detail_description_specListItem">電動格納ミラー(左のみ)</li>
              <li class="detail_description_specListItem">ミラーヒーター</li>
              <li class="detail_description_specListItem">ミラー電動角度調整</li>
              <li class="detail_description_specListItem">エアサスシート</li>
              <li class="detail_description_specListItem">運転席肘掛け</li>
            </ul>
            <!-- group2 -->
            <ul class="detail_description_specList">
              <li class="detail_description_specListItem">ラジオ</li>
              <li class="detail_description_specListItem">ETC</li>
              <li class="detail_description_specListItem">バックモニター</li>
              <li class="detail_description_specListItem">ドライブレコーダー</li>
            </ul>
            <!-- group3 -->
            <ul class="detail_description_specList">
              <li class="detail_description_specListItem">アドブルー</li>
              <li class="detail_description_specListItem">ターボ</li>
              <li class="detail_description_specListItem">排気ブレーキ</li>
              <li class="detail_description_specListItem">クルーズコントロール</li>
              <li class="detail_description_specListItem">坂道発進補助装置</li>
              <li class="detail_description_specListItem">斜線逸脱警報</li>
              <li class="detail_description_specListItem">衝突被害軽減ブレーキ</li>
              <li class="detail_description_specListItem">トラクションコントロール</li>
              <li class="detail_description_specListItem">アイドリングストップ</li>
              <li class="detail_description_specListItem">フォグランプ</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="detail_cta detail_grid_cta detail_grid_col2 detail_grid_container">
      <div class="detail_grid_actual">
        <div class="detail_cta_head">
          <p class="detail_cta_inquiry">問い合わせ番号<span class="detail_cta_inquiryNum">B606</span></p>
          <div class="detail_cta_share">
            <button class="detail_cta_shareBtn btn_white"><a href="/member/check/?mode=favorite&set=" class="detail_cta_shareBtn_link" aria-label="気になる！"><img src="/assets/img/common/common_ico_favorite.png" alt="" width="14" height="13" loading="lazy" class="detail_cta_shareBtnIco"></a></button>
            <button class="detail_cta_shareBtn btn_white"><a class="detail_cta_shareBtn_link js-modal-open" data-target="modal10" aria-label="共有する"><img src="/assets/img/common/common_ico_share.png" alt="" width="13" height="14" loading="lazy" class="detail_cta_shareBtnIco"></a></button>
          </div>
        </div>
        <div class="detail_sp_container">
          <!--HP{include file='parts/cta/cta_detail.tpl'}HP-->
          <div class="detail_cta_doc">
            <button class="detail_cta_docBtn btn_white btn_sp_none"><a href="/stock/detail/?mode=print&car_id=" class="detail_cta_docBtn_link"><img src="/assets/img/common/common_ico_print.png" alt="" width="18" height="18" loading="lazy" class="detail_cta_docBtnIco btn_icon"><span class="detail_cta_docBtnTxt">詳細を印刷</span></a></button>
            <button class="detail_cta_docBtn btn_white"><a href="/stock/detail/?mode=pdf&column=inspection_certificate_picture&car_id=" class="detail_cta_docBtn_link"><img src="/assets/img/common/common_ico_inspection.png" alt="" width="18" height="18" loading="lazy" class="detail_cta_docBtnIco btn_icon"><span class="detail_cta_docBtnTxt">車検証を確認</span></a></button>
            <button class="detail_cta_docBtn btn_white"><a href="/stock/detail/?mode=pdf&column=state_table_picture&car_id=" class="detail_cta_docBtn_link"><img src="/assets/img/common/common_ico_clipboard.png" alt="" width="18" height="18" loading="lazy" class="detail_cta_docBtnIco btn_icon"><span class="detail_cta_docBtnTxt">状態表を確認</span></a></button>
          </div>
        </div>
      </div>
    </div>
    <div class="detail_price detail_grid_price detail_grid_col2 detail_grid_container detail_grid_align">
      <div class="detail_grid_actual">
        <!-- 一般、非会員ここから -->
        <div class="detail_price_menu price_menu_general">
          <div class="detail_price_menuBoard">
            <h2 class="detail_price_menuHd">基本プラン</h2>
            <div class="detail_price_menuList">
              <div class="detail_price_box detail_price_amount">
                <p class="detail_price_boxTtl">支払総額(税込)</p>
                <p><span class="detail_price_boxNum"><em class="detail_price_boxNumEm">1302</em>.5</span><span class="detail_price_boxUnit">万円</span>
                </p>
              </div>
              <div class="detail_price_box">
                <p class="detail_price_boxTtl">車両価格(税込)</p>
                <p><span class="detail_price_boxNum">1292.5</span><span class="detail_price_boxUnit">万円</span>
                </p>
              </div>
              <div class="detail_price_box">
                <p class="detail_price_boxTtl">諸費用(税込)</p>
                <p><span class="detail_price_boxNum">38</span><span class="detail_price_boxUnit">万円</span>
                </p>
              </div>
            </div>
          </div>
          <div class="detail_maintenance">
            <div class="detail_maintenance_item slide_parent">
              <div class="detail_maintenance_itemHead">
                <h3 class="detail_maintenance_itemHeadH3">法定整備<span class="jsc_slide_btn detail_slide_btn"></span></h3>
                <span class="detail_maintenance_itemHeadSpan sp_none">定期点検整備あり</span>
              </div>
              <!-- PC/SPでレイアウトが異なるためmaintenance_columnを2か所に表示してください -->
              <div class="slide_item">
                <p class="detail_maintenance_itemDescr pc_none">定期点検整備あり</p>
                <p class="detail_maintenance_itemDescr">各所点検整備、各オイル油脂類交換、各フィルター交換、ワイパーゴム交換、バッテリー 交換</p>
              </div>
            </div>
            <div class="detail_maintenance_item slide_parent">
              <div class="detail_maintenance_itemHead">
                <h3 class="detail_maintenance_itemHeadH3">保証<span class="jsc_slide_btn detail_slide_btn"></span></h3>
                <span class="detail_maintenance_itemHeadSpan sp_none">保証付き (部分保証・２ヶ月または走行距離3,000㎞まで)</span>
              </div>
              <!-- PC/SPでレイアウトが異なるためmaintenance_columnを2か所に表示してください -->
              <div class="slide_item">
                <p class="detail_maintenance_itemDescr pc_none">保証付き (部分保証・２ヶ月または走行距離3,000㎞まで)</p>
              </div>
            </div>
          </div>
        </div>
        <!-- 販売中ここから -->
        <div class="detail_price_menu price_menu_peace">
          <div class="detail_price_menuBoard">
            <p class="detail_price_balloon">多くの方に選ばれています！</p>
            <h2 class="detail_price_menuHd color_green">安心プラン<a href="/campaign/help_sougaku/?shape=1#sougaku-secure-plan" target="_blank" class="detail_price_menuHdHelp"><img src="/assets/img/common/common_ico_question.png" alt="安心プランとは？" width="18" height="19" loading="lazy" class="detail_price_menuHdHelpIco"></a></h2>
            <div class="detail_price_menuList">
              <div class="detail_price_box detail_price_amount">
                <p class="detail_price_boxTtl">支払総額(税込)</p>
                <p class=""><span class="detail_price_boxNum color_green"><em class="detail_price_boxNumEm">1330</em>.5</span><span class="detail_price_boxUnit">万円</span></p>
              </div>
              <div class="detail_price_box">
                <p class="detail_price_boxTtl">車両価格(税込)</p>
                <p ><span class="detail_price_boxNum">1292.5</span><span class="detail_price_boxUnit">万円</span></p>
              </div>
              <div class="detail_price_box">
                <p class="detail_price_boxTtl">諸費用(税込)</p>
                <p><span class="detail_price_boxNum">66</span><span class="detail_price_boxUnit">万円</span></p>
              </div>
            </div>
          </div>
          <div class="detail_maintenance">
            <div class="detail_maintenance_item slide_parent">
              <div class="detail_maintenance_itemHead">
                <h3 class="detail_maintenance_itemHeadH3">法定整備<span class="jsc_slide_btn detail_slide_btn"></span></h3>
                <span class="detail_maintenance_itemHeadSpan sp_none">新車点検/継続車検 整備費用込み</span>
              </div>
              <!-- PC/SPでレイアウトが異なるためmaintenance_columnを2か所に表示してください -->
              <div class="slide_item">
                <p class="detail_maintenance_itemDescr pc_none">新車点検/継続車検 整備費用込み</p>
                <p class="detail_maintenance_itemDescr">各所点検整備、各オイル油脂類交換、各フィルター交換、ワイパーゴム交換、バッテリー交換</p>
              </div>
            </div>
            <div class="detail_maintenance_item slide_parent">
              <div class="detail_maintenance_itemHead">
                <h3 class="detail_maintenance_itemHeadH3">保証<span class="jsc_slide_btn detail_slide_btn"></span></h3>
                <span class="detail_maintenance_itemHeadSpan sp_none">保証付き（T-PROTECT保証・12ヶ月または走行距離15,000kmまで）</span>
              </div>
              <!-- PC/SPでレイアウトが異なるためmaintenance_columnを2か所に表示してください -->
              <div class="slide_item">
                <p class="detail_maintenance_itemDescr pc_none">保証付き（T-PROTECT保証・12ヶ月または走行距離15,000kmまで）</p>
              </div>
            </div>
          </div>
        </div>
        <p class="detail_price_note">※お客様のご要望や車両状態により支払い金額と納期が変わります。予めご了承ください。</p>
        <p class="detail_picture_captionMore color_green pc_none"><a href="#detail_relation" ><span class="detail_picture_captionMoreTxt">似ているトラックをお探しの方はこちら</span><span class="detail_picture_captionMoreIco common_link_arrow arrow_green arrow_down"></span></a></p>
        <!-- 販売中ここまで -->
        <!-- 一般、非会員ここまで -->
        <!-- 業販会員ここから -->
<!--
        <div class="detail_business_price">
          <div class="detail_price_menu price_menu_business">
            <div class="detail_price_menuBoard menu_board_business">
              <h2 class="detail_price_menuHd">業販価格</h2>
              <div class="detail_price_menuList">
                <div class="detail_price_box detail_price_amount">
                  <p class="detail_price_boxTtl">税込価格</p>
                  <p><span class="detail_price_boxNum color_green"><em class="detail_price_boxNumEm">1250</em>.5</span><span class="detail_price_boxUnit">万円</span>
                  </p>
                </div>
                <div class="detail_price_box business_price_box">
                  <p class="detail_price_boxTtl">税抜価格</p>
                  <p><span class="detail_price_boxNum">1136.8</span><span class="detail_price_boxUnit">万円</span>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="detail_price_menu price_menu_general">
            <div class="detail_price_menuBoard menu_board_general">
              <h2 class="detail_price_menuHd">一般価格(参考価格)</h2>
              <div class="detail_price_menuList">
                <div class="detail_price_box detail_price_amount">
                  <p class="detail_price_boxTtl">一般価格(税込)</p>
                  <p><span class="detail_price_boxNum"><em class="detail_price_boxNumEm">1302</em>.5</span><span class="detail_price_boxUnit">万円</span>
                  </p>
                </div>
                <div class="detail_price_box business_price_box">
                  <p class="detail_price_boxTtl">車両価格(税込)</p>
                  <p><span class="detail_price_boxNum">1292.5</span><span class="detail_price_boxUnit">万円</span>
                  </p>
                </div>
                <div class="detail_price_box business_price_box">
                  <p class="detail_price_boxTtl">諸費用(税込)</p>
                  <p><span class="detail_price_boxNum">38</span><span class="detail_price_boxUnit">万円</span>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
-->
        <!-- 業販会員ここまで -->
      </div>
    </div>
    <div class="detail_spec detail_grid_spec detail_grid_col2 detail_grid_container detail_grid_align">
      <div class="detail_grid_actual">
        <div class="detail_sp_container">
          <div class="detail_spec_table">
            <div class="detail_spec_tableCol">
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">メーカー</dt>
                <dd class="detail_spec_dd">いすゞ</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">車名</dt>
                <dd class="detail_spec_dd">エルフ</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">形状</dt>
                <dd class="detail_spec_dd">平ボデー</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">年式</dt>
                <dd class="detail_spec_dd">2017(H29)年</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">型式</dt>
                <dd class="detail_spec_dd">QKG-FTR34S2</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">走行距離</dt>
                <dd class="detail_spec_dd">4,705km</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">車検満了日</dt>
                <dd class="detail_spec_dd">令和3年9月</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">最大積載量</dt>
                <dd class="detail_spec_dd">2,000kg</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">総重量</dt>
                <dd class="detail_spec_dd">13,240kg</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">ミッション</dt>
                <dd class="detail_spec_dd">AT</dd>
              </dl>
            </div>
            <div class="detail_spec_tableCol">
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">駆動</dt>
                <dd class="detail_spec_dd">4WD</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">定員</dt>
                <dd class="detail_spec_dd">3人</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">燃料</dt>
                <dd class="detail_spec_dd">ガソリン</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">排気量</dt>
                <dd class="detail_spec_dd">7,790cc</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">以前使用地</dt>
                <dd class="detail_spec_dd">群馬</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">荷台寸法(cm)</dt>
                <dd class="detail_spec_dd">688x241x239</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">修復歴</dt>
                <dd class="detail_spec_dd">なし</dd>
              </dl>
              <dl class="detail_spec_dl">
                <dt class="detail_spec_dt">リサイクル料金</dt>
                <dd class="detail_spec_dd">12,460円(税込)</dd>
              </dl>
              <dl class="detail_spec_dl spec_dl_2row">
                <dt class="detail_spec_dt">抗菌コーティング</dt>
                <dd class="detail_spec_dd">キャブ室内 施工可能</dd>
              </dl>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="detail_support detail_grid_support detail_sp_container detail_grid_col2 detail_grid_container detail_grid_align">
      <div class="detail_grid_actual">
        <div class="detail_support_wrap">
          <div class="detail_support_head">
            <img src="/assets/img/common/common_illust_proposal.webp" alt="" width="174" height="145" loading="lazy" class="detail_support_headImg">
            <h2 class="detail_support_headTtl"><span class="detail_support_headTtlSup">無料</span><span>提案資料<br>作成サポート</span></h2>
          </div>
          <p class="detail_support_body">状態表を公開していますので稟議を上げる際にお使いいただけます。
            ご提案に必要な簡単な資料作成のお手伝いが必要であればお知らせください!<br>車両や架装物に対してのランニングコスト、セールスポイントやお見積りなどの資料作成をサポートします。<br>フォームからお申し込み後、弊社担当よりご連絡します。</p>
          <button class="detail_support_btn btn_green"><a href="/contact/?manage_code=&car_id=&head_contact[]=2" target="_blank" rel="noopener" class="detail_support_btn_link"><p><span class="detail_support_btnSup">無料</span><span>提案サポートの詳細</span></p><span class="detail_support_btnArrow common_link_arrow arrow_white btn_arrow"></span></a></button>
        </div>
      </div>
    </div>
  </div>
</section>
<!--HP{include file='stock/list_related.tpl'}HP-->
<section class="detail_searchPanel detail_section_align">
  <div class="detail_section_align_base">
    <!--HP{include file='stock/search_parts_header.tpl'}HP-->
    <!--HP{include file='stock/search_parts_footer.tpl'}HP-->
  </div>
</section>
<!--HP{include file='parts/commons/modal.tpl'}HP-->

<!-- modal -->
<div id="modal10" class="c-modal js-modal">
  <div class="c-modal_bg js-modal-close"></div>
  <div class="c-modal_content _lg">
    <div class="c-modal_content_inner">
      <div class="container">
        <h2>このトラックの情報を</h2>
        <ul class="pc_sns_share_wrap">
          <li>
            <a href="https://social-plugins.line.me/lineit/share?url=<!--HP{$share_url}HP-->" class="btn_sns_share line link" target="_blank">
              <div class="item_wrap">
                <div class="img_box">
                  <img src="/assets/img/common/ico_sns_line.svg" alt="LINE">
                </div>
                <p>LINEで共有する</p>
              </div>
            </a>
          </li>
          <li>
            <a href="http://twitter.com/share?url=<!--HP{$share_url}HP-->&text=トラック市長岡のトラック情報" class="btn_sns_share twitter link" target="_blank">
              <div class="item_wrap">
                <div class="img_box">
                  <img src="/assets/img/common/common_ico_x_white.png" alt="Twitter">
                </div>
                <p>Xで共有する</p>
              </div>
            </a>
          </li>
          <li>
            <a href="https://www.facebook.com/sharer/sharer.php?u=<!--HP{$share_url}HP-->" class="btn_sns_share fb link" target="_blank">
              <div class="item_wrap">
                <div class="img_box">
                  <img src="/assets/img/common/ico_sns_facebook.svg" alt="Facebook">
                </div>
                <p>Facebookで共有する</p>
              </div>
            </a>
          </li>
          <li>
            <a href="mailto:?subject=トラック市長岡のトラック情報&body=【<!--HP{$carInfoDetail.manage_code_hp|replace:'売約済み':''|escape}HP-->】<!--HP{$carInfoDetail.name|escape}HP-->%0d%0a<!--HP{$share_url|escape}HP-->" class="btn_sns_share mail link" target="_blank">
              <div class="item_wrap">
                <div class="img_box">
                  <img src="/assets/img/common/ico_sns_mail.svg" alt="mail">
                </div>
                <p>メールで共有する</p>
              </div>
            </a>
          </li>
        </ul>
      </div>
      <a class="js-modal-close c-modal_close link" href=""><span class="btn_close">×</span></a>
    </div>
  </div>
</div>
<!-- ./modal -->
