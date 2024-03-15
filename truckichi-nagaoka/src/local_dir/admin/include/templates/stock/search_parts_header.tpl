<form name="search-panel-header" id="search-panel-header" action="/stock/list/">
  <div id="search2" class="search_select bg_green">
    <div class="container">
      <div class="search_select_wrap">
        <input type="checkbox" class="search_selectInput" id="radio12" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '12'}));$('form[name=search-shape]').submit();"/>
        <label for="radio12" class="search_select_btn ico_crane">
          <span class="search_select_btnTxt">クレーン車</span></label>
        <input type="checkbox" class="search_selectInput" id="radio8" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '8'}));$('form[name=search-shape]').submit();"/>
        <label for="radio8" class="search_select_btn ico_flat">
          <span class="search_select_btnTxt">平ボデー</span></label>
        <input type="checkbox" class="search_selectInput" id="radio9" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '9'}));$('form[name=search-shape]').submit();"/>
        <label for="radio9" class="search_select_btn ico_dump">
          <span class="search_select_btnTxt">ダンプ</span></label>
        <input type="checkbox" class="search_selectInput" id="radio10" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '10'}));$('form[name=search-shape]').submit();"/>
        <label for="radio10" class="search_select_btn ico_wcab">
          <span class="search_select_btnTxt">Wキャブ</span></label>
        <input type="checkbox" class="search_selectInput" id="radio11" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '11'}));$('form[name=search-shape]').submit();"/>
        <label for="radio11" class="search_select_btn ico_power">
          <span class="search_select_btnTxt">パワーゲート</span></label>
        <input type="checkbox" class="search_selectInput" id="radio13" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '13'}));$('form[name=search-shape]').submit();"/>
        <label for="radio13" class="search_select_btn ico_alumi">
          <span class="search_select_btnTxt">アルミバン</span></label>
        <input type="checkbox" class="search_selectInput" id="radio15" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '15'}));$('form[name=search-shape]').submit();"/>
        <label for="radio15" class="search_select_btn ico_refrige">
          <span class="search_select_btnTxt">冷凍車</span></label>
        <input type="checkbox" class="search_selectInput" id="radio14" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '14'}));$('form[name=search-shape]').submit();"/>
        <label for="radio14" class="search_select_btn ico_wing">
          <span class="search_select_btnTxt">ウイング</span></label>
        <input type="checkbox" class="search_selectInput" id="radio16" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '16'}));$('form[name=search-shape]').submit();"/>
        <label for="radio16" class="search_select_btn ico_1box">
          <span class="search_select_btnTxt">1BOX</span></label>
        <input type="checkbox" class="search_selectInput" id="radio22" name="" value="" onclick="clearConditions();$('form[name=&quot;search-shape&quot;]').append($('<input />', {type: 'hidden', name: 'shape', value: '22'}));$('form[name=search-shape]').submit();"/>
        <label for="radio22" class="search_select_btn ico_other">
          <span class="search_select_btnTxt">その他・特殊車</span></label>
        <label class="search_select_membership pc_none">
          <a href="/member/guide/">
            <p class="search_select_membershipTtl bg_green">会員特典</p>
            <p  class="search_select_membershipTxt"><span class="color_green">気になるトラックの<br>値下げ情報お知らせ！</span><span class="common_link_arrow arrow_green"></span></p>
          </a>
        </label>
      </div>
    </div>
  </div>
</form>
<form name="search-shape" action="/stock/list/"><!--形状アイコン検索用 -->
</form>