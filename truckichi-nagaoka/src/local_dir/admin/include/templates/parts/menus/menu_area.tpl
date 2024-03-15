<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
	<div class="container-fluid">
		<div class="navbar-wrapper">
			<div class="navbar-minimize">
				<button id="minimizeSidebar" class="btn btn-icon btn-round">
					<i class="nc-icon nc-minimal-right text-center visible-on-sidebar-mini"></i>
					<i class="nc-icon nc-minimal-left text-center visible-on-sidebar-regular"></i>
				</button>
			</div>
			<div class="navbar-toggle">
				<button type="button" class="navbar-toggler">
					<span class="navbar-toggler-bar bar1"></span>
					<span class="navbar-toggler-bar bar2"></span>
					<span class="navbar-toggler-bar bar3"></span>
				</button>
			</div>
			<!--MENUのロゴ「BMC」非表示にする
			<a href="./" title="マイページ"><img alt="" src="<!--HP{$documentRoot}HP-->img/logo.png" style="height:20px;"></a>-->
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-bar navbar-kebab"></span>
			<span class="navbar-toggler-bar navbar-kebab"></span>
			<span class="navbar-toggler-bar navbar-kebab"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end" id="navigation">

			<ul class="navbar-nav">

				<!--HP{if $isAdmin == 1}HP-->
				<li class="nav-item">
					<a class="nav-link btn-magnify" href="#" id="item_hide">
						<p>
							<span class="nc-icon nc-layout-11"></span>
							<span>オブジェクト非表示</span>
						</p>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link btn-magnify" href="#" id="item_show">
						<p>
							<span class="nc-icon nc-layout-11"></span>
							<span>オブジェクト表示</span>
						</p>
					</a>
				</li>
				<!--HP{/if}HP-->

				<li class="nav-item">
					<a class="nav-link btn-magnify" href="./?mode=logout">
						<p>
							<span class="nc-icon nc-circle-10" aria-hidden="true"></span>
							<span>ログアウト</span>
						</p>
					</a>
				</li>

			</ul>
		</div>
	</div>
</nav>
<!-- End Navbar -->
