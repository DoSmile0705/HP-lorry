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
<div id="contents_wrap" class="content">
	<!-- right_area-->
	<div id="right_area" class="card">
		<!--HP{$content}HP-->
	</div>
	<!-- /right_area-->
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