        <script type="text/javascript">
function showOkno() {
$(function(){

    $('#Okno').dialog({
        autoOpen: true,
        show: 'fade',
        hide: 'fade',
        width: 630,
 buttons: {"�������" : function() {$(this).dialog("close");
            }}
    });
});
}
</script>

<div id="Okno" title="������� �������" style="display:none; " >
 {include file="popup_text.tpl"}
</div>