<!--HP{if $v.status==$smarty.const.CAR_STATUS_SOLD_OPEN}HP-->sold_out<!--HP{elseif $v.status==$smarty.const.CAR_STATUS_NEGOTIATION}HP-->sale_pending<!--HP{elseif in_array($smarty.const.BADGE_CAR_CATEGORY_CAMPAIGN,$badge_category)}HP-->campaign<!--HP{elseif $v.new_arrival_flg}HP-->new<!--HP{/if}HP-->