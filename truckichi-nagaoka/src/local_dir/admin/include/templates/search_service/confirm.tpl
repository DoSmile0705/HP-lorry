  <main>
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="<!--HP{$smarty.const.SITE_TOP_URL}HP-->" class="ico_bc_home">中古トラックのトラック市長岡店</a></li>
        <li><a href="#">日本全国トラックお探しサービス</a></li>
      </ol>
    </div>
    <section id="form" class="form_confirm">
      <div class="form_box">
      <div box_caution info_msg_box>
        <p class="box_caution info_msg_box">
          以下の内容でよろしければ「送信する」ボタンをクリックしてください。
        </p>
      </div>
          <form class="front-form search_service" name="search_service-form" action="/search_service/complete/" method="post">

            <!--HP{if !empty($carInfoDetailmail)}HP-->
            <div class="product_info_mail" id="product_info_mail">
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
                  <img src="/uploads/img/thumb/<!--HP{$pic_org}HP-->"  />
                <!--HP{else}HP-->
                  <img src="/assets/front/img/noimage_common_PC.png" alt="画像はただいま準備中です" class="sp_none">
                  <img src="/assets/front/img/noimage_common_SP.png" alt="画像はただいま準備中です" class="pc_none">
                <!--HP{/if}HP-->
              </div>
              <div class="txt_box">
                <p class="contact_number">問い合わせ番号：<!--HP{$carInfoDetailmail.manage_code_hp|replace:'売約済み':''}HP--></p>
                <p><!--HP{$carInfoDetailmail.name}HP--></p>
              </div>
            </div>
            </div>
            <br>
            <!--HP{/if}HP-->

            <div class="basic_information">
              <table class="confirm_table">
                <tbody>
                  <!-- ①お名前 -->
                  <tr>
                    <th class="required"><span>お名前</span></th>
                    <td><!--HP{$search_service.sei|escape}HP-->&emsp;<!--HP{$search_service.mei|escape}HP--></td>
                  </tr>
                  <!-- ②メアド -->
                  <tr>
                    <th class="required"><span>ご希望の連絡方法</span></th>
                    <td><!--HP{$contactMethodOption[$search_service.method_contact]|escape}HP--></td>
                  </tr>
                  <tr>
                    <th class="<!--HP{if $search_service.method_contact==$smarty.const.CONTACT_METHOD_BY_MAIL }HP-->required<!--HP{else}HP-->optional<!--HP{/if}HP-->"><span>メールアドレス</span></th>
                    <td><!--HP{$search_service.mail|escape}HP--></td>
                  </tr>
                  <!-- ③電話番号 -->
                  <tr>
                    <th class="<!--HP{if $search_service.method_contact==$smarty.const.CONTACT_METHOD_BY_TEL }HP-->required<!--HP{else}HP-->optional<!--HP{/if}HP-->"><span>電話番号</span></th>
                    <td><!--HP{$search_service.tel|escape}HP--></td>
                  </tr>
                  <!-- ④車種の形状 -->
                  <tr>
                    <th class="optional"><span>車種の形状</span></th>
                    <td><!--HP{if !empty($search_service.shape)}HP--><!--HP{$shapeOption[$search_service.shape]|escape}HP--><!--HP{else}HP-->すべて<!--HP{/if}HP--></td>
                  </tr>
                  <!-- ⑤大きさ -->
                  <tr>
                    <th class="optional"><span>大きさ</span></th>
                    <td><!--HP{if !empty($search_service.size)}HP--><!--HP{$sizeOption[$search_service.size]|escape}HP--><!--HP{else}HP-->すべて<!--HP{/if}HP--></td>
                  </tr>
                  <!-- ⑥年式 -->
                  <tr>
                    <th class="optional"><span>年　式</span></th>
                    <td><!--HP{if !empty($search_service.model_year_min)}HP--><!--HP{$modelYearOption[$search_service.model_year_min]|escape}HP--><!--HP{else}HP-->下限なし<!--HP{/if}HP-->～<!--HP{if !empty($search_service.model_year_max)}HP--><!--HP{$modelYearOption[$search_service.model_year_max]|escape}HP--><!--HP{else}HP-->上限なし<!--HP{/if}HP--></td>
                  </tr>
                  <!-- ⑦価格 -->
                  <tr>
                    <th class="optional"><span>価　格</span></th>
                    <td><!--HP{if !empty($search_service.price_mini)}HP--><!--HP{$priceOption[$search_service.price_mini]|escape}HP--><!--HP{else}HP-->下限なし<!--HP{/if}HP-->～<!--HP{if !empty($search_service.price_max)}HP--><!--HP{$priceOption[$search_service.price_max]|escape}HP--><!--HP{else}HP-->上限なし<!--HP{/if}HP--></td>
                  </tr>
                  <!-- ⑧会社名 -->
                  <tr>
                    <th class="optional"><span>会社名</span></th>
                    <td><!--HP{$search_service.corporate_name|escape}HP--></td>
                  </tr>

                  <!-- ⑨住所 -->
                  <tr>
                    <th class="optional"><span>住　所</span></th>
                    <td><!--HP{if !empty($search_service.zip)}HP-->〒<!--HP{$search_service.zip|escape}HP--><!--HP{/if}HP--><!--HP{if !empty($search_service.zip)&&!empty($search_service.address)}HP--><br><!--HP{/if}HP--><!--HP{if !empty($search_service.address)}HP--><!--HP{$search_service.address|escape}HP--><!--HP{/if}HP--></td>
                  </tr>
                  <!-- ⑩走行距離 -->
                  <tr>
                    <th class="optional"><span>走行距離</span></th>
                    <td><!--HP{$search_service.mileage|escape}HP--></td>
                  </tr>
                  <!-- ⑪その他 -->
                  <tr>
                    <th class="optional"><span>その他</span></th>
                    <td><!--HP{$search_service.others|escape|nl2br}HP--></td>
                  </tr>
                  <!-- ⑫納車希望日 -->
                  <tr>
                    <th class="optional"><span>納車希望日</span></th>
                    <td><!--HP{$search_service.desired_date|escape}HP--></td>
                  </tr>

                </tbody>
              </table>
              <!--/confirm_table-->
            </div>
            <!-- modal open -->
            <div class="check_privacy_wrap">
            <label class="check_privacy_label">
                <input class="check_privacy_input" type="checkbox" name="agree" id="agree" checked="checked" disabled="disabled"><span class="check_privacy_parts"><input type="hidden" name="agree" value="1" />
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
            <div class="confirm_btn_wrap">
              <div class="link btn_confirm_back"><input type="button" value="戻る" onclick="postBack('<!--HP{$search_service.form_url}HP-->#truck_search_service');" /></div>
              <div class="link btn-wrap btn_square_green"><input type="submit" name="send" value="送信する" /></div>
              <input type="hidden" name="mode" value="complete" />
            </div>
            <!-- /.confirm_btn_wrap -->
          </form>
        </div>
        <!--form_box-->
      </section>
  </main>
