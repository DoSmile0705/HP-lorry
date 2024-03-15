<script type="text/javascript">
<!--
$(function() {
	$("#LoginForm").keypress(function(e) {
		login(e);
	});
	function login(ev) {
		if ( (ev.which && ev.which === 13) || (ev.keyCode && ev.keyCode === 13) ) {
			$("#LoginForm").submit();
		}
	}
});
-->
</script>
