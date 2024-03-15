<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/common.js"></script>
<script type="text/javascript">
<!--
jQuery(document).ready(function(){

	$('*[name=update_date_sYear]').attr("disabled", "disabled");
	$('*[name=update_date_sMonth]').attr("disabled", "disabled");
	$('*[name=update_date_sDay]').attr("disabled", "disabled");
	$('*[name=update_date_eYear]').attr("disabled", "disabled");
	$('*[name=update_date_eMonth]').attr("disabled", "disabled");
	$('*[name=update_date_eDay]').attr("disabled", "disabled");

	$("#amount_target").change(function() {
		var now = new Date();
		var year = "";
		var month = "";
		var day = "";

		$('*[name=update_date_sYear]').attr("disabled", "disabled");
		$('*[name=update_date_sMonth]').attr("disabled", "disabled");
		$('*[name=update_date_sDay]').attr("disabled", "disabled");
		$('*[name=update_date_eYear]').attr("disabled", "disabled");
		$('*[name=update_date_eMonth]').attr("disabled", "disabled");
		$('*[name=update_date_eDay]').attr("disabled", "disabled");

		if ($(this).val() == 1) {
			year = now.getFullYear();
			month = now.getMonth() + 1;
			if (month < 10) {
				month = "0" + month;
			}
			day = 1

			$('*[name=update_date_sYear]').val(year);
			$('*[name=update_date_sMonth]').val(month);
			$('*[name=update_date_sDay]').val(day);

			now = new Date(year, month + 1, 0);
			year = now.getFullYear();
			month = now.getMonth();
			if (month < 10) {
				month = "0" + month;
			}
			day = now.getDate();

			$('*[name=update_date_eYear]').val(year);
			$('*[name=update_date_eMonth]').val(month);
			$('*[name=update_date_eDay]').val(day);
		} else if ($(this).val() == 2) {
			year = now.getFullYear();
			month = now.getMonth() + 1;
			now = new Date(year, month, 0);
			year = now.getFullYear();
			month = now.getMonth();
			if (month < 10) {
				month = "0" + month;
			}
			day = 1;

			$('*[name=update_date_sYear]').val(year);
			$('*[name=update_date_sMonth]').val(month);
			$('*[name=update_date_sDay]').val(day);

			day = now.getDate();

			$('*[name=update_date_eYear]').val(year);
			$('*[name=update_date_eMonth]').val(month);
			$('*[name=update_date_eDay]').val(day);
		} else if ($(this).val() == 3) {
			year = now.getFullYear();
			month = "01";
			day = 1;

			$('*[name=update_date_sYear]').val(year);
			$('*[name=update_date_sMonth]').val(month);
			$('*[name=update_date_sDay]').val(day);

			month = "12";
			day = 31;

			$('*[name=update_date_eYear]').val(year);
			$('*[name=update_date_eMonth]').val(month);
			$('*[name=update_date_eDay]').val(day);
		} else if ($(this).val() == 4) {
			year = now.getFullYear() - 1;
			month = "01";
			day = 1;

			$('*[name=update_date_sYear]').val(year);
			$('*[name=update_date_sMonth]').val(month);
			$('*[name=update_date_sDay]').val(day);

			month = "12";
			day = 31;

			$('*[name=update_date_eYear]').val(year);
			$('*[name=update_date_eMonth]').val(month);
			$('*[name=update_date_eDay]').val(day);
		} else if ($(this).val() == 5) {
			$('*[name=update_date_sYear]').removeAttr("disabled");
			$('*[name=update_date_sMonth]').removeAttr("disabled");
			$('*[name=update_date_sDay]').removeAttr("disabled");
			$('*[name=update_date_eYear]').removeAttr("disabled");
			$('*[name=update_date_eMonth]').removeAttr("disabled");
			$('*[name=update_date_eDay]').removeAttr("disabled");
		}
	});
});
-->
</script>
