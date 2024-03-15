<!--HP{if !empty($relationList)||!empty($recommendList)}HP-->
    <!-- 似たトラック または　おすすめトラック-->
  <section class="sec_m_m similar">
    <div class="container">
      <div>
        <div class="ttl_link_wrap"><h2 class="ttl_recommended">
			<!--HP{if !empty($relationList)}HP--><!--HP{if !empty($carInfoDetail.name)}HP--><!--HP{$carInfoDetail.name|escape}HP-->に<!--HP{else}HP-->
				<!--HP{if !empty($searchText)}HP--><!--HP{$searchText|trim|escape}HP-->に<!--HP{else}HP--><!--HP{/if}HP--><!--HP{/if}HP-->関連するトラック<!--HP{else}HP-->おすすめのトラック<!--HP{/if}HP--></h2></div>
        <div class="flex">
		<!--HP{assign var="i" value="1"}HP-->
		<!--HP{if !empty($relationList)}HP-->
			<!--HP{assign var="list" value=$relationList}HP-->
		<!--HP{else}HP-->
			<!--HP{assign var="list" value=$recommendList}HP-->
		<!--HP{/if}HP-->
		<!--HP{foreach from=$list key=k item=v}HP-->
		<!--HP{assign var="categoryList" value=","|explode:$v.category}HP-->
          <div class="col-3 col-sp-1">
            <div class="detail_box">
            	<a href="/stock/detail/?car_id=<!--HP{$v.virtual_row_id|escape}HP-->" class="ttl_link_wrap new_link_wrap link arrow_link" target="_blank" rel="noopener">
              <p>問い合わせ番号<span><!--HP{$v.manage_code_hp|replace:'売約済み':''|escape}HP--></span></p>
              </a>
              <div class="new_detail">
                <h3><a href="/stock/detail/?mode=detail&car_id=<!--HP{$v.virtual_row_id|escape}HP-->" target="_blank" rel="noopener"><!--HP{$v.name|escape}HP--></a></h3>
                <div class="new_detail_list">
                 <!--HP{assign var="badge_category" value=","|explode:$v.category}HP-->
                <figure class="<!--HP{include file='stock/front_badge.tpl'}HP-->">
                <!--HP{if $v.status==$smarty.const.CAR_STATUS_SOLD_OPEN}HP--><div class="bg_sold_out"><!--HP{/if}HP-->
			<!--HP{if !empty($v.pictures)}HP-->
			<!--HP{assign var="pictures" value=$v.pictures|@json_decode:true}HP-->
      <a href="/stock/detail/?mode=detail&car_id=<!--HP{$v.virtual_row_id|escape}HP-->" target="_blank" rel="noopener">
			<!--HP{foreach from=$pictures key=pKey item=pVal}HP-->
				<!--HP{if isset($pKey) && $pKey == 0}HP-->
          <img src="/uploads/img/thumb/<!--HP{$pVal.thumb_file}HP-->" alt="<!--HP{$v.name|mb_substr:0:10}HP-->_<!--HP{$pVal.upload_file}HP-->_<!--HP{$v.virtual_row_id}HP-->" class="front" id="<!--HP{$v.virtual_row_id|escape}HP-->_front2" />
        <!--HP{elseif isset($pKey) && $pKey == 2}HP-->
	        <img src="/uploads/img/thumb/<!--HP{$pVal.thumb_file}HP-->" alt="<!--HP{$v.name|mb_substr:0:10}HP-->_<!--HP{$pVal.upload_file}HP-->_<!--HP{$v.virtual_row_id}HP-->" class="back" id="<!--HP{$v.virtual_row_id|escape}HP-->_back2" style="display:none;" />
					<!--HP{php}HP-->break;<!--HP{/php}HP-->
       	<!--HP{else}HP-->
       	<!--HP{/if}HP-->
			<!--HP{/foreach}HP-->
      </a>
      <!--HP{else}HP-->
              <a href="/stock/detail/?mode=detail&car_id=<!--HP{$v.virtual_row_id|escape}HP-->" target="_blank" rel="noopener"><img src="/assets/front/img/noimage_common_PC.png" alt="画像はただいま準備中です" class="noimage_pc"></a>
              <a href="/stock/detail/?mode=detail&car_id=<!--HP{$v.virtual_row_id|escape}HP-->" target="_blank" rel="noopener"><img src="/assets/front/img/noimage_common_SP.png" alt="画像はただいま準備中です" class="noimage_sp"></a>
      <!--HP{/if}HP-->
                <!--HP{if $v.status==$smarty.const.CAR_STATUS_SOLD_OPEN}HP--></div><!--HP{/if}HP-->
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
                    <dd><!--HP{if isset($brandNameOption[$v.brand_name])}HP--><!--HP{$brandNameOption[$v.brand_name]|escape}HP--><!--HP{/if}HP--></dd>
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
					<dd><!--HP{if isset($v.mileage)}HP--><!--HP{$v.mileage|number_format}HP-->km<!--HP{/if}HP--></dd>
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
<!--HP{if !empty($v.status) && ($v.status == $smarty.const.CAR_STATUS_SOLD_CLOSE || $v.status == $smarty.const.CAR_STATUS_SOLD_OPEN) }HP--><!--HP{*ステータスが売却済み*}HP-->
<!--HP{else}HP-->
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
<!--HP{/if}HP-->
                </div>
<!--HP{if !empty($v.status) && ($v.status == $smarty.const.CAR_STATUS_SOLD_OPEN || $v.status == $smarty.const.CAR_STATUS_SOLD_CLOSE)}HP-->
							<div class="top_new_btn_wrap nationwide_btn_service">
								<p class="inquiry_text">＼日本全国トラックお探しサービス／</p>
                <a href="/?inquiry_id=<!--HP{$v.virtual_row_id}HP-->#truck_search_service" class="btn_inquiry btn_resemble searchservice_btn">無料でトラックを探してもらう</a>
<!--HP{else}HP-->
              <div class="top_new_btn_wrap">

                <a href="/contact/?manage_code=<!--HP{$v.manage_code_hp}HP-->&car_id=<!--HP{$v.virtual_row_id}HP-->" class="btn_inquiry">WEBで問い合わせる</a>
<!--HP{if $isLogin}HP-->
                <a href="/member/check/?mode=favorite&<!--HP{if in_array($v.virtual_row_id, $favoriteIds)}HP-->delete<!--HP{else}HP-->set<!--HP{/if}HP-->=<!--HP{$v.virtual_row_id}HP-->" class="btn_clip">気になる! <!--HP{if in_array($v.virtual_row_id, $favoriteIds)}HP-->から削除<!--HP{else}HP-->に追加<!--HP{/if}HP--></a>
<!--HP{/if}HP-->
<!--HP{/if}HP-->
              </div>

              </div>
              <!-- /new_detail -->
            </div>
            <!-- /detail_box -->
          </div>
		<!--HP{if $i==5}HP-->
			<!--HP{php}HP-->break;<!--HP{/php}HP-->
		<!--HP{/if}HP-->
		<!--HP{assign var="i" value=$i+1}HP-->
		<!--HP{/foreach}HP-->
        </div><!-- /flex -->
        <div class="btn_wrap pc_none"><a href="/stock/list" class="link btn btn_square_green">中古トラックをもっと見る</a></div>
      </div>
    </div><!-- /container -->
  </section>
<!--HP{/if}HP-->