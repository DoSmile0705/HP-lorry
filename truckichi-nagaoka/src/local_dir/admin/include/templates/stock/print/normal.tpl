<!--HP{assign var="categoryList" value=","|explode:$carInfoDetail.category}HP-->
<!--HP{assign var="specification_select" value=","|explode:$carInfoDetail.specification_select}HP-->
<div class="wrapper print">
  <div class="container">
      <header class="not-fixed">
        <div class="inner_wraper">
          <div class="header_logo_wrap">
            <a href="/">
              <h1 class="header_logo">
               <img src="/assets/img/common/logo.svg" alt="トラック市">
               <span>長岡店</span>
              </h1>
            </a>
          </div>
          <div class="btn_print">
            <button class="btn_action_green jsc_print" onclick="window.print(); return false;" >印刷する</button>
          </div>
      </div>
    </header>
      <h2><a href="/stock/detail/?car_id=<!--HP{$carInfoDetail.virtual_row_id|escape}HP-->" style="text-decoration:underline;"><!--HP{$carInfoDetail.name|escape}HP--></a></h2>
      <div class="item_disc_board">
        <div class="img_box">
          <!--HP{if !empty($carInfoDetail.pictures)}HP-->
          <!--HP{assign var="pictures" value=$carInfoDetail.pictures|@json_decode:true}HP-->
          <!--HP{foreach from=$pictures key=pKey item=pVal}HP-->
            <img src="/uploads/<!--HP{$pVal.upload_file}HP-->" alt="<!--HP{$carInfoDetail.name|mb_substr:0:10}HP-->_<!--HP{$pVal.upload_file}HP-->_<!--HP{$carInfoDetail.virtual_row_id}HP-->">
            <!--HP{php}HP-->break;<!--HP{/php}HP-->
          <!--HP{/foreach}HP-->
          <!--HP{else}HP-->
            <img src="/assets/front/img/noimage_common_PC.png" alt="画像はただいま準備中です" class="noimage_pc">
            <img src="/assets/front/img/noimage_common_SP.png" alt="画像はただいま準備中です" class="noimage_sp">
          <!--HP{/if}HP-->
        </div>

        <div class="disc_box">
          <div class="info_board">
            <div class="tel_number">
              <div class="img_box">
                <img src="/assets/img/common/ico_footer_tel_gr.svg" alt="電話番号">
              </div>
              <p>0120-864-109</p>
            </div>
            <div class="open_hour">
              <p>受付時間：8:30~18:30(第2・4月曜日、日、祝定休)</p>
              <p>所在地：〒940-2101 新潟県長岡市寺島町857番地</p>
            </div>
          </div>
          <p class="contact_number">問い合わせ番号<span><!--HP{$carInfoDetail.manage_code_hp|replace:'売約済み':''|escape}HP--></span></p>
          <!--安心プラン追加　メンテナンス情報は下へ移動-->
          <div class="disc_caption">
          <!--HP{if !empty($carInfoDetail.catchphrase)}HP-->
            <!--HP{if $catchphraseOption[$carInfoDetail.catchphrase]=='フリー入力'}HP-->
            <p class="caption_ttl"><!--HP{$carInfoDetail.catchphrase_free|escape}HP--></p>
            <!--HP{else}HP-->
            <p class="caption_ttl"><!--HP{$catchphraseOption[$carInfoDetail.catchphrase]|escape}HP--></p>
            <!--HP{/if}HP-->
          <!--HP{/if}HP-->
          <p class="caption_txt"><!--HP{$carInfoDetail.description|escape|nl2br}HP--></p>
          </div>
        </div>
      </div>
<!--安心プラン追加　ここから-->
      <div class="print_price_flex">
        <div class="print_price_flexbox">
          <div class="detail_price_menu price_menu_general">
            <h2>基本プラン</h2>
            <div class="price_menu__price_list">
              <div class="__price_box __price_amount">
                <p class="__price_title">支払総額(税込)<a class="__link_to_plan_guide"></a></p>
                <!--HP{if !empty($carInfoDetail.display_total_pay_base)}HP-->                
                  <!--HP{if $carInfoDetail.total_pay_base == -1}HP-->
                    <span class="__price_unit"><!--HP{$carInfoDetail.display_total_pay_base}HP--></span>
                  <!--HP{elseif $carInfoDetail.total_pay_base < 10000}HP-->
                    <p class="price"><p class="__price_num"><em><!--HP{$carInfoDetail.display_total_pay_base|replace:'円':'</em><span class="__price_unit">円</span>'}HP--></p></p>
                  <!--HP{else}HP-->
                    <p class="price"><p class="__price_num"><em><!--HP{$carInfoDetail.display_total_pay_base|replace:'.':'</em>.'|replace:'万円':'<span class="__price_unit">万円</span>'}HP--></p></p>
                  <!--HP{/if}HP-->
                <!--HP{else}HP-->                
                  <span class="__price_unit">－</span>
                <!--HP{/if}HP-->
              </div>
              <div class="__price_box">
                <p class="__price_title">車両価格(税込)</p>
                <!--HP{if !empty($carInfoDetail.display_price) && $carInfoDetail.total_pay_base != -1 }HP-->
                  <p class="__price_num">
                  <!--HP{if $carInfoDetail.price<10000}HP-->
                    <!--HP{$carInfoDetail.display_price|replace:'円':'<span class="__price_unit">円</span>'}HP-->
                  <!--HP{else}HP-->
                    <!--HP{$carInfoDetail.display_price|replace:'万円':'<span class="__price_unit">万円</span>'}HP-->
                  <!--HP{/if}HP-->
                  </p>
                <!--HP{else}HP-->                
                  <span class="__price_unit">－</span>
                <!--HP{/if}HP-->
              </div>
              <div class="__price_box">
                <p class="__price_title">諸費用(税込)</p>
                <!--HP{if !empty($carInfoDetail.display_miscellaneous_expenses)}HP-->
                  <p class="__price_num">
                  <!--HP{if $carInfoDetail.miscellaneous_expenses<10000}HP-->
                    <!--HP{$carInfoDetail.display_miscellaneous_expenses|replace:'円':'<span class="__price_unit">円</span>'}HP-->
                  <!--HP{else}HP-->
                    <!--HP{$carInfoDetail.display_miscellaneous_expenses|replace:'万円':'<span class="__price_unit">万円</span>'}HP-->
                  <!--HP{/if}HP-->
                  </p>
                <!--HP{else}HP-->                
                  <span class="__price_unit">－</span></p>
                <!--HP{/if}HP-->
              </div>
            </div>
          </div>
  <!--HP{if $carInfoDetail.status==$smarty.const.CAR_STATUS_SOLD_OPEN || $carInfoDetail.status==$smarty.const.CAR_STATUS_SOLD_CLOSE
      || ($carInfoDetail.total_pay_base!=-1 && $carInfoDetail.total_pay_base==$carInfoDetail.safety_pay_base)}HP-->
        </div>
        <div class="print_price_flexbox">
  <!--HP{/if}HP-->
          <div class="detail_maintenance">
            <!--HP{if !empty($carInfoDetail.maintenance_column)||!empty($carInfoDetail.maintenance_explanation)}HP-->
            <div class="detail_maintenance__item">
              <div class="__maint_head">
                <h3>法定整備</h3>
                <span>
                <!--HP{if !empty($carInfoDetail.maintenance_column)}HP-->
                  <!--HP{$carInfoDetail.maintenance_column}HP-->
                <!--HP{/if}HP-->
                </span>
              </div>
              <!--HP{if !empty($carInfoDetail.maintenance_explanation)}HP-->
                <p class="__maint_descr">
                <!--HP{assign var="maintenance_explanation" value=$carInfoDetail.maintenance_explanation|escape|nl2br}HP-->
                <!--HP{foreach from=$smarty.const.PHP_EOL|explode:$maintenance_explanation key=k item=v}HP-->
                <!--HP{if !empty($v)}HP--><!--HP{$v}HP--><!--HP{else}HP-->&nbsp;<!--HP{/if}HP-->
                <!--HP{/foreach}HP-->
                </p>
              <!--HP{/if}HP-->
            </div>
            <!--HP{/if}HP-->
            <!--HP{if !empty($carInfoDetail.warranty_column)||!empty($carInfoDetail.warranty_explanation)}HP-->
            <div class="detail_maintenance__item">
              <div class="__maint_head">
                <h3>保証</h3>
                <span>
                <!--HP{if !empty($carInfoDetail.warranty_column)}HP-->
                  <!--HP{$carInfoDetail.warranty_column}HP-->
                <!--HP{/if}HP-->
                </span>
              </div>
              <!--HP{if !empty($carInfoDetail.warranty_explanation)}HP-->
                <p class="__maint_descr">
                <!--HP{assign var="warranty_explanation" value=$carInfoDetail.warranty_explanation|escape|nl2br}HP-->
                <!--HP{foreach from=$smarty.const.PHP_EOL|explode:$warranty_explanation key=k item=v}HP-->
                <!--HP{if !empty($v)}HP--><!--HP{$v}HP--><!--HP{else}HP-->&nbsp;<!--HP{/if}HP-->
                <!--HP{/foreach}HP-->
                </p>
              <!--HP{/if}HP-->
            </div>
           <!--HP{/if}HP-->
          </div>
        </div>
  <!--HP{if $carInfoDetail.status==$smarty.const.CAR_STATUS_SOLD_OPEN || $carInfoDetail.status==$smarty.const.CAR_STATUS_SOLD_CLOSE
      || ($carInfoDetail.total_pay_base!=-1 && $carInfoDetail.total_pay_base==$carInfoDetail.safety_pay_base)}HP-->
  <!--HP{else}HP-->
        <div class="print_price_flexbox">
          <div class="detail_price_menu price_menu_peace">
            <h2>安心プラン<a class="__link_to_plan_guide"></a></h2>
            <div class="price_menu__price_list">
              <div class="__price_box __price_amount">
                <p class="__price_title">支払総額(税込)</p>
                <!--HP{if !empty($carInfoDetail.display_safety_pay_base)}HP-->
                  <!--HP{if $carInfoDetail.safety_pay_base==-1}HP-->
                    <span class="__price_unit"><!--HP{$carInfoDetail.display_safety_pay_base}HP--></span>
                  <!--HP{elseif $carInfoDetail.safety_pay_base<10000}HP-->
                    <p class="__price_num"><em><!--HP{$carInfoDetail.display_safety_pay_base|replace:'円':'</em><span class="__price_unit">円</span>'}HP-->
                  <!--HP{else}HP-->
                    <p class="__price_num"><em><!--HP{$carInfoDetail.display_safety_pay_base|replace:'.':'</em>.'|replace:'万円':'<span class="__price_unit">万円</span>'}HP-->
                  <!--HP{/if}HP-->
               <!--HP{else}HP-->                
                  <span class="__price_unit">－</span>
                <!--HP{/if}HP-->
              </div>
              <div class="__price_box">
                <p class="__price_title">車両価格(税込)</p>
                <!--HP{if !empty($carInfoDetail.display_safety_price_base) }HP-->
                  <p class="__price_num">
                  <!--HP{if $carInfoDetail.safety_price_base<10000}HP-->
                    <!--HP{$carInfoDetail.display_safety_price_base|replace:'円':'<span class="__price_unit">円</span>'}HP-->
                  <!--HP{else}HP-->
                    <!--HP{$carInfoDetail.display_safety_price_base|replace:'万円':'<span class="__price_unit">万円</span>'}HP-->
                  <!--HP{/if}HP-->
                  </p>
                <!--HP{else}HP-->                
                  <span class="__price_unit">－</span>
                <!--HP{/if}HP-->
              </div>
              <div class="__price_box">
                <p class="__price_title">諸費用(税込)</p>
                <!--HP{if !empty($carInfoDetail.display_miscellaneous_expenses)}HP-->
                  <p class="__price_num">
                  <!--HP{if $carInfoDetail.miscellaneous_expenses<10000}HP-->
                    <!--HP{$carInfoDetail.display_miscellaneous_expenses|replace:'円':'<span class="__price_unit">円</span>'}HP-->
                  <!--HP{else}HP-->
                    <!--HP{$carInfoDetail.display_miscellaneous_expenses|replace:'万円':'<span class="__price_unit">万円</span>'}HP-->
                  <!--HP{/if}HP-->
                </p>
                <!--HP{else}HP-->                
                  <span class="__price_unit">－</span>
                <!--HP{/if}HP-->
              </div>
            </div>
          </div>
          <div class="detail_maintenance">
            <!--HP{if !empty($carInfoDetail.safety_maintenance)||!empty($carInfoDetail.safety_miscellaneous_expenses)}HP-->
            <div class="detail_maintenance__item">
              <div class="__maint_head">
                <h3>法定整備</h3>
                <span>
                <!--HP{if !empty($carInfoDetail.safety_maintenance)}HP-->
                  <!--HP{$carInfoDetail.safety_maintenance}HP-->
                <!--HP{/if}HP-->
                </span>
              </div>
              <!--HP{if !empty($carInfoDetail.safety_miscellaneous_expenses)}HP-->
                <p class="__maint_descr">
                <!--HP{assign var="safety_miscellaneous_expenses" value=$carInfoDetail.safety_miscellaneous_expenses|escape|nl2br}HP-->
                <!--HP{foreach from=$smarty.const.PHP_EOL|explode:$safety_miscellaneous_expenses key=k item=v}HP-->
                <!--HP{if !empty($v)}HP--><!--HP{$v}HP--><!--HP{else}HP-->&nbsp;<!--HP{/if}HP-->
                <!--HP{/foreach}HP-->
                </p>
              <!--HP{/if}HP-->
            <!--HP{/if}HP-->
            </div>
            <!--HP{if !empty($carInfoDetail.safety_warranty)||!empty($carInfoDetail.safety_warranty_explanation)}HP-->
            <div class="detail_maintenance__item">
              <div class="__maint_head">
                <h3>保証</h3>
                <span>
                <!--HP{if !empty($carInfoDetail.safety_warranty)}HP-->
                  <!--HP{$carInfoDetail.safety_warranty}HP-->
                <!--HP{/if}HP-->
                </span>
              </div>
              <!--HP{if !empty($carInfoDetail.safety_warranty_explanation)}HP-->
                <p class="__maint_descr">
                <!--HP{assign var="safety_warranty_explanation" value=$carInfoDetail.safety_warranty_explanation|escape|nl2br}HP-->
                <!--HP{foreach from=$smarty.const.PHP_EOL|explode:$safety_warranty_explanation key=k item=v}HP-->
                <!--HP{if !empty($v)}HP--><!--HP{$v}HP--><!--HP{else}HP-->&nbsp;<!--HP{/if}HP-->
                <!--HP{/foreach}HP-->
                </p>
              <!--HP{/if}HP-->
            </div>
           <!--HP{/if}HP-->
          </div>
        </div>
  <!--HP{/if}HP-->
  </div>
<!--安心プラン追加　ここまで-->
　    <div class="spec_block">
        <div class="inner_wrap">
          <dl>
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
          </dl>
          <dl>
            <dt>車&emsp;名</dt>
            <dd>
              <!--HP{if isset($brandNameOption[$carInfoDetail.brand_name])}HP-->
              <!--HP{$brandNameOption[$carInfoDetail.brand_name]|escape}HP-->
              <!--HP{/if}HP-->
            </dd>
            </dl>
          <dl>
            <dt>形&emsp;状</dt>
            <dd>
              <!--HP{assign var="n" value="1"}HP-->
              <!--HP{foreach from=$categoryList key=cKey item=cVal}HP-->
              <!--HP{if isset($shapeOption[$cVal])}HP-->
              <!--HP{if $n>1}HP-->,<!--HP{/if}HP--><!--HP{$shapeOption[$cVal]|escape}HP-->
              <!--HP{assign var="n" value=$n+1}HP-->
              <!--HP{/if}HP-->
              <!--HP{/foreach}HP-->
            </dd>
            </dl>
          <dl>
            <dt>年&emsp;式</dt>
            <dd>
              <!--HP{if !empty($carInfoDetail.model_year)}HP-->
              <!--HP{$modelYearOption[$carInfoDetail.model_year]|escape}HP-->
              <!--HP{/if}HP-->
            </dd>
            </dl>
          <dl>
            <dt>型&emsp;式</dt>
            <dd><!--HP{$carInfoDetail.model|escape}HP--></dd>
            </dl>
          <dl>
            <dt>走行距離</dt>
            <dd>
              <!--HP{if !empty($carInfoDetail.mileage)}HP-->
              <!--HP{$carInfoDetail.mileage|number_format}HP-->km
              <!--HP{/if}HP-->
            </dd>
            </dl>
        </div>
        <div class="inner_wrap">
          <dl>
            <dt>車検満了月</dt>
            <dd><!--HP{$carInfoDetail.inspection_date_text|escape}HP--></dd>
            </dl>
          <dl>
            <dt>最大積載量</dt>
            <dd>
          <!--HP{if isset($carInfoDetail.load_capacity_free)}HP-->
            <!--HP{if $carInfoDetail.load_capacity_free|strstr:"/"}HP-->
              <!--HP{foreach from="/"|explode:$carInfoDetail.load_capacity_free item="load_capacity_value" name='load_capacity_foreach'}HP-->
                <!--HP{if $smarty.foreach.load_capacity_foreach.last}HP-->
                  <!--HP{$load_capacity_value|number_format}HP-->kg
                <!--HP{else}HP-->
                  <!--HP{$load_capacity_value|number_format}HP-->/
                <!--HP{/if}HP-->
              <!--HP{/foreach}HP-->
            <!--HP{elseif $carInfoDetail.load_capacity_free|strstr:"／"}HP-->
              <!--HP{foreach from="／"|explode:$carInfoDetail.load_capacity_free item="load_capacity_value" name='load_capacity_foreach'}HP-->
                <!--HP{if $smarty.foreach.load_capacity_foreach.last}HP-->
                  <!--HP{$load_capacity_value|number_format}HP-->kg
                <!--HP{else}HP-->
                  <!--HP{$load_capacity_value|number_format}HP-->/
                <!--HP{/if}HP-->
              <!--HP{/foreach}HP-->
            <!--HP{else}HP-->
              <!--HP{$carInfoDetail.load_capacity_free}HP-->
            <!--HP{/if}HP-->
          <!--HP{else}HP-->
            <!--HP{if isset($carInfoDetail.load_capacity)}HP-->
              <!--HP{$carInfoDetail.load_capacity|number_format}HP-->kg
            <!--HP{/if}HP-->
          <!--HP{/if}HP-->
            </dd>
            </dl>
          <dl>
            <dt>総重量</dt>
            <dd>
          <!--HP{if isset($carInfoDetail.gross_weight_free)}HP-->
            <!--HP{if $carInfoDetail.gross_weight_free|strstr:"/"}HP-->
              <!--HP{foreach from="/"|explode:$carInfoDetail.gross_weight_free item="gross_weight_value" name='gross_weight_foreach'}HP-->
                <!--HP{if $smarty.foreach.gross_weight_foreach.last}HP-->
                  <!--HP{$gross_weight_value|number_format}HP-->kg
                <!--HP{else}HP-->
                  <!--HP{$gross_weight_value|number_format}HP-->/
                <!--HP{/if}HP-->
              <!--HP{/foreach}HP-->
            <!--HP{elseif $carInfoDetail.gross_weight_free|strstr:"／"}HP-->
              <!--HP{foreach from="／"|explode:$carInfoDetail.gross_weight_free item="gross_weight_value" name='gross_weight_foreach'}HP-->
                <!--HP{if $smarty.foreach.gross_weight_foreach.last}HP-->
                  <!--HP{$gross_weight_value|number_format}HP-->kg
                <!--HP{else}HP-->
                  <!--HP{$gross_weight_value|number_format}HP-->/
                <!--HP{/if}HP-->
              <!--HP{/foreach}HP-->
            <!--HP{else}HP-->
              <!--HP{$carInfoDetail.gross_weight_free}HP-->
            <!--HP{/if}HP-->
          <!--HP{else}HP-->
            <!--HP{if isset($carInfoDetail.gross_weight)}HP-->
              <!--HP{$carInfoDetail.gross_weight|number_format}HP-->kg
            <!--HP{/if}HP-->
          <!--HP{/if}HP-->
            </dd>
            </dl>
          <dl>
            <dt>ミッション</dt>
            <dd><!--HP{$carInfoDetail.transmission|escape}HP--></dd>
          </dl>


          <dl>
            <dt>駆&emsp;動</dt>
            <dd>
              <!--HP{assign var="n" value="1"}HP-->
              <!--HP{foreach from=$categoryList key=cKey item=cVal}HP-->
              <!--HP{if isset($driveOption[$cVal])}HP-->
              <!--HP{if $n>1}HP-->,<!--HP{/if}HP--><!--HP{$driveOption[$cVal]|escape}HP-->
              <!--HP{assign var="n" value=$n+1}HP-->
              <!--HP{/if}HP-->
              <!--HP{/foreach}HP-->
            </dd>
          </dl>
          <dl>
            <dt>定&emsp;員</dt>
            <dd>
            <!--HP{if isset($carInfoDetail.capacity)}HP-->
              <!--HP{if is_numeric($carInfoDetail.capacity)}HP-->
                <!--HP{$carInfoDetail.capacity|number_format}HP-->人
              <!--HP{else}HP-->
                <!--HP{$carInfoDetail.capacity}HP-->人
              <!--HP{/if}HP-->
            <!--HP{/if}HP-->
            </dd>
          </dl>
      </div>
      <div class="inner_wrap last_item">
          <dl>
            <dt>燃&emsp;料</dt>
            <dd><!--HP{$carInfoDetail.fuel|escape}HP--></dd>
          </dl>
          <dl>
            <dt>排気量</dt>
            <dd>
              <!--HP{if !empty($carInfoDetail.displacement)}HP-->
              <!--HP{$carInfoDetail.displacement|escape}HP-->cc
              <!--HP{/if}HP-->
            </dd>
          </dl>
          <dl>
            <dt>以前使用地</dt>
            <dd><!--HP{$carInfoDetail.used_place|escape}HP--></dd>
          </dl>
          <dl>
            <dt>荷台寸法(cm)</dt>
            <dd><!--HP{$carInfoDetail.bed_size|escape}HP--></dd>
          </dl>
          <dl>
            <dt>修復歴</dt>
            <dd><!--HP{$carInfoDetail.repair_history|escape}HP--></dd>
          </dl>
          <dl>
            <dt>リサイクル料金</dt>
            <dd>
              <!--HP{if !empty($carInfoDetail.recycling_fee)}HP-->
              <!--HP{$carInfoDetail.recycling_fee|number_format}HP-->円(税込)
              <!--HP{/if}HP-->
            </dd>
        </div>
      </div>
      <ul class="disc_txt_board">
        <li>
           <!--HP{assign var="specification" value=$carInfoDetail.specification|escape|nl2br}HP-->
          <p class="description_ttl">上物</p>
          <p class="description_txt">
          <!--HP{foreach from=$smarty.const.PHP_EOL|explode:$specification key=k item=v}HP-->
          <!--HP{if !empty($v)}HP--><!--HP{$v}HP--><!--HP{else}HP-->&nbsp;<!--HP{/if}HP-->
          <!--HP{/foreach}HP-->
          </p>
        </li>
      </ul>

      <ul class="disc_txt_board">
        <li>
          <!--HP{assign var="memo" value=$carInfoDetail.memo|escape|nl2br}HP-->
          <p class="description_ttl">備考</p>
          <p class="description_txt">
          <!--HP{foreach from=$smarty.const.PHP_EOL|explode:$memo key=k item=v}HP-->
            <!--HP{if !empty($v)}HP--><!--HP{$v}HP--><!--HP{else}HP-->&nbsp;<!--HP{/if}HP-->
          <!--HP{/foreach}HP-->
          </p>
        </li>
        <li>
          <p class="description_ttl">装備仕様</p>
          <!--HP{foreach from=$specificationOption key=k item=v}HP-->
            <!--HP{if $k == 1}HP-->
            <ul class="description_icon_group">
              <!--HP{foreach from=$v key=k2 item=v2}HP-->
              <li class="<!--HP{if in_array($v2.id, $specification_select)}HP-->equipment<!--HP{else}HP-->no_equipment<!--HP{/if}HP-->"><!--HP{if in_array($v2.id, $specification_select)}HP-->○<!--HP{else}HP-->×<!--HP{/if}HP--><!--HP{$v2.specification|escape}HP--></li>
              <!--HP{/foreach}HP-->
            </ul>
            <!--HP{elseif $k== 2}HP-->
            <ul class="description_icon_group">
              <!--HP{foreach from=$v key=k2 item=v2}HP-->
              <li class="<!--HP{if in_array($v2.id, $specification_select)}HP-->equipment<!--HP{else}HP-->no_equipment<!--HP{/if}HP-->"><!--HP{if in_array($v2.id, $specification_select)}HP-->○<!--HP{else}HP-->×<!--HP{/if}HP--><!--HP{$v2.specification|escape}HP--></li>
              <!--HP{/foreach}HP-->
            </ul>
            <!--HP{elseif $k== 3}HP-->
            <ul class="description_icon_group">
              <!--HP{foreach from=$v key=k2 item=v2}HP-->
              <li class="<!--HP{if in_array($v2.id, $specification_select)}HP-->equipment<!--HP{else}HP-->no_equipment<!--HP{/if}HP-->"><!--HP{if in_array($v2.id, $specification_select)}HP-->○<!--HP{else}HP-->×<!--HP{/if}HP--><!--HP{$v2.specification|escape}HP--></li>
              <!--HP{/foreach}HP-->
            </ul>
            <!--HP{else}HP-->
            <ul class="description_icon_group">
              <!--HP{foreach from=$v key=k2 item=v2}HP-->
              <li class="<!--HP{if in_array($v2.id, $specification_select)}HP-->equipment<!--HP{else}HP-->no_equipment<!--HP{/if}HP-->"><!--HP{if in_array($v2.id, $specification_select)}HP-->○<!--HP{else}HP-->×<!--HP{/if}HP--><!--HP{$v2.specification|escape}HP--></li>
              <!--HP{/foreach}HP-->
            </ul>
            <!--HP{/if}HP-->
            <!--HP{/foreach}HP-->
        </li>
      </ul>

      <!--HP{if !empty($carInfoDetail.state_table_picture)}HP-->
      <div class="pagebreak"></div>
      <div>
        <!--HP{if $carInfoDetail.state_table_picture_pdf_flg}HP-->
        <canvas id="state_table" ref="state_table" style="width: 100%;" />
        <!--HP{else}HP-->
        <img src="/uploads/vt_car_info_state_table_picture_<!--HP{$carInfoDetail.virtual_row_id|string_format:"%010d"}HP-->" style="width: 100%;" alt="状態表">
      <!--HP{/if}HP-->
      </div>
      <!--HP{/if}HP-->


      <!--HP{if !empty($carInfoDetail.inspection_certificate_picture)}HP-->
      <div class="pagebreak"></div>
        <!--HP{if $carInfoDetail.inspection_certificate_picture_pdf_flg}HP-->
        <div>
          <canvas id="inspection_certificate" ref="inspection_certificate" style="width: 100%;" />
        </div>
        <!--HP{else}HP-->
        <div class="rotate_img">
          <img src="/uploads/vt_car_info_inspection_certificate_picture_<!--HP{$carInfoDetail.virtual_row_id|string_format:"%010d"}HP-->" alt="車検証">
        </div>
        <div class="rotate_margin"></div>
      <!--HP{/if}HP-->
      <!--HP{/if}HP-->

      <!--HP{if !empty($carInfoDetail.pictures)}HP-->      
      <div class="pagebreak"></div>
      <ul class="thumbnail">
        <!--HP{assign var="pictures" value=$carInfoDetail.pictures|@json_decode:true}HP-->
        <!--HP{foreach from=$pictures key=pKey item=pVal}HP-->
        <li><img src="/uploads/<!--HP{$pVal.upload_file}HP-->" alt="<!--HP{$carInfoDetail.name|mb_substr:0:10}HP-->_<!--HP{$pVal.upload_file}HP-->_<!--HP{$carInfoDetail.virtual_row_id}HP-->"></li>
        <!--HP{/foreach}HP-->
      </ul>
      <!--HP{/if}HP-->

  </div>
</div>
  <script src="/assets/js/print.js"></script>
  <script type="text/javascript" src="/assets/js/pdfjs/build/pdf.js"></script>
  <script type="text/javascript">

var pdfjsLib = window['pdfjs-dist/build/pdf'];

// The workerSrc property shall be specified.
pdfjsLib.workerSrc = '/assets/js/pdfjs/build/pdf.worker.js';

<!--HP{if $carInfoDetail.inspection_certificate_picture_pdf_flg}HP-->
$(".btn_action_green").prop("disabled", true);
var inspection_certificate = "/uploads/vt_car_info_inspection_certificate_picture_<!--HP{$carInfoDetail.virtual_row_id|string_format:"%010d"}HP-->";

var canvas_inspection_certificate = document.getElementById('inspection_certificate');
var loadingTask = pdfjsLib.getDocument(inspection_certificate);
loadingTask.promise.then(function(pdf) {
     return pdf.getPage(1);

}).then(function (page) {
        // Canvas に1ページ目の内容を描画
       //でもCanvasは非表示にする
        var scale = 2;

    var viewport = page.getViewport({scale: scale});
    var context = canvas_inspection_certificate.getContext('2d');
    if ( viewport.width > viewport.height){	//縦より横が大きい場合
        canvas_inspection_certificate.height = viewport.width;
        canvas_inspection_certificate.width = viewport.height;
        context.translate(parseInt(viewport.height), 0);
        context.rotate(90/180*Math.PI);	//90度回転
    }else{
        canvas_inspection_certificate.height = viewport.height;
        canvas_inspection_certificate.width = viewport.width;
    }
        var renderContext = {
            canvasContext: context,
            viewport: viewport
        };

         return page.render(renderContext);

}).then(() => {
            return new Promise(resolve => {
                canvas_inspection_certificate.toBlob(blob => {
                    resolve(blob);
                }, "image/png")}).then(() =>{
              $(".btn_action_green").prop("disabled", false);
            })
  });

<!--HP{/if}HP-->
<!--HP{if $carInfoDetail.state_table_picture_pdf_flg}HP-->
$(".btn_action_green").prop("disabled", true);
var state_table = "/uploads/vt_car_info_state_table_picture_<!--HP{$carInfoDetail.virtual_row_id|string_format:"%010d"}HP-->";

var canvas_state_table = document.getElementById('state_table');
var loadingTask = pdfjsLib.getDocument(state_table);
loadingTask.promise.then(function(pdf) {
     return pdf.getPage(1);

}).then(function (page) {
        // Canvas に1ページ目の内容を描画
       //でもCanvasは非表示にする
    var scale = 2;
    var viewport = page.getViewport({scale: scale});
        var context = canvas_state_table.getContext('2d');
    if ( viewport.width > viewport.height){	//縦より横が大きい場合
        canvas_state_table.height = viewport.width;
        canvas_state_table.width = viewport.height;
        context.translate(parseInt(viewport.height), 0);
        context.rotate(90/180*Math.PI);	//90度回転
    }else{
        canvas_state_table.height = viewport.height;
        canvas_state_table.width = viewport.width;
    }
        var renderContext = {
            canvasContext: context,
            viewport: viewport
        };

         return page.render(renderContext);

}).then(() => {
            return new Promise(resolve => {
                canvas_state_table.toBlob(blob => {
                    resolve(blob);
                }, "image/png")}).then(() =>{
              $(".btn_action_green").prop("disabled", false);
            })
  });
<!--HP{/if}HP-->

</script>
