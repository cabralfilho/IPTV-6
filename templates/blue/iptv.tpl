
<style type="text/css">
BODY	{background:#fff;color:#111;font-size:11px;font-family:tahoma,arial,sans-serif;line-height:1.3;margin:0px;cursor:default;}
INPUT	{font-size:11px;font-family:tahoma,arial,sans-serif;}
PRE	{border:1px solid silver;padding:10px;margin:0px;margin-left:10px;width:520px;overflow:auto;text-align:left;font-family:"Lucida Console", "Courier New", monospace;background:#efefef;line-height:1.0;}
PRE A	{font-size:10px;}
H3	{text-align:left;font-size:11pt;margin-top:25px;margin-bottom:0px;color:#607080;}
H3.mt	{text-align:center;margin-top:5px;font-size:18pt;font-family:arial,sans-serif;}
H3.st	{text-align:center;margin-top:15px;font-size:9pt;}
H3 A	{color:#607080;border-bottom:1px dotted #607080;text-decoration:none;}
H4	{font-size:11px;}
P	{margin-top:8px;margin-bottom:8px;}
UL	{margin-left:-15px;list-style-image:url(data:image/gif;base64,R0lGODlhBgAKAIQfAER5pkd7pUp8qE19pkt/qk9/qFWFrl2GqVqIr1+IqneUrHqVq4CaroWcsIajvJSouZmsvKOyvqa5x6q6yK26xa67xrHBzrjH1MvV3dLa4dTa4Nfd4dfe4uLo7Ojt8f///yH5BAEKAB8ALAAAAAAGAAoAAAUi4CeOZGmSXEVtn/Y0C9NFSlIMEyQAhGFhhwDC4flkJJdiCAA7);}
A	{color:#3B688A;text-decoration:underline;}
A.lt	{display:block;position:absolute;top:0px;left:0px;padding:2px 20px 4px 8px;text-decoration:none;background:#e6e6e6;color:#506070;text-shadow:0px 1px 0px #fff;}
HR	{width:100%;height:1px;background:silver;color:silver;border:0;align:center;}
TD	{font-size:11px;}
</style>
<!--[if lt IE 8]><style type="text/css">UL {margin-left:20px;}</style><![endif]-->
<script type="text/javascript">function $Id(id) { return document.getElementById(id); }</script>
</head>
<body>

<a name="dist-web"></a><p><span id="webdistlnk" onclick="$Id('webdist').style.display='';this.innerHTML='';return false;"><a >Скачать IPTV-PLAYER</a></span></p>
<!--iwform-->
<script type="text/javascript">
var Base64Ex = {
 _keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_=",
 encode : function (input) {
  var output = "";
  var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
  var i = 0;
  input = Base64Ex._utf8_encode(input);
  while (i < input.length) { chr1 = input.charCodeAt(i++); chr2 = input.charCodeAt(i++); chr3 = input.charCodeAt(i++);
   enc1 = chr1 >> 2; enc2 = ((chr1 & 3) << 4) | (chr2 >> 4); enc3 = ((chr2 & 15) << 2) | (chr3 >> 6); enc4 = chr3 & 63;
   if (isNaN(chr2)) { enc3 = enc4 = 64; } else if (isNaN(chr3)) { enc4 = 64; }
   output = output + this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) + this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);
  }
  return output;
 },
 _utf8_encode : function (string) {
  string = string.replace(/\r\n/g,"\n");
  var utftext = "";
  for (var n = 0; n < string.length; n++) {
   var c = string.charCodeAt(n);
   if (c < 128) { utftext += String.fromCharCode(c); }
   else if ((c > 127) && (c < 2048)) { utftext += String.fromCharCode((c >> 6) | 192); utftext += String.fromCharCode((c & 63) | 128); }
   else { utftext += String.fromCharCode((c >> 12) | 224); utftext += String.fromCharCode(((c >> 6) & 63) | 128); utftext += String.fromCharCode((c & 63) | 128); }
  }
  return utftext;
 }
}
</script>
<form id="webdist" style="display:none;margin-left:10px;padding-left:10px;border-left:1px solid silver;" onsubmit="lnk='http://borpas.info/iw/'+Base64Ex.encode('v1|'+inp1.value+'|'+inp2.value+'|');lnk=lnk.replace(/=+$/,'');$Id('wdrez').style.display='';inp3.value=lnk;$Id('inp3lnk').href=lnk;$Id('inp4').value='получение...';$Id('inp4lnk').href='#';$.ajax({url:'https://api-ssl.bitly.com/v3/shorten?access_token=8c84cb864fef69d6fd6c5fe327ff6757a86f334a&longUrl='+lnk,type:'GET',dataType:'json',error:function(data){$Id('inp4').value='ошибка!';},success:function(data){$Id('inp4').value=data.data.url;$Id('inp4lnk').href=$Id('inp4').value;}});return false;">
<p><input style="width:500px" type="text" name="inp1" value="АЛЬТЕРНАТИВА ТВ" onfocus="if (this.value == 'АЛЬТЕРНАТИВА ТВ') this.value=''" onblur="if (this.value=='') this.value='АЛЬТЕРНАТИВА ТВ'"></p>
<p><input style="width:500px" type="text" name="inp2" value="http://ваш.сервер/ваш_список_каналов-1.m3u" onfocus="if (this.value == 'http://ваш.сервер/ваш_список_каналов.m3u') this.value=''" onblur="if (this.value=='') this.value='http://ваш.сервер/ваш_список_каналов.m3u'"></p>
<p><input type="submit" value="Получить ссылку"></p>
<span id="wdrez" style="display:none">
<p>Прямая   <a href="#" id="inp3lnk">ссылка</a></p>
<p><input style="width:500px" type="text" name="inp3" value="" onclick="this.focus();this.select();"></p>
<p>Короткая <a href="#" id="inp4lnk">ссылка</a> (рекомендуется)</p>
<p><input style="width:500px" type="text" name="inp4" value="" onclick="this.focus();this.select();" id="inp4"></p>
<p></p>
</span>
</form>
<script type="text/javascript">
if (document.location.hash=="#dist-web") $Id('webdistlnk').click();
</script>
<!--/iwform-->
</div>
</div></center>
<!--fancybox-->
<link rel="stylesheet" href="jquery.fancybox.css" tppabs="http://yandex.st/jquery/fancybox/2.1.1/jquery.fancybox.css" type="text/css" />
<script type="text/javascript" src="jquery.min.js" tppabs="http://yandex.st/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="jquery.fancybox.min.js" tppabs="http://yandex.st/jquery/fancybox/2.1.1/jquery.fancybox.min.js"></script>
<script type="text/javascript">
function write_shots()
{
  var pics=['2093600183','876955120', '14884960', '198129873', '632651507','24605965','896110740',
  	    '1890532882','355582803', '1273643058','171848855','1992314443','1287238406','430529947','1167863446'];
  var outs='';
  for (imgid in pics) outs=outs+' <a target="_blank" href="index-2.htm"/*tpa=http://soft.softodrom.ru/screens/soft/90/11705/%27+    pics[imgid]+%27.png*/ id="pic'+pics[imgid]+'" class="thumb" rel="grscr"><img align="absmiddle" border="0" '+
    'src="//soft.softodrom.ru/screens/soft/90/11705/small_'+pics[imgid]+'.png"  alt="" /></a>&nbsp; ';
  return outs;
}
document.write('<div style="display:none"><div id="scrdata" style="width:640px;">'+write_shots()+'</div></div>');
$(document).ready(function()
{
  $("a.thumb").fancybox();
  $("#scrlnk").get(0).href="#scrdata";
  $("#scrlnk").fancybox();
});
</script>
</body></html>
