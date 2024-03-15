    <section class="sec_m_m search_result_container sec_m_m_list_s">
      <div>
        <dl class="conditions">
          <dt class="ttl">検索キーワード</dt>
          <dd>
    <span id="search-option">
  <!--HP{assign var="searchText" value=""}HP-->
  <!--HP{if !empty($smarty.get.word)}HP-->
    <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$smarty.get.word}HP-->
    <!--HP{assign var="searchText" value=$searchText|replace:"　":" "}HP-->
    <!--HP{foreach from=" "|explode:$searchText|escape item="searchItem"}HP-->
      <!--HP{if !empty($searchItem)}HP-->
        <span  class="tag search-word-tag">
        <!--HP{$searchItem|escape}HP-->
        <a href="javascript:void(0)" onclick="$(this).closest('span').remove();clickWordTag();" style="text-decoration: none;color: #000;">×</a>
        </span>
      <!--HP{/if}HP-->
    <!--HP{/foreach}HP-->
  <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.keyword)}HP-->
    <!--HP{php}HP-->
    $keyword = $_GET['keyword'];
    $this->assign('keyword', $keyword);
    <!--HP{/php}HP-->
    <!--HP{assign var="n" value="1"}HP-->

    <!--HP{if !empty($keyword)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.keyword]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$keyword]|escape}HP-->
      <a href="javascript:void(0)" onclick="
        if($('select[name=&quot;shape&quot;] option:selected').val()==<!--HP{$keyword}HP-->) $('select[name=&quot;shape&quot;]').val('');
        if($('select[name=&quot;maker&quot;] option:selected').val()==<!--HP{$keyword}HP-->) $('select[name=&quot;maker&quot;]').val('');
        if($('select[name=&quot;size&quot;] option:selected').val()==<!--HP{$keyword}HP-->) $('select[name=&quot;size&quot;]').val('');
        if($('select[name=&quot;price&quot;] option:selected').val()==<!--HP{$keyword}HP-->) $('select[name=&quot;price&quot;]').val('');
        $('input[name=&quot;keyword&quot;][value=&quot;<!--HP{$keyword}HP-->&quot;]').remove();
        $(this).closest('span').remove();
        $('input[name=&quot;shape&quot;][value=&quot;<!--HP{$keyword}HP-->&quot;]').prop('checked', false).closest('label').removeClass('checked');">×</a>
      </span>
      <!--HP{assign var="n" value=$n+1}HP-->
    <!--HP{/if}HP-->

    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.shape)}HP-->
    <!--HP{php}HP-->
    $shape = $_GET['shape'];
    $this->assign('shape', $shape);
    <!--HP{/php}HP-->
    <!--HP{assign var="n" value="1"}HP-->
    <!--HP{assign displayAry []}HP-->

    <!--HP{if !empty($shape)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.shape]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.shape]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('input[name=&quot;shape&quot;][value=&quot;<!--HP{$smarty.get.shape}HP-->&quot;]').prop('checked', false).closest('label').removeClass('checked');$('select[name=&quot;shape&quot;]').val('');">×</a>
      </span>
      <!--HP{assign var="n" value=$n+1}HP-->
    <!--HP{/if}HP-->
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.maker)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$makerOption[$smarty.get.maker]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.maker]|escape}HP-->
      <a href="javascript:void(0)" onclick="$('input[name=&quot;category&quot;][value=&quot;<!--HP{$smarty.get.maker}HP-->&quot;]').remove();$(this).closest('span').remove();$('select[name=maker]').val('');$('#name-option').remove();$('select[name=name]').empty();$('select[name=name]').append($('<option />').val('').text('メーカーを選択')).attr('disabled', 'disabled').closest('span').hide();">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.name)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$brandNameOption[$smarty.get.name]}HP-->
      <span id="name-option" class="tag">
      <!--HP{$brandNameOption[$smarty.get.name]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=name]').val(0);">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.size)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.size]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.size]|escape}HP-->
      <a href="javascript:void(0)" onclick="$('input[name=&quot;category&quot;][value=&quot;<!--HP{$smarty.get.size}HP-->&quot;]').remove();$(this).closest('span').remove();$('select[name=size]').val('');$('#cabWidth-option,#tireShape-option,#bodyLength-option').remove();changeSize();">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.price)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.price]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.price]|escape}HP-->
      <a href="javascript:void(0)" onclick="$('input[name=&quot;category&quot;][value=&quot;<!--HP{$smarty.get.price}HP-->&quot;]').remove();$(this).closest('span').remove();$('select[name=price]').val('');">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.modelYearMin)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$modelYearOption[$smarty.get.modelYearMin]}HP-->
      <span class="tag">
      <!--HP{$modelYearOption[$smarty.get.modelYearMin]|escape}HP-->～
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=modelYearMin]').val('');">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.modelYearMax)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$modelYearOption[$smarty.get.modelYearMax]}HP-->
      <span class="tag">
      ～<!--HP{$modelYearOption[$smarty.get.modelYearMax]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=modelYearMax]').val('');">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.mileage)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.mileage]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.mileage]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=mileage]').val('');">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.grossWeight)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.grossWeight]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.grossWeight]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=grossWeight]').val('');">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.loadCapacity)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.loadCapacity]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.loadCapacity]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=loadCapacity]').val('');" >×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.drive)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.drive]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.drive]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=drive]').val('');" style="text-decoration: none;color: #000;">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.transmission)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.transmission]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.transmission]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=transmission]').val('');" >×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.inspection)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$categoryOption[$smarty.get.inspection]}HP-->
      <span class="tag">
      <!--HP{$categoryOption[$smarty.get.inspection]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=inspection]').val('');" >×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.cabWidth)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$cabWidthOption[$smarty.get.size][$smarty.get.cabWidth]}HP-->
      <span id="cabWidth-option" class="tag">
      <!--HP{$cabWidthOption[$smarty.get.size][$smarty.get.cabWidth]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=cabWidth]').val('');" >×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.tireShape)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$tireShapeOption[$smarty.get.size][$smarty.get.tireShape]}HP-->
      <span id="tireShape-option" class="tag">
      <!--HP{$tireShapeOption[$smarty.get.size][$smarty.get.tireShape]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=tireShape]').val('');">×</a>
      </span>
    <!--HP{/if}HP-->
    <!--HP{if !empty($smarty.get.bodyLength)}HP-->
      <!--HP{assign var="searchText" value=$searchText|cat:" "|cat:$bodyLengthOption[$smarty.get.size][$smarty.get.bodyLength]}HP-->
      <span id="bodyLength-option" class="tag">
      <!--HP{$bodyLengthOption[$smarty.get.size][$smarty.get.bodyLength]|escape}HP-->
      <a href="javascript:void(0)" onclick="$(this).closest('span').remove();$('select[name=bodyLength]').val('');">×</a>
      </span>
    <!--HP{/if}HP-->
  </span>
          </dd>
        </dl>
        <div class="result_info bg_lightblue">
          <p class="number_box"><span class="num"><!--HP{$carInfo|@count}HP--></span>台</p>
          <div class="sort_box">
            <p>並び替え：</p>
            <ul class="items">
              <li>
                <span class="category_ttl mr-2">価&emsp;格</span>
        <form id="sortPriceAsc"action="" method="get" class="sort-form">
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="price" />
          <input type="hidden" name="order" value="asc" />
          <a href="javascript:sortPriceAsc.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='price' && !empty($smarty.get.order) && $smarty.get.order=='asc'}HP--> current<!--HP{/if}HP-->">安い順</a>
        </form>
        <form id="sortPriceDesc"action="" method="get" class="sort-form">
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="price" />
          <input type="hidden" name="order" value="desc" />
          <a href="javascript:sortPriceDesc.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='price' && !empty($smarty.get.order) && $smarty.get.order=='desc'}HP--> current<!--HP{/if}HP-->">高い順</a>
        </form>
              </li>
              <li>
                <span class="category_ttl">年&emsp;式</span>
        <form id="sortModelYearAsc"action="" method="get" class="sort-form">
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="model_year" />
          <input type="hidden" name="order" value="asc" />
          <a href="javascript:sortModelYearAsc.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='model_year' && !empty($smarty.get.order) && $smarty.get.order=='asc'}HP--> current<!--HP{/if}HP-->">古い順</a>
        </form>
        <form id="sortModelYearDesc"action="" method="get" class="sort-form">
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="model_year" />
          <input type="hidden" name="order" value="desc" />
          <a href="javascript:sortModelYearDesc.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='model_year' && !empty($smarty.get.order) && $smarty.get.order=='desc'}HP--> current<!--HP{/if}HP-->">新しい順</a>
        </form>
              </li>
              <li>
                <span class="category_ttl">走行距離</span>
        <form id="sortMileageAsc"action="" method="get" class="sort-form">
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="mileage" />
          <input type="hidden" name="order" value="asc" />
          <a href="javascript:sortMileageAsc.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='mileage' && !empty($smarty.get.order) && $smarty.get.order=='asc'}HP--> current<!--HP{/if}HP-->">少ない順</a>
        </form>
        <form id="sortMileageDesc"action="" method="get" class="sort-form">
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="mileage" />
          <input type="hidden" name="order" value="desc" />
          <a href="javascript:sortMileageDesc.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='mileage' && !empty($smarty.get.order) && $smarty.get.order=='desc'}HP--> current<!--HP{/if}HP-->">多い順</a>
        </form>
              </li>
            </ul>
          </div>
        </div>
        <!-- for sp -->
        <div class="sp_result_info pc_none">
          <ul class="btn_group">
            <li class="sp_number_box sp_bg_lightblue">
              <p><span class="num"><!--HP{$carInfo|@count}HP--></span>台</p>
            </li>
            <li class="mr-35"><a href="#link_condition"><p>条件再設定</p></a></li>
          </ul>
          <p class="sp_sort_btn jsc_sp_sort_btn">並び替え</p>
        </div>
      </div>
      <div class="sp_sort_panel pc_none">
        <ul class="sp_sort_panel_category">
          <li>
            <ul class="conditions">
              <li>価&emsp;格</li>
              <li>
        <form id="sortPriceAscSP"action="" method="get">
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="price" />
          <input type="hidden" name="order" value="asc" />
          <a href="javascript:sortPriceAscSP.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='price' && !empty($smarty.get.order) && $smarty.get.order=='asc'}HP--> is_active<!--HP{/if}HP-->">安い順</a>
        </form>
              </li>
              <li>
        <form id="sortPriceDescSP"action="" method="get">
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="price" />
          <input type="hidden" name="order" value="desc" />
          <a href="javascript:sortPriceDescSP.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='price' && !empty($smarty.get.order) && $smarty.get.order=='desc'}HP--> is_active<!--HP{/if}HP-->">高い順</a>
        </form>
              </li>
            </ul>
          </li>
          <li>
            <ul class="conditions">
              <li>年&emsp;式</li>
              <li>
        <form id="sortModelYearAscSP"action="" method="get" >
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="model_year" />
          <input type="hidden" name="order" value="asc" />
          <a href="javascript:sortModelYearAscSP.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='model_year' && !empty($smarty.get.order) && $smarty.get.order=='asc'}HP--> is_active<!--HP{/if}HP-->">古い順</a>
        </form>
              </li>
              <li>
        <form id="sortModelYearDescSP"action="" method="get">
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="model_year" />
          <input type="hidden" name="order" value="desc" />
          <a href="javascript:sortModelYearDescSP.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='model_year' && !empty($smarty.get.order) && $smarty.get.order=='desc'}HP--> is_active<!--HP{/if}HP-->">新しい順</a>
        </form>
              </li>
            </ul>
          </li>
          <li>
            <ul class="conditions">
              <li>走行距離</li>
              <li>
        <form id="sortMileageAscSP"action="" method="get" >
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="mileage" />
          <input type="hidden" name="order" value="asc" />
          <a href="javascript:sortMileageAscSP.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='mileage' && !empty($smarty.get.order) && $smarty.get.order=='asc'}HP--> is_active<!--HP{/if}HP-->">少ない順</a>
        </form>
              </li>
              <li>
        <form id="sortMileageDescSP"action="" method="get" >
          <!--HP{if !empty($smarty.get)}HP-->
            <!--HP{foreach from=$smarty.get key=k item=v}HP-->
              <!--HP{if $k == 'sort' || $k == 'order'}HP-->
                <!--HP{php}HP-->continue;<!--HP{/php}HP-->
              <!--HP{/if}HP-->
              <!--HP{if is_array($v)}HP-->
                <!--HP{foreach from=$v key=vKey item=vVal}HP-->
                <input type="hidden" name="<!--HP{$k}HP-->[]" value="<!--HP{$vVal}HP-->" />
                <!--HP{/foreach}HP-->
              <!--HP{else}HP-->
              <input type="hidden" name="<!--HP{$k}HP-->" value="<!--HP{$v}HP-->" />
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
          <!--HP{/if}HP-->
          <input type="hidden" name="sort" value="mileage" />
          <input type="hidden" name="order" value="desc" />
          <a href="javascript:sortMileageDescSP.submit()" class="<!--HP{if !empty($smarty.get.sort) && $smarty.get.sort=='mileage' && !empty($smarty.get.order) && $smarty.get.order=='desc'}HP--> is_active<!--HP{/if}HP-->">多い順</a>
        </form>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    <section class="search_result_container">

  <!--HP{if !empty($carInfo)}HP-->
    <div class="container">
      <div>
        <h2 class="ttl_new">
          <p class="result_ttl">
            <img src="/assets/img/search_result/ico_flatbed_truck.svg" alt="<!--HP{if !empty($searchText)}HP-->"<!--HP{$searchText|trim|escape}HP-->"<!--HP{else}HP-->全て<!--HP{/if}HP-->の検索結果">
            <span><!--HP{if !empty($searchText)}HP--><!--HP{$searchText|trim|escape}HP--><!--HP{elseif $listMode=='history'}HP-->閲覧したトラック<!--HP{elseif $listMode=='new'}HP-->新着入庫トラック<!--HP{else}HP-->全て<!--HP{/if}HP-->の検索結果</span>
          </p>
        </h2>
      <div class="flex l_min_width">
    <!--HP{assign var="i" value="1"}HP-->
    <!--HP{foreach from=$carInfo key=k item=v}HP-->
    <!--HP{assign var="categoryList" value=","|explode:$v.category}HP-->

          <div class="col-3 col-sp-1">
            <div class="detail_box">
              <a href="/stock/detail/?car_id=<!--HP{$v.virtual_row_id|escape}HP-->" class="ttl_link_wrap new_link_wrap link arrow_link" target="_blank" rel="noopener">
              <p>問い合わせ番号<span><!--HP{$v.manage_code_hp|replace:'売約済み':''|escape}HP--></span></p>
            </a>
              <div class="new_detail">
                <h3><a href="/stock/detail/?car_id=<!--HP{$v.virtual_row_id|escape}HP-->" target="_blank" rel="noopener"><!--HP{$v.name|escape}HP--></a></h3>
                <div class="new_detail_list">
              <!--HP{assign var="badge_category" value=","|explode:$v.category}HP-->
                  <figure class="<!--HP{include file='stock/front_badge.tpl'}HP-->">
                    <div class="bg_<!--HP{include file='stock/front_badge.tpl'}HP-->">
          <!--HP{if !empty($v.pictures)}HP-->
          <!--HP{assign var="pictures" value=$v.pictures|@json_decode:true}HP-->
            <a href="/stock/detail/?car_id=<!--HP{$v.virtual_row_id|escape}HP-->" target="_blank" rel="noopener">
            <!--HP{foreach from=$pictures key=pKey item=pVal}HP-->
                <!--HP{if isset($pKey) && $pKey == 0}HP-->
                    <img src="/uploads/img/thumb/<!--HP{$pVal.thumb_file}HP-->" alt="<!--HP{$v.name|mb_substr:0:10}HP-->_<!--HP{$pVal.upload_file}HP-->_<!--HP{$v.virtual_row_id}HP-->" class="front" id="<!--HP{$v.virtual_row_id|escape}HP-->_front" />
                <!--HP{elseif isset($pKey) && $pKey == 2}HP-->
                    <img src="/uploads/img/thumb/<!--HP{$pVal.thumb_file}HP-->" alt="<!--HP{$v.name|mb_substr:0:10}HP-->_<!--HP{$pVal.upload_file}HP-->_<!--HP{$v.virtual_row_id}HP-->" class="back" id="<!--HP{$v.virtual_row_id|escape}HP-->_back" style="display:none;" />
              <!--HP{php}HP-->break;<!--HP{/php}HP-->
              <!--HP{else}HP-->
              <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
            </a>
          <!--HP{else}HP-->
                      <a href="/stock/detail/?car_id=<!--HP{$v.virtual_row_id|escape}HP-->" target="_blank" rel="noopener"><img src="/assets/front/img/noimage_common_PC.png" alt="画像はただいま準備中です" class="noimage_pc"></a>
                      <a href="/stock/detail/?car_id=<!--HP{$v.virtual_row_id|escape}HP-->" target="_blank" rel="noopener"><img src="/assets/front/img/noimage_common_SP.png" alt="画像はただいま準備中です" class="noimage_sp"></a>
          <!--HP{/if}HP-->
                    </div>
                    <figcaption>
          <!--HP{if !empty($v.catchphrase)}HP-->
            <!--HP{if $catchphraseOption[$v.catchphrase]=='フリー入力'}HP-->
              <!--HP{$v.catchphrase_free|escape}HP-->
            <!--HP{else}HP-->
              <!--HP{$catchphraseOption[$v.catchphrase]|escape}HP-->
            <!--HP{/if}HP-->
          <!--HP{/if}HP-->
        </figcaption>
                  </figure>
                  <dl class="flex">
                    <dt>メーカー</dt>
                    <dd>
          <!--HP{assign var="n" value="1"}HP-->
          <!--HP{foreach from=$categoryList key=cKey item=cVal}HP-->
            <!--HP{if isset($makerOption[$cVal])}HP-->
              <!--HP{if $n>1}HP-->,<!--HP{/if}HP--><!--HP{$makerOption[$cVal]|escape}HP-->
              <!--HP{assign var="n" value=$n+1}HP-->
            <!--HP{/if}HP-->
          <!--HP{/foreach}HP-->
                    </dd>
                    <dt>車名</dt>
                    <dd>
          <!--HP{if isset($brandNameOption[$v.brand_name])}HP-->
            <!--HP{$brandNameOption[$v.brand_name]|escape}HP-->
          <!--HP{/if}HP-->
                    </dd>
                    <dt>形状</dt>
                    <dd>
          <!--HP{assign var="n" value="1"}HP-->
          <!--HP{foreach from=$categoryList key=cKey item=cVal}HP-->
            <!--HP{if isset($shapeOption[$cVal])}HP-->
              <!--HP{if $n>1}HP-->,<!--HP{/if}HP--><!--HP{$shapeOption[$cVal]|escape}HP-->
              <!--HP{assign var="n" value=$n+1}HP-->
            <!--HP{/if}HP-->
          <!--HP{/foreach}HP-->
                    </dd>
                    <dt>年式</dt>
                    <dd><!--HP{if !empty($v.model_year)}HP--><!--HP{$modelYearOption[$v.model_year]|escape}HP--><!--HP{/if}HP--></dd>
                    <dt>走行距離</dt>
                  <dd>
          <!--HP{if isset($v.mileage)}HP-->
              <!--HP{$v.mileage|number_format}HP-->km
          <!--HP{/if}HP-->
                  </dd>
                  <dt>ミッション</dt>
                  <dd>
          <!--HP{if !empty($v.transmission)}HP-->
            <!--HP{$v.transmission|escape}HP-->
          <!--HP{else}HP-->
                  -
          <!--HP{/if}HP-->
                  </dd>
                  </dl>
                </div>
                <div class="price_box">
<!--HP{if ($login.type==$smarty.const.MEMBER_TYPE_STORE||$login.type==$smarty.const.MEMBER_TYPE_DEALER)&&$login.status==$smarty.const.MEMBER_STATUS_APPROVED }HP-->
          <!--HP{if !empty($v.display_price_business) && strpos($v.display_price_business,'円')}HP-->
          <p class="tax_included_block_label">業販価格
          <!--HP{if $v.price_business < 10000}HP-->
            <p class="tax_included_block_price"><b><!--HP{$v.display_price_business|replace:'円':'</b>円'}HP--></p>
          <!--HP{else}HP-->
            <p class="tax_included_block_price"><b><!--HP{$v.display_price_business|replace:'.':'</b>.'}HP--></p>
          <!--HP{/if}HP-->
          </p>
          <!--HP{else}HP-->
            <!--HP{if !empty($v.display_price_business)}HP-->
              価格  <!--HP{$v.display_price_business}HP-->
            <!--HP{/if}HP-->
          <!--HP{/if}HP-->
<!--HP{else}HP-->
          <!--HP{if !empty($v.display_total_pay_base) && strpos($v.display_total_pay_base,'円')}HP-->
          <p class="tax_included_block_label">支払総額（税込）
          <!--HP{if $v.total_pay_base < 10000}HP-->
            <p class="tax_included_block_price"><b><!--HP{$v.display_total_pay_base|replace:'円':'</b>円'}HP--></p>
          <!--HP{else}HP-->
            <p class="tax_included_block_price"><b><!--HP{$v.display_total_pay_base|replace:'.':'</b>.'}HP--></p>
          <!--HP{/if}HP-->
          </p>
          <!--HP{else}HP-->
            <!--HP{if !empty($v.display_total_pay_base)}HP-->
              価格  <!--HP{$v.display_total_pay_base}HP-->
            <!--HP{/if}HP-->
          <!--HP{/if}HP-->
<!--HP{/if}HP-->
                </div>
                <div class="top_new_btn_wrap">
                  <a href="/contact/?manage_code=<!--HP{$v.manage_code_hp}HP-->&car_id=<!--HP{$v.virtual_row_id}HP-->" class="btn_inquiry">WEBで問い合わせる</a>
                  <!--HP{if $isLogin}HP--><a href="/member/check/?mode=favorite&<!--HP{if in_array($v.virtual_row_id, $favoriteIds)}HP-->delete<!--HP{else}HP-->set<!--HP{/if}HP-->=<!--HP{$v.virtual_row_id}HP-->" class="btn_clip">
気になる! <!--HP{if in_array($v.virtual_row_id, $favoriteIds)}HP-->から削除<!--HP{else}HP-->に追加<!--HP{/if}HP--></a><!--HP{/if}HP-->
                </div>
              </div>
            </div>
          </div>
    <!--HP{/foreach}HP-->
        </div>
      </div>
    </div>

  <!--HP{/if}HP-->

</div>
<!--HP{include file='stock/search_parts_footer.tpl'}HP-->
