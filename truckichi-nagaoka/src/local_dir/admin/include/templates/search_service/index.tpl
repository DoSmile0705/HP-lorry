  <section id="form" class="form sec_m_m">
    <div class="container searchServicePoint">
      <h2 class="ttl_highlighter">
        ネットでは探しきれない<br /><span class="highlighter">ご要望にぴったりの高コスパトラック</span>を<br />プロがお探しします!
      </h2>
      <div class="flex">
        <div class="col-3">
          <p class="advantage l-height">
            <span class="small">お探しサービス</span><br /><span class="strong">検索対象数<sup>※</sup></span><br /><span class="highlighter">3<span>万</span>5000<span>台</span></span>
          </p>
        </div>
        <div class="col-3">
          <p class="advantage">
            <span class="small">受付から乗り出しまで</span><br /><span class="strong">期間</span><br /><span class="highlighter">最短翌日</span>
          </p>
        </div>
        <div class="col-3">
          <p class="advantage">
            <span class="small">トラック市長岡ご利用</span><br /><span class="strong">リピート率<sup>※</sup></span><br /><span class="highlighter">77％</span>
          </p>
        </div>
      </div>
      <ul class="e_list">
        <li>※1&nbsp;検索対象数：2020年12月トラック共有在庫システムより集計。</li>
        <li>※2&nbsp;リピート率：2018年1月～業販リピート率の集計。</li>
      </ul>
    </div>
    <div class="container form_wrap" id="truck_search_service">
      <div class="form_box">
        <h2>日本全国トラックお探しサービス</h2>
        <p class="form_subttl">
          お求めのトラックが見つからない場合は、<br />日本全国トラックお探しサービスをご利用ください!
        </p>

        <div class="product_info_mail" id="product_info_mail" <!--HP{if empty($carInfoDetailmail)}HP-->style="display: none;"<!--HP{/if}HP-->>
        <p class="product_info_mail_txt">よく似たトラックについて問い合わせる</p>
        <div class="product_info">
          <div class="img_box">
          <!--HP{if !empty($carInfoDetailmail.pictures)}HP-->
            <!--HP{assign var="pic" value=$carInfoDetailmail.pictures|@json_decode:true}HP-->
            <!--HP{if !empty($pic[0].thumb_file)}HP-->
              <!--HP{assign var="pic_org" value=$pic[0].thumb_file}HP-->
            <!--HP{/if}HP-->
          <!--HP{/if}HP-->
          <!--HP{if !empty($pic_org)}HP-->
            <img name="inquiry_img_PC" id="inquiry_img_PC" src="/uploads/img/thumb/<!--HP{$pic_org}HP-->"  />
            <img name="inquiry_img_SP" id="inquiry_img_SP" src="" alt="" class="">
          <!--HP{else}HP-->
            <img name="inquiry_img_PC" id="inquiry_img_PC" src="/assets/front/img/noimage_common_PC.png" alt="画像はただいま準備中です" class="sp_none">
            <img name="inquiry_img_SP" id="inquiry_img_SP" src="/assets/front/img/noimage_common_SP.png" alt="画像はただいま準備中です" class="pc_none">
          <!--HP{/if}HP-->
          </div>
          <div class="txt_box">
            <p name="inquiry_manage_code_hp" id="inquiry_manage_code_hp"  class="contact_number"><!--HP{if !empty($carInfoDetailmail)}HP-->問い合わせ番号：<!--HP{$carInfoDetailmail.manage_code_hp|replace:'売約済み':''}HP--><!--HP{/if}HP--></p>
            <p name="inquiry_name" id="inquiry_name"><!--HP{if !empty($carInfoDetailmail)}HP--><!--HP{$carInfoDetailmail.name}HP--><!--HP{/if}HP--></p>
          </div>
        </div>
        </div>

        <div id="truck_search_service-error" class="box_caution err_msg_box" <!--HP{if empty($error)}HP-->style="display: none;"<!--HP{/if}HP-->>
        <!--HP{if !empty($error)&&isset($error.requireErrFlg)}HP-->
         <p class="form-error-msg" >未入力項目があります。内容を確認の上、修正してください。</p>
        <!--HP{elseif !empty($error)}HP-->
         <p class="form-error-msg" >入力エラーがあります。内容を確認の上、修正してください。</p>
        <!--HP{/if}HP-->
         <p class="require-error-msg" ></p>
        </div>
        <form class="front-form search-service" action="/search_service/confirm/" method="post" novalidate="novalidate" novalidate>
          <input type="hidden" id="virtual_row_id" name="virtual_row_id" value="<!--HP{if !empty($carInfoDetailmail)}HP--><!--HP{$carInfoDetailmail.virtual_row_id}HP--><!--HP{/if}HP-->" />
          <div class="form_box_flex">
            <!-- ①お名前 -->
            <div class="form_box_left">
              <label for="sei" class="required">お名前</label>
            </div>
            <!-- /.form_box_left -->
            <div class="form_box_right col2" id="form_valid_name">
              <input class="form_input col2_item <!--HP{if isset($error.seimei)}HP-->is_error<!--HP{/if}HP-->" type="text" id="sei" name="sei" aria-label="sei" placeholder="例）田中" value="<!--HP{if isset($search_service.sei)}HP--><!--HP{$search_service.sei}HP--><!--HP{/if}HP-->" />
              <input class="form_input col2_item" type="text" id="mei_opt" name="mei_opt" aria-label="mei_opt" placeholder="例）太郎" value="<!--HP{if isset($search_service.mei)}HP--><!--HP{$search_service.mei}HP--><!--HP{/if}HP-->" />
              <!--HP{if isset($error.seimei)}HP--><p class="form_error_message seimei"><!--HP{$error.seimei}HP--></p><!--HP{/if}HP-->
            </div>
            <!-- /.form_box_right -->

            <!-- ②メアド -->
            <div class="form_box_left">
              <label class="required">ご希望の連絡方法</label>
            </div>
            <!-- /.form_box_left -->
            <div class="form_box_right" id="form_valid_method">
              <div class="check_wrap method_contacts <!--HP{if isset($error.method_contact)}HP-->is_error<!--HP{/if}HP-->">
                <input id="check_mail" name="method_contact" class="check_mail " aria-label="メール希望" type="radio" value="<!--HP{$smarty.const.CONTACT_METHOD_BY_MAIL}HP-->"<!--HP{if isset($search_service.method_contact) && $search_service.method_contact == $smarty.const.CONTACT_METHOD_BY_MAIL}HP--> checked="checked"<!--HP{/if}HP-->>
                <label for="check_mail" class="check_label_mail">メールアドレス</label>
                <input id="check_phone" name="method_contact" class="check_phone " aria-label="電話希望" type="radio" value="<!--HP{$smarty.const.CONTACT_METHOD_BY_TEL}HP-->"<!--HP{if isset($search_service.method_contact) && $search_service.method_contact == $smarty.const.CONTACT_METHOD_BY_TEL}HP--> checked="checked"<!--HP{/if}HP-->>
                <label for="check_phone" class="check_label_tel">電　話</label>
                <!--HP{if isset($error.method_contact)}HP--><p class="form_error_message"><!--HP{$error.method_contact}HP--></p><!--HP{/if}HP-->
              </div>
              <!-- /.check_wrap -->
            </div>
            <!-- /.form_box_right -->
            <div class="form_box_left">
              <label for="mail" class="label_mail <!--HP{if $search_service.method_contact==$smarty.const.CONTACT_METHOD_BY_MAIL }HP-->required<!--HP{else}HP-->optional<!--HP{/if}HP-->">メールアドレス</label>
            </div>
            <!-- /.form_box_left -->
            <div class="form_box_right email-wrap">
              <!--HP{if isset($search_service.login)}HP-->
              <!--HP{$search_service.mail}HP--><input type="hidden" name="mail" value="<!--HP{$search_service.mail}HP-->">
              <!--HP{else}HP-->
              <input type="email" id="mail" class="form_input <!--HP{if isset($error.mail)}HP-->is_error<!--HP{/if}HP-->" name="mail" aria-label="メールアドレス" placeholder="例）truckichi-nagaoka@example.jp" value="<!--HP{if isset($search_service.mail)}HP--><!--HP{$search_service.mail}HP--><!--HP{/if}HP-->" />
              <!--HP{/if}HP-->
              <!--HP{if isset($error.mail)}HP--><p class="form_error_message mail"><!--HP{$error.mail}HP--></p><!--HP{/if}HP-->
            </div>
            <!-- /.form_box_right -->

            <!-- ③電話番号 -->
            <div class="form_box_left">
              <label for="tel" class="label_tel optional">電話番号</label>
            </div>
            <!-- /.form_box_left -->
            <div class="form_box_right">
              <input type="tel" id="tel" class="form_input <!--HP{if isset($error.tel)}HP-->is_error<!--HP{/if}HP-->" name="tel" aria-label="電話番号" placeholder="例）1234567890" value="<!--HP{if isset($search_service.tel)}HP--><!--HP{$search_service.tel}HP--><!--HP{/if}HP-->" />
              <!--HP{if isset($error.tel)}HP--><p class="form_error_message tel"><!--HP{$error.tel}HP--></p><!--HP{/if}HP-->
            </div>
            <!-- /.form_box_right -->

            <!-- ④車種の形状 -->
            <div class="form_box_left">
              <label for="shape" class="optional">車種の形状</label>
            </div>
            <!-- /.form_box_left -->
            <div class="form_box_right">
              <span class="form_select_wrap">
                <span class="form_select">
                  <select name="shape" id="shape" class="select <!--HP{if isset($error.shape)}HP-->is_error<!--HP{/if}HP-->">
                    <option value="">すべて</option>
                    <!--HP{foreach from=$shapeOption key=k item=v}HP-->
                    <option value="<!--HP{$k}HP-->"<!--HP{if isset($search_service.shape) && $search_service.shape == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
                  <!--HP{/foreach}HP-->
                  </select>
              </span>
              </span>
            <!--HP{if isset($error.shape)}HP--><p class="form_error_message"><!--HP{$error.shape}HP--></p><!--HP{/if}HP--></div>
          <!-- /.form_box_right -->

          <!-- ⑤大きさ -->
          <div class="form_box_left">
            <label for="size" class="optional">大きさ</label>
          </div>
          <!-- /.form_box_left -->
          <div class="form_box_right">
            <span class="form_select_wrap">
              <span class="form_select">
                <select name="size" id="size" class="select <!--HP{if isset($error.size)}HP-->is_error<!--HP{/if}HP-->">
                  <option value="">すべて</option>
                  <!--HP{foreach from=$sizeOption key=k item=v}HP-->
                  <option value="<!--HP{$k}HP-->"<!--HP{if isset($search_service.size) && $search_service.size == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
                <!--HP{/foreach}HP-->
                </select>
            </span>
            </span>
          <!--HP{if isset($error.size)}HP--><p class="form_error_message"><!--HP{$error.size}HP--></p><!--HP{/if}HP-->
          </div>
          <!-- /.form_box_right -->

          <!-- ⑥年式 -->
          <div class="form_box_left">
            <label for="year_min" class="optional">年式</label>
          </div>
          <!-- /.form_box_left -->
          <div class="form_box_right">
            <div class="flex_c">
              <span class="form_select_wrap">
                <span class="form_select">
                  <select name="model_year_min" id="year_min" class="select_half border <!--HP{if isset($error.model_year_min)}HP-->is_error<!--HP{/if}HP-->">
                    <option value="">下限なし</option>
                    <!--HP{foreach from=$modelYearOption key=k item=v}HP-->
                    <option value="<!--HP{$k}HP-->"<!--HP{if isset($search_service.model_year_min) && $search_service.model_year_min == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
                  <!--HP{/foreach}HP-->
                  </select>
              </span>
              </span>
            <span>～</span>
            <span class="form_select_wrap">
              <span class="form_select">
                <select name="model_year_max" id="year_max" class="select_half border <!--HP{if isset($error.model_year_max)}HP-->is_error<!--HP{/if}HP-->">
                  <option value="">上限なし</option>
                  <!--HP{foreach from=$modelYearOption key=k item=v}HP-->
                  <option value="<!--HP{$k}HP-->"<!--HP{if isset($search_service.model_year_max) && $search_service.model_year_max == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
                <!--HP{/foreach}HP-->
                </select>
            </span>
            </span>
        </div>  <!-- /.flex_c -->
        <!--HP{if isset($error.model_year_min)}HP--><p class="form_error_message"><!--HP{$error.model_year_min}HP--></p><!--HP{/if}HP-->
        <!--HP{if isset($error.model_year_max)}HP--><p class="form_error_message"><!--HP{$error.model_year_max}HP--></p><!--HP{/if}HP-->
    </div>
    <!-- /.form_box_right -->

    <!-- ⑦価格 -->
    <div class="form_box_left">
      <label for="price_mini" class="optional">価格</label>
    </div>
    <!-- /.form_box_left -->
    <div class="form_box_right ">
      <div class="flex_c mb-0">
        <span class="form_select_wrap">
          <span class="form_select">
            <select name="price_mini" id="price_mini" class="select_half border <!--HP{if isset($error.price_mini)}HP-->is_error<!--HP{/if}HP-->">
              <option value="">下限なし</option>
              <!--HP{foreach from=$priceOptionSearch key=k item=v}HP-->
              <option value="<!--HP{$k}HP-->"<!--HP{if isset($search_service.price_mini) && $search_service.price_mini == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
            <!--HP{/foreach}HP-->
            </select>
        </span>
        </span>
      <span>～</span>
      <span class="form_select_wrap">
        <span class="form_select">
          <select name="price_max" id="price_max" class="select_half border <!--HP{if isset($error.price_max)}HP-->is_error<!--HP{/if}HP-->">
            <option value="">上限なし</option>
            <!--HP{foreach from=$priceOptionSearch key=k item=v}HP-->
            <option value="<!--HP{$k}HP-->"<!--HP{if isset($search_service.price_max) && $search_service.price_max == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
          <!--HP{/foreach}HP-->
          </select>
      </span>
      </span>
    </div>
    <!-- /.flex_c -->
    <!--HP{if isset($error.price_mini)}HP--><p class="form_error_messagd"><!--HP{$error.price_mini}HP--></p><!--HP{/if}HP-->
    <!--HP{if isset($error.price_max)}HP--><p class="form_error_message"><!--HP{$error.price_max}HP--></p><!--HP{/if}HP-->
    </div>
    <!-- /.form_box_right -->
    </div>
    <!-- /.form_box_flex -->

    <div class="sec_m_s acc_btn_wrap">
      <button type="button" class="pc_txt link btn_square_white_02 js-acc-btn">詳細を追加する</button>
    </div>
    <div class="js-acc-content">
      <div class="form_box_flex">
        <!-- ⑧会社名 -->
        <div class="form_box_left">
          <label for="corporate_name" class="optional">会社名</label>
        </div>
        <!-- /.form_box_left -->
        <div class="form_box_right">
          <input type="text" id="corporate_name" class="form_input" name="corporate_name" aria-label="会社名" placeholder="例）株式会社ナカノオート" value="<!--HP{if isset($search_service.corporate_name)}HP--><!--HP{$search_service.corporate_name}HP--><!--HP{/if}HP-->" />
        </div>
        <!-- /.form_box_right -->

        <!-- ⑨住所 -->
        <div class="form_box_left">
          <label for="zip" class="optional">住　所</label>
        </div>
        <!-- /.form_box_left -->
        <div class="form_box_right address_wrap">
          <div class="address_wrap_row zip">
            <span class="icon_postal_code">〒</span>
            <input type="tel" class="form_input input_half postal_code <!--HP{if isset($error.zip)}HP-->is_error<!--HP{/if}HP-->" inputmode="numeric" id="zip" name="zip" aria-label="郵便番号" placeholder="例）9402101" value="<!--HP{if isset($search_service.zip)}HP--><!--HP{$search_service.zip}HP--><!--HP{/if}HP-->" maxlength="8">
            <button type="button" class="automatic_input" onclick="AjaxZip3.zip2addr('zip','','address','address');">住所を自動入力</button>
          </div>
          <!-- /.address_wrap_row -->
          <!--HP{if isset($error.zip)}HP--><p class="form_error_message zip"><!--HP{$error.zip}HP--></p><!--HP{/if}HP-->
          <p class="note">
            ※7桁の郵便番号を入力して「住所を自動入力」ボタンを押すと、県・市区町村名が入力されます。
          </p>
          <input id="address" class="form_input " type="text" name="address" placeholder="例）新潟県長岡市寺島町857番地" value="<!--HP{if isset($search_service.address)}HP--><!--HP{$search_service.address}HP--><!--HP{/if}HP-->">
        </div>
        <!-- /.form_box_right -->

        <!-- ⑩走行距離 -->
        <div class="form_box_left">
          <label for="milage" class="optional">走行距離</label>
        </div>
        <!-- /.form_box_left -->
        <div class="form_box_right">
          <input type="text" id="mileage" class="form_input" name="mileage" aria-label="走行距離" placeholder="例）5万kmまで" value="<!--HP{if isset($search_service.mileage)}HP--><!--HP{$search_service.mileage}HP--><!--HP{/if}HP-->" />
        </div>
        <!-- /.form_box_right -->

        <!-- ⑪その他 -->
        <div class="form_box_left">
          <label for="ather" class="optional">その他</label>
        </div>
        <!-- /.form_box_left -->
        <div class="form_box_right">
          <textarea id="ather" name="others" rows="4" cols="40" aria-label="その他" placeholder="例）2ｔのセミロングボデーのクレーン付きトラックで、ユニックで4段はありますか。入庫予定はありますか？"><!--HP{if isset($search_service.others)}HP--><!--HP{$search_service.others}HP--><!--HP{elseif isset($carInfoDetail)}HP--><!--HP{$carInfoDetail.manage_code_hp|replace:'売約済み':''}HP-->に似ているトラックを探してほしい<!--HP{/if}HP--></textarea>
       </div>
        <!-- /.form_box_right -->

        <!-- ⑫納車希望日 -->
        <div class="form_box_left">
          <label for="desired_date" class="label_desired_date optional">納車希望日</label>
        </div>
        <!-- /.form_box_left -->
        <div class="form_box_right flex mb-0" style="display: flex;position: relative;align-items: center;">
          <input type="text" id="desired_date" class="form_input <!--HP{if isset($error.desired_date)}HP-->is_error<!--HP{/if}HP-->" name="desired_date" aria-label="納車希望日" placeholder="カレンダーから選択" value="<!--HP{if isset($search_service.desired_date)}HP--><!--HP{$search_service.desired_date}HP--><!--HP{/if}HP-->" readonly="readonly" style="width: 63%;" />

          <input type="button" id="desired_btn" onClick="clearCalendar('desired_date')" class="link btn_small btn_square_gray" style="width: 100px;padding: 10px 20px;position: absolute;right: 0;background:#ccc url(/assets/img/common/btn_clear.png) no-repeat center center;" />
          <!--HP{if isset($error.desired_date)}HP--><p class="form_error_message desired_date"><!--HP{$error.desired_date}HP--></p><!--HP{/if}HP-->
        </div>
        <!-- /.form_box_right -->
      </div>
      <!-- /.form_box_flex -->
      <p class="txt_c_pc elm_m_s note">※詳細をご記入いただけますと、より的確なご回答を差し上げられます。</p>
    </div>
    <!-- /.js-acc-content -->
    <!-- modal open -->
    <div class="check_privacy_wrap">
      <label class="check_privacy_label">
        <input class="check_privacy_input" type="checkbox" name="agree" id="agree" checked="checked" disabled="disabled"><span class="check_privacy_parts">
        お問い合わせには、
        <a href="<!--HP{$smarty.const.SITE_URL_PRIVACY}HP-->" class="link link_green" data-target="modal01" target="_blank">個人情報の取り扱いに関する事項</a>への同意が必要です。
        </span>
      </label>
      <span class="agree"></span>
    </div>
    <!-- ./modal open -->
    <!-- modal -->
    <div id="modal01" class="c-modal js-modal">
      <div class="c-modal_bg js-modal-close"></div>
      <div class="c-modal_content _lg">
        <div class="c-modal_content_inner">
          <div class="container">
            <p>個人情報のお取り扱いについて</p>
            <p>トラック市運営会社「株式会社ナカノオート」（以下、当社）は、個人情報の重要性を認識し、以下の取り組みを実施致しております。 当社は、お客様個人に関する情報（以下「個人情報」といいます。）を取り扱っている部門あるいは部署単位で管理責任者を置き、その管理責任者に適切な管理を行わせております。</p>
            <p>お客様から、お客様の個人情報を取得させていただく場合は、利用目的をできる限り特定するとともに、お客様に対する当社の窓口等をあらかじめ明示したうえで、必要な範囲の個人情報を取得させていただきます。</p>
            <p>当社は、お客様より取得させていただいた個人情報を適切に管理し、お客様の同意を得た会社以外の第三者に提供、開示等一切いたしません。</p>
            <p>当社が、上記におけるお客様の同意に基づき個人情報を提供する会社には、お客様の個人情報を漏洩や再提供等しないよう、契約により義務づけ、適切な管理を実施させております。</p>
            <p>当社は、当社が保有する個人情報に関して適用される法令、規範を遵守するとともに、上記各項における取り組みを適宜見直し、改善していきます。</p>
          </div>
          <a class="js-modal-close c-modal_close" href=""><span>閉じる</span></a>
        </div>
      </div>
    </div>
    <!-- ./modal -->
    <div class="txt-c">
      <div class="link btn-wrap _sp100 btn_square_green"><input class="btnSubmit" type="submit" name="send" value="同意して確認画面へ" /></div>
      <input type="hidden" name="form_url" value="<!--HP{$smarty.server.REQUEST_URI}HP-->" />
      <input type="hidden" name="mode" value="confirm" />
    </div>
    </form>
    </div>
      <figure class="pc_none"><img src="/assets/img/top/women_pc.png" alt="「車検対象者3万5000台」「全国約120のオークション会場」この２つの中から探します！" width="336" height="538" loading="lazy"></figure>
    </div>
    <div class="container">
      <ul class="e_list">
        <li>※3&nbsp;オークション会場数：2020年12月自社調べ。</li>
      </ul>
    </div>
