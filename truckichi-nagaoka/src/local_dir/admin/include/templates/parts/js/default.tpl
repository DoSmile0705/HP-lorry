<!--   Core JS Files   -->
<script src="<!--HP{$documentRoot}HP-->/js/core/jquery.min.js"></script>
<!--<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>-->
<script src="<!--HP{$documentRoot}HP-->/js/core/popper.min.js"></script>
<script src="<!--HP{$documentRoot}HP-->/js/core/bootstrap.min.js"></script>
<script src="<!--HP{$documentRoot}HP-->/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script src="<!--HP{$documentRoot}HP-->/js/plugins/moment.min.js"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for Sweet Alert -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/sweetalert2.min.js"></script>
<!-- Forms Validations Plugin -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/jquery.validate.min.js"></script>
<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/jquery.bootstrap-wizard.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/bootstrap-selectpicker.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/bootstrap-datetimepicker.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/jquery.dataTables.min.js"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/bootstrap-tagsinput.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/fullcalendar.min.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/jquery-jvectormap.js"></script>
<!--  Plugin for the Bootstrap Table -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<!--<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>-->
<!-- Chart JS -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="<!--HP{$documentRoot}HP-->/js/plugins/bootstrap-notify.js"></script>

	<!-- DataTables Editor -->
<!--<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>-->
<!--<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>-->
<!--<script type="text/javascript" src="https://cdn.datatables.net/select/1.2.6/js/dataTables.select.min.js"></script>-->
<script type="text/javascript" src="<!--HP{$documentRoot}HP-->/js/Editor-1.7.3/dataTables.editor.min.js"></script>

<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script src="<!--HP{$documentRoot}HP-->/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>

<style>
	ul.fancytree-container {
		border: none;
	}
	.glyphicon-check:before {
		color: limegreen;
	}
	.fancytree-active .glyphicon-check:before {
		color: greenyellow;
	}
</style>
<script src="<!--HP{$documentRoot}HP-->js/fancytree-2.24.0/dist/jquery.fancytree-all-deps.min.js"></script>

<script type="text/javascript">
	$(function () {
	// tooltip
	$('[data-toggle="tooltip"]').tooltip();

	// Enterキー
	$(document).on("keypress", "input:not(.allow_submit)", function(event) {
		return event.which !== 13;
	});
	
	// DataTables日本語化
	$.extend( $.fn.dataTable.defaults, {
		language: {
			url: "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json"
		}
	});

	// previewのモーダル表示
	$('#preview_right_area a').attr('href', 'javascript:void();');
	$('#preview_right_area a').attr('onclick', 'return false;');
	$('#preview_right_area input').attr('onclick', 'return false;');
	$('#preview_right_area form').attr('action', 'javascript:void();');


});
</script>
