<!--
  閲覧したトラック、気になるトラック 共通で使用するトラック一覧テーブル
-->
<div class="truck_list" data-simplebar data-simplebar-auto-hide="false">
  <table class="truck_listTable">
    <thead>
      <tr class=""><td class="truck_listTable_blank"></td><th class="truck_listTable_th bg_lightgreen"></th><th class="truck_listTable_th"><span class="truck_listTable_hr">問い合わせ番号</span></th><th class="truck_listTable_th jsc-row-title"><div class="jsc-td-title"></div></th><th class="truck_listTable_th"><span class="truck_listTable_hr">支払総額(税込)</span></th><th class="truck_listTable_th"><span class="truck_listTable_hr">車両価格(税込)</span></th><th class="truck_listTable_th"><span class="truck_listTable_hr">諸費用(税込)</span></th><th class="truck_listTable_th"><span class="truck_listTable_hr">メーカー</span></th><th class="truck_listTable_th space_1em"><span class="truck_listTable_hr">車名</span></th><th class="truck_listTable_th space_1em"><span class="truck_listTable_hr">形状</span></th><th class="truck_listTable_th space_1em"><span class="truck_listTable_hr">年式</span></th><th class="truck_listTable_th"><span class="truck_listTable_hr">走行距離</span></th><th class="truck_listTable_th"><span class="truck_listTable_hr">車検満了月</span></th><th class="truck_listTable_th"><span class="truck_listTable_hr">最大積載量</span></th><th class="truck_listTable_th"><span class="truck_listTable_hr">総重量</span></th><th class="truck_listTable_th truck_listTable_form "><span class="truck_listTable_hr ">お問い合わせ</span></th></tr>
    </thead>
    <tbody>
      <!-- リストのトラック数分繰り返しここから -->
      <tr><!-- 販売中 -->
        <td class="truck_listTable_td truck_listTable_trash "><a href="/member/browsing_history/?delete=" class="truck_listTable_hr"><img src="/assets/img/common/common_ico_trash.png" alt="" width="14" height="17" class="truck_listTable_trashIco"><span class="truck_listTable_trashTxt">削除</span></a></td>
        <td class="truck_listTable_td bg_lightgreen truck_listTable_check"><label class=""><input type="checkbox" name="manage_code[]" value="<!-- 管理コード -->" class="truck_listTable_checkInput"><input type="checkbox" name="car_id[]" value="<!-- 車両ID -->" class="truck_listTable_checkInput"><span class="truck_listTable_checkBox">
          <svg xmlns="http://www.w3.org/2000/svg" width="9.792" height="7.084" viewBox="0 0 9.792 7.084"><path id="checkbox_tick_mark_accept_your_checklist_queries" data-name="checkbox tick mark accept your checklist queries" d="M16.172,7.994a.832.832,0,0,1,0,1.178l-5.417,5.417a.831.831,0,0,1-1.178,0L6.869,11.881A.833.833,0,0,1,8.048,10.7l2.119,2.119,4.827-4.827a.832.832,0,0,1,1.178,0Z" transform="translate(-6.625 -7.75)" fill="#ccc"/></svg>
        </span></label></td>
        <td class="truck_listTable_td"><a href="/stock/detail/?car_id=" class="truck_listTable_contactNo truck_listTable_hr">F904</a></td>
        <!-- 新着入庫は<span class="truck_listTable_titleFigTag">に 
          -- 'tag_new'クラスを付けてNEWと表示してください。
          -- タグが何もない場合は空<span>のままでも、<span>自体を表示しなくても
          -- どちらでもいいです。
         -->
        <td class="truck_listTable_td truck_listTable_title jsc-row-title"><div class="truck_listTable_hr jsc-td-title">
          <figure class="truck_listTable_titleFig"><img src="/uploads/test/3050_7542_1685420897_1.webp" alt="" width="200" height="150" loading="lazy" class="truck_listTable_titleFigImg"><span class="truck_listTable_titleFigTag truck_listTable_hr tag_new">NEW</span></figure><h2 class="truck_listTable_titleName"><a href="/stock/detail/?car_id=">【年次点検済】レンジャー 3.75t 増トン ワイドベッド付 アルミブロック ユニック5段クレーン付 240ps</a></h2>
        </div></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 支払総額 -->1401</em>.7</span>万円</span></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 車両価格 -->1386</em>.0</span>万円</span></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 諸費用 -->15</em>.7</span>万円</span></td>
        <td class="truck_listTable_td "><!-- メーカー --><span class="truck_listTable_hr">いすゞ</span></td>
        <td class="truck_listTable_td "><!-- 車名 --><span class="truck_listTable_hr">エルフ</span></td>
        <td class="truck_listTable_td "><!-- 形状 --><span class="truck_listTable_hr">平ボデー</span></td>
        <td class="truck_listTable_td "><!-- 年式 --><span class="truck_listTable_hr">2017(H29)年</span></td>
        <td class="truck_listTable_td "><!-- 走行距離 --><span class="truck_listTable_hr">4.705km</span></td>
        <td class="truck_listTable_td "><!-- 車検満了月 --><span class="truck_listTable_hr">令和3年9月</span></td>
        <td class="truck_listTable_td "><!-- 最大積載量 --><span class="truck_listTable_hr">2.000kg</span></td>
        <td class="truck_listTable_td "><!-- 総重量 --><span class="truck_listTable_hr">13.240kg</span></td>
        <td class="truck_listTable_td truck_listTable_form ">
          <div class="">
          <!-- 販売中ここから -->
          <button class="truck_listTable_formBtn btn_green btn_onsale"><a href="/contact/?manage_code=&car_id=" class="truck_listTable_formBtn_link truck_listTable_hr">フォームからご相談<span class="truck_listTable_formBtnArrow common_link_arrow arrow_white btn_arrow"></span></a></button>
          <!-- 販売中ここまで -->
          </div>
        </td>
      </tr>
      <tr><!-- 売約済み -->
        <td class="truck_listTable_td truck_listTable_trash "><a href="/member/browsing_history/?delete=" class="truck_listTable_hr"><img src="/assets/img/common/common_ico_trash.png" alt="" width="14" height="17" class="truck_listTable_trashIco"><span class="truck_listTable_trashTxt">削除</span></a></td>
        <td class="truck_listTable_td bg_lightgreen truck_listTable_check"><label class=""><input type="checkbox" name="manage_code[]" value="<!-- 管理コード -->" class="truck_listTable_checkInput"><input type="checkbox" name="car_id[]" value="<!-- 車両ID -->" class="truck_listTable_checkInput"><span class="truck_listTable_checkBox">
          <svg xmlns="http://www.w3.org/2000/svg" width="9.792" height="7.084" viewBox="0 0 9.792 7.084"><path id="checkbox_tick_mark_accept_your_checklist_queries" data-name="checkbox tick mark accept your checklist queries" d="M16.172,7.994a.832.832,0,0,1,0,1.178l-5.417,5.417a.831.831,0,0,1-1.178,0L6.869,11.881A.833.833,0,0,1,8.048,10.7l2.119,2.119,4.827-4.827a.832.832,0,0,1,1.178,0Z" transform="translate(-6.625 -7.75)" fill="#ccc"/></svg>
        </span></label></td>
        <td class="truck_listTable_td"><a href="/stock/detail/?car_id=" class="truck_listTable_contactNo truck_listTable_hr">F904</a></td>
        <!-- 売約済みは<figure>に 'fig_soldout'クラスを付けて、
          -- <span class="truck_listTable_titleFigTag">に 
          -- 'tag_soldout'クラスを付けて「売約済み」と表示してください。
          -- タグが何もない場合は空<span>のままでも、<span>自体を表示しなくても
          -- どちらでもいいです。
         -->
        <td class="truck_listTable_td truck_listTable_title jsc-row-title"><div class="truck_listTable_hr jsc-td-title">
          <figure class="truck_listTable_titleFig fig_soldout"><img src="/uploads/test/3050_7542_1685420897_1.webp" alt="" width="200" height="150" loading="lazy" class="truck_listTable_titleFigImg"><span class="truck_listTable_titleFigTag truck_listTable_hr tag_soldout">売約済み</span></figure><h2 class="truck_listTable_titleName"><a href="/stock/detail/?car_id="><span class="truck_listTable_hr">【年次点検済】レンジャー 3.75t 増トン ワイドベッド付 アルミブロック ユニック5段クレーン付 240ps</span></a></h2>
        </div></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 支払総額 -->1401</em>.7</span>万円</span></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 車両価格 -->1386</em>.0</span>万円</span></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 諸費用 -->15</em>.7</span>万円</span></td>
        <td class="truck_listTable_td "><!-- メーカー --><span class="truck_listTable_hr">いすゞ</span></td>
        <td class="truck_listTable_td "><!-- 車名 --><span class="truck_listTable_hr">エルフ</span></td>
        <td class="truck_listTable_td "><!-- 形状 --><span class="truck_listTable_hr">平ボデー</span></td>
        <td class="truck_listTable_td "><!-- 年式 --><span class="truck_listTable_hr">2017(H29)年</span></td>
        <td class="truck_listTable_td "><!-- 走行距離 --><span class="truck_listTable_hr">4.705km</span></td>
        <td class="truck_listTable_td "><!-- 車検満了月 --><span class="truck_listTable_hr">令和3年9月</span></td>
        <td class="truck_listTable_td "><!-- 最大積載量 --><span class="truck_listTable_hr">2.000kg</span></td>
        <td class="truck_listTable_td "><!-- 総重量 --><span class="truck_listTable_hr">13.240kg</span></td>
        <td class="truck_listTable_td truck_listTable_form ">
          <div class="">
          <!-- 売約済みここから -->
          <button class="truck_listTable_formBtn btn_green btn_soldout"><a href="/matching/" class="truck_listTable_formBtn_link truck_listTable_hr">トラックを探してもらう<span class="truck_listTable_formBtnArrow common_link_arrow arrow_white btn_arrow"></span></a>
          <span class="truck_listTable_formBtnFree truck_listTable_hr">無料！</span></button>
          <!-- 売約済みここまで -->
          </div>
        </td>
      </tr>
      <tr><!-- 販売中 -->
        <td class="truck_listTable_td truck_listTable_trash "><a href="/member/browsing_history/?delete=" class="truck_listTable_hr"><img src="/assets/img/common/common_ico_trash.png" alt="" width="14" height="17" class="truck_listTable_trashIco"><span class="truck_listTable_trashTxt">削除</span></a></td>
        <td class="truck_listTable_td bg_lightgreen truck_listTable_check"><label class=""><input type="checkbox" name="manage_code[]" value="<!-- 管理コード -->" class="truck_listTable_checkInput"><input type="checkbox" name="car_id[]" value="<!-- 車両ID -->" class="truck_listTable_checkInput"><span class="truck_listTable_checkBox">
          <svg xmlns="http://www.w3.org/2000/svg" width="9.792" height="7.084" viewBox="0 0 9.792 7.084"><path id="checkbox_tick_mark_accept_your_checklist_queries" data-name="checkbox tick mark accept your checklist queries" d="M16.172,7.994a.832.832,0,0,1,0,1.178l-5.417,5.417a.831.831,0,0,1-1.178,0L6.869,11.881A.833.833,0,0,1,8.048,10.7l2.119,2.119,4.827-4.827a.832.832,0,0,1,1.178,0Z" transform="translate(-6.625 -7.75)" fill="#ccc"/></svg>
        </span></label></td>
        <td class="truck_listTable_td"><a href="/stock/detail/?car_id=" class="truck_listTable_contactNo truck_listTable_hr">F904</a></td>
        <!-- 新着入庫は<span class="truck_listTable_titleFigTag">に 
          -- 'tag_new'クラスを付けてNEWと表示してください。
          -- タグが何もない場合は空<span>のままでも、<span>自体を表示しなくても
          -- どちらでもいいです。
         -->
        <td class="truck_listTable_td truck_listTable_title jsc-row-title"><div class="truck_listTable_hr jsc-td-title">
          <figure class="truck_listTable_titleFig"><img src="/uploads/test/3050_7542_1685420897_1.webp" alt="" width="200" height="150" loading="lazy" class="truck_listTable_titleFigImg"><span class="truck_listTable_titleFigTag truck_listTable_hr"></span></figure><h2 class="truck_listTable_titleName"><a href="/stock/detail/?car_id=">【年次点検済】レンジャー 3.75t 増トン ワイドベッド付 アルミブロック ユニック5段クレーン付 240ps</a></h2>
        </div></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 支払総額 -->1401</em>.7</span>万円</span></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 車両価格 -->1386</em>.0</span>万円</span></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 諸費用 -->15</em>.7</span>万円</span></td>
        <td class="truck_listTable_td "><!-- メーカー --><span class="truck_listTable_hr">いすゞ</span></td>
        <td class="truck_listTable_td "><!-- 車名 --><span class="truck_listTable_hr">エルフ</span></td>
        <td class="truck_listTable_td "><!-- 形状 --><span class="truck_listTable_hr">平ボデー</span></td>
        <td class="truck_listTable_td "><!-- 年式 --><span class="truck_listTable_hr">2017(H29)年</span></td>
        <td class="truck_listTable_td "><!-- 走行距離 --><span class="truck_listTable_hr">4.705km</span></td>
        <td class="truck_listTable_td "><!-- 車検満了月 --><span class="truck_listTable_hr">令和3年9月</span></td>
        <td class="truck_listTable_td "><!-- 最大積載量 --><span class="truck_listTable_hr">2.000kg</span></td>
        <td class="truck_listTable_td "><!-- 総重量 --><span class="truck_listTable_hr">13.240kg</span></td>
        <td class="truck_listTable_td truck_listTable_form ">
          <div class="">
          <!-- 販売中ここから -->
          <button class="truck_listTable_formBtn btn_green btn_onsale"><a href="/contact/?manage_code=&car_id=" class="truck_listTable_formBtn_link truck_listTable_hr">フォームからご相談<span class="truck_listTable_formBtnArrow common_link_arrow arrow_white btn_arrow"></span></a></button>
          <!-- 販売中ここまで -->
          </div>
        </td>
      </tr>
      <tr><!-- 販売中 -->
        <td class="truck_listTable_td truck_listTable_trash "><a href="/member/browsing_history/?delete=" class="truck_listTable_hr"><img src="/assets/img/common/common_ico_trash.png" alt="" width="14" height="17" class="truck_listTable_trashIco"><span class="truck_listTable_trashTxt">削除</span></a></td>
        <td class="truck_listTable_td bg_lightgreen truck_listTable_check"><label class=""><input type="checkbox" name="manage_code[]" value="<!-- 管理コード -->" class="truck_listTable_checkInput"><input type="checkbox" name="car_id[]" value="<!-- 車両ID -->" class="truck_listTable_checkInput"><span class="truck_listTable_checkBox">
          <svg xmlns="http://www.w3.org/2000/svg" width="9.792" height="7.084" viewBox="0 0 9.792 7.084"><path id="checkbox_tick_mark_accept_your_checklist_queries" data-name="checkbox tick mark accept your checklist queries" d="M16.172,7.994a.832.832,0,0,1,0,1.178l-5.417,5.417a.831.831,0,0,1-1.178,0L6.869,11.881A.833.833,0,0,1,8.048,10.7l2.119,2.119,4.827-4.827a.832.832,0,0,1,1.178,0Z" transform="translate(-6.625 -7.75)" fill="#ccc"/></svg>
        </span></label></td>
        <td class="truck_listTable_td"><a href="/stock/detail/?car_id=" class="truck_listTable_contactNo truck_listTable_hr">F904</a></td>
        <!-- 新着入庫は<span class="truck_listTable_titleFigTag">に 
          -- 'tag_new'クラスを付けてNEWと表示してください。
          -- タグが何もない場合は空<span>のままでも、<span>自体を表示しなくても
          -- どちらでもいいです。
         -->
        <td class="truck_listTable_td truck_listTable_title jsc-row-title"><div class="truck_listTable_hr jsc-td-title">
          <figure class="truck_listTable_titleFig"><img src="/uploads/test/3050_7542_1685420897_1.webp" alt="" width="200" height="150" loading="lazy" class="truck_listTable_titleFigImg"><span class="truck_listTable_titleFigTag truck_listTable_hr"></span></figure><h2 class="truck_listTable_titleName"><a href="/stock/detail/?car_id=">【年次点検済】レンジャー 3.75t 増トン ワイドベッド付 アルミブロック ユニック5段クレーン付 240ps車両名が長く長く長く長く長く長く長く長く長く長く長く長く長く長く長くなるとこうなる</a></h2>
        </div></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 支払総額 -->1401</em>.7</span>万円</span></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 車両価格 -->1386</em>.0</span>万円</span></td>
        <td class="truck_listTable_td truck_listTable_price"><span class="truck_listTable_hr"><span class="truck_listTable_priceNum"><em class="truck_listTable_priceNumEm"><!-- 諸費用 -->15</em>.7</span>万円</span></td>
        <td class="truck_listTable_td "><!-- メーカー --><span class="truck_listTable_hr">いすゞ</span></td>
        <td class="truck_listTable_td "><!-- 車名 --><span class="truck_listTable_hr">エルフ</span></td>
        <td class="truck_listTable_td "><!-- 形状 --><span class="truck_listTable_hr">平ボデー</span></td>
        <td class="truck_listTable_td "><!-- 年式 --><span class="truck_listTable_hr">2017(H29)年</span></td>
        <td class="truck_listTable_td "><!-- 走行距離 --><span class="truck_listTable_hr">4.705km</span></td>
        <td class="truck_listTable_td "><!-- 車検満了月 --><span class="truck_listTable_hr">令和3年9月</span></td>
        <td class="truck_listTable_td "><!-- 最大積載量 --><span class="truck_listTable_hr">2.000kg</span></td>
        <td class="truck_listTable_td "><!-- 総重量 --><span class="truck_listTable_hr">13.240kg</span></td>
        <td class="truck_listTable_td truck_listTable_form ">
          <div class="">
          <!-- 販売中ここから -->
          <button class="truck_listTable_formBtn btn_green btn_onsale"><a href="/contact/?manage_code=&car_id=" class="truck_listTable_formBtn_link truck_listTable_hr">フォームからご相談<span class="truck_listTable_formBtnArrow common_link_arrow arrow_white btn_arrow"></span></a></button>
          <!-- 販売中ここまで -->
          </div>
        </td>
      </tr>

      <!-- リストのトラック数分繰り返しここまで -->
    </tbody>
  </table>
</div>
<script>
  // iPhone対策：tableのtd/thにheightを指定していないと崩れるため
  // 高さ可変のセルの最大値を求める
  $(function(){
    let heights = [];
    $('.jsc-td-title').each(function() {
      heights.push($(this).innerHeight());
    });
    let maxh = Math.max.apply(null, heights);
    maxh += 26; // 上下paddingの分足す
    $('.jsc-td-title').each(function() {
      $(this).closest('.jsc-row-title').height(maxh);
    });
  });
</script>