<!-- side bar -->
<div class="sidebar" data-color="white" data-active-color="danger">
	<!--
	Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
	-->
	<div class="logo">
		<!-- マイページ -->
		<a href="./" title="マイページ" class="simple-text logo-normal">
			<div class="logo-image-small">
				<img alt="" src="<!--HP{$documentRoot}HP-->img/logo.png" style="height:20px;">
			</div>
		</a>
	</div>
	
	<div class="sidebar-wrapper">
		<ul class="nav">
			<!-- 管理者のメニュー -->
			<!--HP{if $isAdmin == 1}HP-->
			<!--HP{if in_array($current_page.table_name, ['MENU.PHP', 'VTABLE.PHP', 'USER.PHP','GROUP.PHP','WFTEMPLATE.PHP','PROFILE.PHP','SCREEN.PHP','COMPONENT.PHP'])}HP-->
			<li class="active">
			<!--HP{else}HP-->
			<li>
			<!--HP{/if}HP-->
				<a data-toggle="collapse" href="#side_bar_manager" aria-expanded="true">
					<i class="nc-icon nc-diamond"></i>
					<p>
						管理者
						<b class="caret"></b>
					</p>
				</a>
				
				<!--HP{if in_array($current_page.table_name, ['MENU.PHP', 'VTABLE.PHP', 'USER.PHP','GROUP.PHP','WFTEMPLATE.PHP','PROFILE.PHP','SCREEN.PHP','COMPONENT.PHP'])}HP-->
				<div class="collapse show" id="side_bar_manager">
				<!--HP{else}HP-->
				<div class="collapse" id="side_bar_manager">
				<!--HP{/if}HP-->
					<ul class="nav">
						<!--HP{if $current_page.table_name=='MENU.PHP'}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
							<a href="./menu.php">
								<span class="sidebar-mini-icon">MN</span>
								<span class="sidebar-normal"> メニュー管理 </span>
							</a>
						</li>
						<!--HP{if $current_page.table_name=='VTABLE.PHP'}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
							<a href="./vtable.php">
								<span class="sidebar-mini-icon">OB</span>
								<span class="sidebar-normal"> オブジェクト管理 </span>
							</a>
						</li>
						<!--HP{if $current_page.table_name=='USER.PHP'}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
							<a href="./user.php">
								<span class="sidebar-mini-icon">US</span>
								<span class="sidebar-normal"> ユーザー管理 </span>
							</a>
						</li>
						<!--HP{if $current_page.table_name=='GROUP.PHP'}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
							<a href="./group.php">
								<span class="sidebar-mini-icon">GR</span>
								<span class="sidebar-normal"> グループ管理 </span>
							</a>
						</li>
						<!--HP{if $current_page.table_name=='WFTEMPLATE.PHP'}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
							<a href="./wftemplate.php">
								<span class="sidebar-mini-icon">WF</span>
								<span class="sidebar-normal"> ワークフロー管理 </span>
							</a>
						</li>
						<!--HP{if $current_page.table_name=='PROFILE.PHP'}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
							<a href="./profile.php">
								<span class="sidebar-mini-icon">PR</span>
								<span class="sidebar-normal"> プロファイル管理 </span>
							</a>
						</li>
						<!--HP{if $current_page.table_name=='SCREEN.PHP'}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
							<a href="./screen.php">
								<span class="sidebar-mini-icon">LY</span>
								<span class="sidebar-normal"> レイアウト管理 </span>
							</a>
						</li>
						<!--HP{if $current_page.table_name=='COMPONENT.PHP'}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
							<a href="./component.php">
								<span class="sidebar-mini-icon">CM</span>
								<span class="sidebar-normal"> コンポーネント管理 </span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<!--HP{/if}HP-->

			<!-- vtテーブルや外部リンク -->
			<!--HP{foreach from=$menu item='v1'}HP-->
			
			<!--HP{if $v1.info.menu_layer==$smarty.const.COLUMN_VALUE_MENU_LAYER_BASE && $v1.info.menu_type==$smarty.const.COLUMN_VALUE_MENU_TYPE_COMMENT}HP-->
				<!-- 基底（親メニュー）-->
				<li>
					<a data-toggle="collapse" href="#<!--HP{$v1.info.menu_id}HP-->" aria-expanded="true">
						<i class="nc-icon nc-app"></i>
						<p>
							<!--HP{$v1.info.menu_name|escape}HP-->
							<b class="caret"></b>
						</p>
					</a>
				</li>
				<div class="collapse" id="<!--HP{$v1.info.menu_id}HP-->">
					<ul class="nav">
						<!-- 第一（子メニュー）-->
						<!--HP{foreach from=$v1.children item='c1'}HP-->
							<!--HP{if $current_page.table_name=='MANAGE.PHP' && $current_page.query==$c1.info.child_id}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
								<!--HP{if $c1.info.menu_type==$smarty.const.COLUMN_VALUE_MENU_TYPE_LINK}HP-->
								<a href="<!--HP{$c1.info.url}HP-->">
								<!--HP{else}HP-->
								<a href="./manage.php?manage_id=<!--HP{$c1.info.child_id|escape}HP-->">
								<!--HP{/if}HP-->
									<i class="nc-icon nc-tile-56"></i>
									<p><!--HP{$c1.info.menu_name|escape}HP--></p>
								</a>
							</li>
						<!--HP{/foreach}HP-->
					</ul>
				</div>
			
			<!--HP{else}HP-->
				<!-- 基底（単独メニュー）-->

				<!--HP{if $current_page.table_name=='MANAGE.PHP' && $current_page.query==$v1.info.child_id}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
					<!--HP{if $v1.info.menu_type==$smarty.const.COLUMN_VALUE_MENU_TYPE_LINK}HP-->
					<a href="<!--HP{$v1.info.url}HP-->" >
					<!--HP{else}HP-->
					<a href="./manage.php?manage_id=<!--HP{$v1.info.child_id|escape}HP-->">
					<!--HP{/if}HP-->
						<i class="nc-icon nc-tile-56"></i>
						<p><!--HP{$v1.info.menu_name|escape}HP--></p>
					</a>
				</li>

			<!--HP{/if}HP-->
				
			<!--HP{/foreach}HP-->

			<!-- マイページレイアウト設定 -->
			<!--HP{if $userMypageEditableFlg}HP-->
			<!--HP{if $current_page.table_name=='LAYOUT.PHP'}HP--><li class="active"><!--HP{else}HP--><li><!--HP{/if}HP-->
				<a href="./layout.php">
					<i class="nc-icon nc-settings"></i>
					<p>マイページレイアウト設定</p>
				</a>
			</li>
			<!--HP{/if}HP-->

		</ul>
	</div>
</div>
<!-- side bar END -->