<script>
$(function(){
    $('.doBtn').click(function() {
        $('form').submit();
    });
    $('.donutBtn').click(function() {
        location.href="<!--HP{$smarty.const.SITE_URL_MEMBER_TOP}HP-->";
    });
});
</script>