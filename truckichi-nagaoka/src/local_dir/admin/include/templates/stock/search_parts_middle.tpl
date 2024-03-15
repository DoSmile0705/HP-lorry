  <!-- for sp -->
  <form id="search-panel-middle" class="pc_none">
  <section class="sec_m_m pc_none sp_sarch_panel">
    <!--HP{if $searchMode=="detail"}HP-->
    <p class="lead_txt">ご希望のトラックを再検索できます。</p>
    <!--HP{else}HP-->
    <p class="lead_txt">条件を指定して検索する</p>
    <!--HP{/if}HP-->
    <div class="top_btn_wrap container">
        <input type="search" class="site-search" id="site-search2" name="word" aria-label="Search" placeholder="例）日野　中型　4段クレーン　2.9ｔ吊" value="<!--HP{if !empty($smarty.get.word)}HP--><!--HP{$smarty.get.word}HP--><!--HP{/if}HP-->"><input class="site-search-btn" type="image" src="/assets/img/common/ico_search.svg" value="検索">
	<div id="key" class="tag_area">
		<!--HP{foreach from=$linkText key="key" item="row"}HP-->
			<a class="elm_m_s" href="<!--HP{$row.link_url}HP-->"><!--HP{$row.link_text|escape}HP--></a>&nbsp;
		<!--HP{/foreach}HP-->
		<!--HP{foreach from=$keywordOption key=k item=v}HP-->
			<!--HP{if $keywordCount[$k]>0}HP-->
			<a href="javascript:void(0)" class="elm_m_s" onclick="clearConditions();$('form[name=&quot;search-panel-header&quot;]').append($('<input />', {type: 'hidden', name: 'keyword', value: '<!--HP{$k}HP-->'}));$('form[name=search-panel-header]').submit()"><!--HP{$v}HP--></a>&nbsp;
			<input type="hidden" name="keyword" value="<!--HP{$k}HP-->"
			<!--HP{if isset($smarty.get.keyword) && $k == $smarty.get.keyword}HP-->
			<!--HP{else}HP-->
			disabled="disabled"
			<!--HP{/if}HP-->
			/>
			<!--HP{/if}HP-->
		<!--HP{/foreach}HP-->
        </div>
    </div>
  </section>
  <section id="search" class="top_search sec_m_m pc_none">
    <form id="search_middle">
      <div class="bg_green">
        <div class="container">
          <div class="flex form_flex top_select_wrap form_flex_4col">
              <div class="form_flex_item">
                <label for="search-panel-middel-shape" class="label_gray">形状</label>
                  <select name="search-panel-middel-shape" id="shape" class="select">
					<option value=""><!--HP{$NO_SELECT}HP--></option>
					<!--HP{foreach from=$shapeOption key=k item=v}HP-->
					<option value="<!--HP{$k}HP-->"<!--HP{if isset($smarty.get.shape) && $smarty.get.shape == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
					<!--HP{/foreach}HP-->
                </select>
              </div>
              <div class="form_flex_item">
                <label for="search-panel-middel-maker" class="label_gray">メーカー</label>
                <select name="maker" id="search-panel-middel-maker" class="select">
					<option value=""><!--HP{$NO_SELECT}HP--></option>
					<!--HP{foreach from=$makerOption key=k item=v}HP-->
					<option value="<!--HP{$k}HP-->"<!--HP{if isset($smarty.get.maker) && $smarty.get.maker == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
					<!--HP{/foreach}HP-->
                </select>
              </div>
              <div class="search_car_name form_flex_item unselect">
                <label for="search-panel-middel-name" class="label_gray">車名</label>
                <select name="name" id="search-panel-middel-name" class="select">
					<!--HP{foreach from=$carNameList key=k item=v}HP-->
					<option value="<!--HP{$k}HP-->"<!--HP{if isset($smarty.get.name) && $smarty.get.name == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
					<!--HP{/foreach}HP-->
                </select>
              </div>
              <div class="form_flex_item">
                <label for="search-panel-middel-size" class="label_gray">大きさ</label>
                <select name="size" id="search-panel-middel-size" class="select">
					<option value=""><!--HP{$NO_SELECT}HP--></option>
					<!--HP{foreach from=$sizeOption key=k item=v}HP-->
					<option value="<!--HP{$k}HP-->"<!--HP{if isset($smarty.get.size) && $smarty.get.size == $k}HP--> selected="selected"<!--HP{/if}HP-->><!--HP{$v}HP--></option>
					<!--HP{/foreach}HP-->
                </select>
              </div>
            </div>
        </div>
      </div>



      <div id="slide_contents_btn_block" class="top_btn_wrap container">
        <p class="btn_open jsc_modal_conditions_open"><span class="open"></span></p>
        <button class="link btn_small btn_square_gray" type="button" onclick="clearConditions();">条件クリア</button>
        <div class="link btn-wrap btn_square_green"><input type="button" onclick="$('#search-panel-header').submit();" value="検索する"></div>
      </div>
	<input type="hidden" name="sort" value="<!--HP{if !empty($smarty.get.sort)}HP--><!--HP{$smarty.get.sort}HP--><!--HP{/if}HP-->" />
	<input type="hidden" name="order" value="<!--HP{if !empty($smarty.get.order)}HP--><!--HP{$smarty.get.order}HP--><!--HP{/if}HP-->" />
    </form>
  </section>
  </form>
  <!-- /for sp -->