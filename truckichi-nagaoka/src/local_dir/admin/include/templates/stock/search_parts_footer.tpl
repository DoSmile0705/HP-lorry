<!-- モーダル　さらに詳細な条件へ -->
<div class="searchDetail">
  <form id="search-panel-footer" class="">
    <div id="" class="searchDetail_form"><div class="container">
      <div id="search-detail-basic" class="searchDetail_form_basic">
        <div class="searchDetail_formRow">
          <div class="searchDetail_formRowCol sp_fb100">
            <label class="searchDetail_form_label">価格帯</label>
            <p class="searchDetail_form_flex"><span><input type="text" name="price_min" class="searchDetail_form_inputTxt input_price"><span>円 ～ </span></span><span><input type="text" name="price_max" class="searchDetail_form_inputTxt input_price"><span>円</span></span></p>
            <p class="searchDetail_form_flex .flex_sp_btns"><input id="radio-vehicle-price" type="radio" name="price_type" value="vehicle_price" class="searchDetail_form_radio_hide"><label for="radio-vehicle-price" class="searchDetail_form_checkbox check_label_price"><span class="checkbox_view">✔</span><span class="checkbox_txt">車両価格(税込)</span></label>
            <input id="radio-total-price" type="radio" name="price_type" value="total_price" class="searchDetail_form_radio_hide">
            <label for="radio-total-price" class="searchDetail_form_checkbox check_label_price"><span class="checkbox_view">✔</span><span class="checkbox_txt">支払総額(税込)</span><a href="/campaign/help_sougaku/" class="common_icon_help searchDetail_form_help"><img src="/assets/img/common/common_ico_question.png" alt="HELP" width="18" height="18"></a></label></p>
          </div>
          <div class="searchDetail_formRowCol sp_fb100">
            <label class="searchDetail_form_label">大きさ</label>
            <div class="searchDetail_form_flex flex_sp_btns">
              <input id="checkbox-size-all" type="checkbox" name="size[]" value="0" class="searchDetail_form_checkbox_hide">
              <label for="checkbox-size-all" class="searchDetail_form_checkbox check_label_size"><span class="checkbox_view">✔</span><span class="checkbox_txt">すべて</span></label>
              <input id="checkbox-size-small" type="checkbox" name="size[]" value="3" class="searchDetail_form_checkbox_hide">
              <label for="checkbox-size-small" class="searchDetail_form_checkbox check_label_size"><span class="checkbox_view">✔</span><span class="checkbox_txt">小型</span></label>
              <input id="checkbox-size-middle" type="checkbox" name="size[]" value="4" class="searchDetail_form_checkbox_hide">
              <label for="checkbox-size-middle" class="searchDetail_form_checkbox check_label_size"><span class="checkbox_view">✔</span><span class="checkbox_txt">中型</span></label>
              <input id="checkbox-size-extra" type="checkbox" name="size[]" value="5" class="searchDetail_form_checkbox_hide">
              <label for="checkbox-size-extra" class="searchDetail_form_checkbox check_label_size"><span class="checkbox_view">✔</span><span class="checkbox_txt">増トン</span></label>
              <input id="checkbox-size-large" type="checkbox" name="size[]" value="6" class="searchDetail_form_checkbox_hide">
              <label for="checkbox-size-large" class="searchDetail_form_checkbox check_label_size"><span class="checkbox_view">✔</span><span class="checkbox_txt">大型</span></label>
              <input id="checkbox-size-1box" type="checkbox" name="size[]" value="7" class="searchDetail_form_checkbox_hide">
              <label for="checkbox-size-1box" class="searchDetail_form_checkbox check_label_size"><span class="checkbox_view">✔</span><span class="checkbox_txt">1BOX</span></label>
            </div>
          </div>
          <div class="searchDetail_formRowCol sp_fb100">
            <label class="searchDetail_form_label">キーワードで絞り込む</label>
            <p><input type="text" name="word" placeholder="例）日野　中型　4段クレーン　2.9ｔ吊" class="searchDetail_form_inputTxt input_keyword"></p>
            <p class="searchDetail_form_tags">
              <a href="/stock/list/?word=2トン" class="searchDetail_form_tag">2トン</a>
              <a href="/stock/list/?word=6段" class="searchDetail_form_tag">6段</a>
              <a href="/stock/list/?word=5段" class="searchDetail_form_tag">5段</a>
              <a href="/kaitori/" class="searchDetail_form_tag">買取特集</a>
              <a href="/powergate/" class="searchDetail_form_tag">パワーゲート特集</a>
            </p>
          </div>
        </div>
      </div>
      <div id="search-detail-expand" class="searchDetail_form_expand">
        <div class="searchDetail_formRow">
          <div class="searchDetail_formRowCol expand_col_1 sp_fb50">
            <p class="searchDetail_form_flex">
              <label class="searchDetail_form_label">メーカー</label>
              <select id="search-panel-header-maker" name="maker" class="searchDetail_form_select select_maker">
                  <option value="">選択してください</option>
                  <option value="23">いすゞ</option>
                  <option value="24">三菱ふそう</option>
                  <option value="25">日野</option>
                  <option value="26">ＵＤトラックス</option>
                  <option value="27">トヨタ</option>
                  <option value="28">日産</option>
                  <option value="29">マツダ</option>
                  <option value="30">その他(メーカー)</option>
              </select>
            </p>
          </div>
          <div class="searchDetail_formRowCol expand_col_2 sp_fb50">
            <p class="searchDetail_form_flex">
              <label class="searchDetail_form_label">車名</label>
              <select name="name" id="search-panel-header-name" class="searchDetail_form_select select_name"></select>
            </p>
          </div>
          <div class="searchDetail_formRowCol expand_col_3 sp_fb100">
            <p class="searchDetail_form_flex">
              <label class="searchDetail_form_label">年式</label>
              <select name="modelYearMin" id="search-panel-header-modelYear-min" class="searchDetail_form_select select_my">
                <option value="">下限なし</option>
                  <option value="1">1999(H11)年</option>
                  <option value="8">2000(H12)年</option>
                  <option value="9">2001(H13)年</option>
                  <option value="10">2002(H14)年</option>
                  <option value="11">2003(H15)年</option>
                  <option value="12">2004(H16)年</option>
                  <option value="13">2005(H17)年</option>
                  <option value="14">2006(H18)年</option>
                  <option value="15">2007(H19)年</option>
                  <option value="16">2008(H20)年</option>
                  <option value="17">2009(H21)年</option>
                  <option value="18">2010(H22)年</option>
                  <option value="19">2011(H23)年</option>
                  <option value="20">2012(H24)年</option>
                  <option value="21">2013(H25)年</option>
                  <option value="22">2014(H26)年</option>
                  <option value="23">2015(H27)年</option>
                  <option value="24">2016(H28)年</option>
                  <option value="25">2017(H29)年</option>
                  <option value="26">2018(H30)年</option>
                  <option value="27">2019(H31/R1)年</option>
                  <option value="28">2020(R2)年</option>
                  <option value="29">2021(R3)年</option>
              </select>
              <span> ～ </span>
              <select name="modelYearMax" id="search-panel-header-modelYear-max" class="searchDetail_form_select select_my">
                <option value="">上限なし</option>
                <option value="1">1999(H11)年</option>
                <option value="8">2000(H12)年</option>
                <option value="9">2001(H13)年</option>
                <option value="10">2002(H14)年</option>
                <option value="11">2003(H15)年</option>
                <option value="12">2004(H16)年</option>
                <option value="13">2005(H17)年</option>
                <option value="14">2006(H18)年</option>
                <option value="15">2007(H19)年</option>
                <option value="16">2008(H20)年</option>
                <option value="17">2009(H21)年</option>
                <option value="18">2010(H22)年</option>
                <option value="19">2011(H23)年</option>
                <option value="20">2012(H24)年</option>
                <option value="21">2013(H25)年</option>
                <option value="22">2014(H26)年</option>
                <option value="23">2015(H27)年</option>
                <option value="24">2016(H28)年</option>
                <option value="25">2017(H29)年</option>
                <option value="26">2018(H30)年</option>
                <option value="27">2019(H31/R1)年</option>
                <option value="28">2020(R2)年</option>
                <option value="29">2021(R3)年</option>
              </select>
            </p>
          </div>
        </div>
        <div class="searchDetail_formRow">
          <div class="searchDetail_formRowCol expand_col_1 sp_fb100">
            <p class="searchDetail_form_flex">
              <label class="searchDetail_form_label">走行距離</label>
              <select name="mileage" id="search-panel-header-mileage" class="searchDetail_form_select select_mile">
                <option value="">選択してください</option>
                <option value="53">1万km未満</option>
                <option value="54">～5万km</option>
                <option value="55">～10万km</option>
                <option value="56">～15万km</option>
                <option value="57">～20万km</option>
                <option value="58">～30万km</option>
                <option value="59">～50万km</option>
                <option value="60">50万km以上</option>
              </select>
            </p>
          </div>
          <div class="searchDetail_formRowCol expand_col_2 sp_fb100">
            <p class="searchDetail_form_flex">
              <label class="searchDetail_form_label">総重量</label>
              <select name="grossWeight" id="search-panel-header-grossWeight" class="searchDetail_form_select select_weight">
                <option value="">選択してください</option>
                <option value="78">～5t</option>
                <option value="79">5ｔ～7.5ｔ</option>
                <option value="80">7.5ｔ～8ｔ</option>
                <option value="81">8ｔ～11ｔ</option>
                <option value="82">11ｔ～20ｔ</option>
                <option value="83">20ｔ～22ｔ</option>
                <option value="84">22ｔ～25ｔ</option>
              </select>
            </p>
          </div>
          <div class="searchDetail_formRowCol expand_col_2 sp_fb100">
            <p class="searchDetail_form_flex">
              <label class="searchDetail_form_label">最大積載量</label>
              <select name="loadCapacity" id="search-panel-header-loadCapacity" class="searchDetail_form_select select_load">
                <option value="">選択してください</option>
                <option value="61">～1,000kg</option>
                <option value="62">1,001kg～1,500kg</option>
                <option value="63">1,501kg～2,000kg</option>
                <option value="64">2,001kg～2,500kg</option>
                <option value="65">2,501kg～3,000kg</option>
                <option value="66">3,001kg～3,500kg</option>
                <option value="67">3,501kg～4,000kg</option>
                <option value="68">4,001kg～10,000kg</option>
                <option value="69">10,001kg～15,000kg</option>
                <option value="70">15,001kg～</option>
              </select>
            </p>
          </div>
        </div>
        <div class="searchDetail_formRow">
          <div class="searchDetail_formRowCol expand_col_1 sp_fb100">
            <p class="searchDetail_form_flex">
              <label class="searchDetail_form_label">駆動</label>
              <select name="drive" id="search-panel-header-drive" class="searchDetail_form_select select_drive">
                <option value="">選択してください</option>
                <option value="71">2WD</option>
                <option value="72">4WD</option>
                <option value="73">6×2</option>
                <option value="74">6×4</option>
                <option value="75">8×4</option>
              </select>
            </p>
          </div>
          <div class="searchDetail_formRowCol expand_col_2 sp_fb100">
            <p class="searchDetail_form_flex">
              <label class="searchDetail_form_label">ミッション</label>
              <select name="transmission" id="search-panel-header-transmission" class="searchDetail_form_select select_transmission">
                <option value="">選択してください</option>
                <option value="85">MT</option>
                <option value="86">AT</option>
                <option value="87">その他(ミッション)</option>
              </select>
            </p>
          </div>
          <div class="searchDetail_formRowCol expand_col_2 sp_fb100">
            <p class="searchDetail_form_flex">
              <label class="searchDetail_form_label">車検</label>
              <select name="inspection" id="search-panel-header-inspection" class="searchDetail_form_select select_inspection">
                <option value="">選択してください</option>
                <option value="88">車検付</option>
                <option value="89">車検なし(抹消)</option>
                <option value="90">予備検査付</option>
              </select>
            </p>
          </div>
        </div>
      </div>
    </div></div>
    <div id="" class="searchDetail_form_control">
      <div class="container">
        <div class="searchDetail_form_controlBtns">
          <a id="search-detail-more" class="searchDetail_form_more"><span class="searchDetail_form_moreSign"></span><span class="searchDetail_form_moreTxt">さらに詳細な条件へ</span></a>
          <div class="searchDetail_form_submit">
            <button type="button" onclick="clearConditions();" class="searchDetail_form_submitClear btn_grey"><a class="searchDetail_form_submitClear_link">条件クリア</a></button>
            <button type="submit" class="searchDetail_form_submitSearch btn_green"><span class="searchDetail_form_submitSearch_link"><span>検索する</span><span class="common_link_arrow arrow_white btn_arrow"></span></span></button>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>
