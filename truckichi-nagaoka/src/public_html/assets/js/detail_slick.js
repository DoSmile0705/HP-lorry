$(document).ready(function () {

	//* 関数
	//*********************************
	//ページ内の各スライダーにIDを付与
	function handleSliderId(id, target) {
		target.addClass('slick-' + id).attr('data-slider-id', id);
	}

	//ナビゲーションにactiveクラスを付与
	function handleActiveClass(id, current) {
		var target = window.matchMedia('(max-width: 750px)').matches ? '[data-slick-index="' + current + '"]' : '[data-nav-index="' + current + '"]';
		$('.detail_slider_nav.slick-' + id).find('figure').removeClass('is-active');
		$('.detail_slider_nav.slick-' + id).find(target).addClass('is-active');
	}

	//ナビゲーションのfigureにインデックス番号を付与
	function handleNavIndex(id) {
		$('.detail_slider_nav.slick-' + id).find('.slick-slide').not('.slick-cloned').find('figure').each(function (index, el) {
			$(el).attr('data-nav-index', index);
		});
	}

	//ナビゲーションのfigureクリックでメインスライダーをスライド
	function handleSelectedImg(id) {
		$('.detail_slider_nav.slick-' + id).find('figure').on('click', function () {
			var index = $(this).attr('data-nav-index') || $(this).attr('data-slick-index');
			$('.detail_slider.slick-' + id).slick('slickGoTo', index);
		})
	}

	//slickオプションのresponsiveが機能しないためナビゲーションスライダーは条件分岐
	function swichNavSlider() {
		if (window.matchMedia('(max-width: 750px)').matches) {
			slickNavSp();
		} else {
			slickNavPc();
		}
	}

	//* Slick
	//*********************************
	//ナビゲーションスライダー
	// PC用
	function slickNavPc() {
		$('.detail_slider_nav').each(function (id, el) {
			if ($(this).hasClass('slick-initialized') && !$(this).hasClass('is-pc')) {
				$(this).slick('unslick');
			}
			if (!$(this).hasClass('is-pc')) {
				$(this).on('init', function () {
					$(this).removeClass('is-sp');
					$(this).addClass('is-pc');
					handleSliderId(id, $(this));
					handleNavIndex(id);
					handleSelectedImg(id);
				});
				$(this).slick({
					accessibility: false,
					focusOnChange: false,
					focusOnSelect: false,
					rows: 2,
					slidesPerRow: 3,
					slidesToShow: 1,
					slidesToScroll: 1,
					arrows: true,
					infinite: true,
				})
			}
		});
	}
	// SP用
	function slickNavSp() {
		$('.detail_slider_nav').each(function (id, el) {
			if ($(this).hasClass('slick-initialized') && !$(this).hasClass('is-sp')) {
				$(this).slick('unslick');
			}
			if (!$(this).hasClass('is-sp')) {
				$(this).on('init', function () {
					$(this).removeClass('is-pc');
					$(this).addClass('is-sp');
					handleSliderId(id, $(this));
					handleSelectedImg(id);
				});
				$(this).slick({
					accessibility: false,
					focusOnChange: false,
					focusOnSelect: false,
					rows: 1,
					slidesToShow: 5,
					slidesToScroll: 1,
					swipeToSlide: true,
					arrows: true,
					infinite: true,
				})
			}
		});
	}

	// ロード時に起動
	swichNavSlider();

	// リサイズ時に起動しなおす
	$(window).on('resize', function () {
		swichNavSlider();
	})

	//メインスライダー
	$('.detail_slider').each(function (id, el) {
		$(this).on('init', function () {
			handleSliderId(id, $(this));
			handleActiveClass(id, 0);
		});
		$(this).slick({
			fade: false,
			infinite: true,
			arrows: true,
		})
		$(this).on('beforeChange', function (event, slick, currentSlide, nextSlide) {
			var navCurrent = window.matchMedia('(max-width: 750px)').matches ? nextSlide : Math.floor(nextSlide / 6);
			handleActiveClass(id, nextSlide);
			$('.detail_slider_nav.slick-' + id).slick('slickGoTo', navCurrent);
		});
	});

} );
