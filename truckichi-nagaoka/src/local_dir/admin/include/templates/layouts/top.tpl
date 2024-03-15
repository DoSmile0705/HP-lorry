<!--HP{$header}HP-->
<body>
<div class="wrapper">
	
<!-- side_bar-->
<!--HP{$sideBar}HP-->
<!-- /side_bar -->
	
<div class="main-panel">

<!-- menu_area-->
<!--HP{$menuArea}HP-->
<!-- /menu_area -->

<!-- item_area -->
<div class="input_area_container">
<!--HP{if $isAdmin == 1}HP-->
	<!--HP{$itemMenu}HP-->
<!--HP{/if}HP-->
</div>
<!-- /item_area -->

<!-- contents -->
<div id="contents_wrap">
	<!--<div id="contents" class="clearfix">   -->
		<table class="table table-sm" style="width:100%;">
		<tr>
			<td style="vertical-align:top;">
				<!-- right_area-->
				<div id="right_area">
					<!--HP{$informationArea}HP-->
					<!--HP{$content}HP-->
				</div>
				<!-- /right_area-->
			</td>
		</tr>
		</table>
	<!--</div> -->
</div>
<!-- /contents -->
<!-- footer -->
<!--HP{$footContent}HP-->
<!-- /footer -->
</div>	<!--main-panel-->
<!--HP{$defaultJs}HP-->
<!--HP{$contentJs}HP-->
</div>	<!--wrapper-->
</body>
<!--HP{$footer}HP-->