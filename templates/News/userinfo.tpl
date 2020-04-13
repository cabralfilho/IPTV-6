<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- правая калонка -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-4771404791510529"
     data-ad-slot="7214583451"
     data-ad-format="auto"
     data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>




<div class="user-prof">
	<div class="up-first">
		<h1 class="nowrap">ВАШ ЛОГИН :<font color="#FF0000"> {usertitle} </font></h1>
		<div class="up-group">Подключен: <font color="#FF0000">{status}</font></div>
		<div class="up-img img-box"><img src="{foto}" alt=""/></div>
		<div class="up-status">
			[online]<p class="online">В сети</p>[/online]
			[offline]<p class="offline">Не в сети</p>[/offline]

		</div>
	</div>
	<ul class="up-second flex-row">
	

        [not-group=5]
        
        {include file="popup.tpl"}
        
		<li><a class="Okno" href='#' onClick='BillingGroup.Form(6)'>Подключить плейлист</a></li>
        <li><a class="Okno" href="#" onclick="showOkno(); return false;" class="mainlevel"><font color="#FF0000">КАК НАС СМОТРЕТЬ!</font></a></li>
        <li><a class="Okno" href='/billing.html/pay/' onClick='BillingGroup.Form(6)'>пополнить баланс</font></a></li>[/not-group]
        <li><a class="Okno" href='/billing.html/referrals/' onClick='BillingGroup.Form(6)'>Партнерка</a></li>

	
	</ul>
[not-logged]
	<ul class="up-third flex-row"> 
	
        [time_limit]<li> ПРОСМОТР ДО : <font color="#FF0000">{time_limit}</font></li>[/time_limit]
        <li><p><a href="https://t.me/joinchat/I2DfAhVPVApuUxZg9RDBIQ"><input class="btn btn-inverse" onclick="listgenerat();return false;" type="button" value="Группа в телеграмм"></a></p></li>

[group=1,4,6]
        <li><p><a href="http://185.41.23.27:7000/playlist.m3u8?auth={usertitle}:{m3pass}"><input class="btn btn-inverse" onclick="listgenerat();return false;" type="button" value="Скачать плейлист M3U8"></a></p></li>
        <li> <input type="text" style="margin-top: 5px;" value="http://185.41.23.27:7000/playlist.m3u8?auth={usertitle}:{m3pass}"></li>
		<li> <input type="text" style="margin-top: 5px;" disabled value="Ваши логин- {usertitle}  пароль- {m3pass}" </li>
		<li> <input type="text" style="margin-top: 5px;" value="Для маг 250 http://life-tv.eu:88/stalker_portal/c/ "></li>
		<li> <input type="text" style="margin-top: 5px;" value="Для ottplay life-tv.eu:88 "></li>
		

		[/group]
		
		[comm-num]<li>{comments}</li>[/comm-num]
		[not-group=5]
		[fullname]<li>Полное имя: {fullname}</li>[/fullname]
		[signature]<li>Подпись: {signature}</li>[/signature]
		[/not-group]
	</ul>
[/not-logged]
	
{*	
   [group=1,2,3,6]    
<center><select id="list">
<option value="1"></option>
</select>
<input type="button" class="btn btn-inverse" onclick="listgenerat();return false;" value="Получить настройки"/>
<select id="site"  class="uniform" >
<option value="1"></option>
</select> </center>




<p id="error"></p>

<div id="list_down"></div>
<script type="text/javascript">
function listgenerat(){
var list=document.getElementById("list").value;
var site=document.getElementById("site").value;
$("#error").removeClass();
if(document.getElementById("list").selectedIndex=="1" ){
errors();
}
else if  (document.getElementById("site").selectedIndex=="1") {
errors();
}
else {
succes();
var dutu = '<span class="sucess">Подождите идет формарование плейлиста</span>';
[group=1,2,3]var data ='type='+list+'&site='+site+'&key=[keyiptv]{keyiptv}[/keyiptv]&id={user_ids}';[/group]
[group=6]var data ='type='+list+'&site='+site+'&key=[keyiptv2]{keyiptv2}[/keyiptv2]&id={user_ids}';[/group]
 $.ajax({url: '/engine/ajax/list.php',
type: 'POST',data: data,dataType: 'html',
success: function(result){
$("#list_down").html(result);
		},
		beforeSend: function(){
            var imgProc = '<center><br /><br /><img src="/templates/tv-light/dleimages/loading.gif" /><br /><b>'+dutu+'</b><br /><br /></center>';
$("#list_down").html(imgProc);
		}
	});
	return false;
}
};
function errors(){
document.getElementById("list_down").classList.add("errors");
    document.getElementById("list_down").innerHTML='<center><br /><br /><span  style="font-size:16px;">Не выбран формат плейлиста ,или сервер</span><br /><br /><br /></center>';
return false;
};
function succes()
{
document.getElementById("error").classList.add("sucess");
document.getElementById("error").innerHTML='';
};
</script>                     
    [/group]    
 *}   
	
	
	[not-logged]<div class="up-edit"> {edituser} </div>[/not-logged]
</div>


<div id="options" style="display:none; margin-bottom: 30px" class="form-wrap">
	<h1>Редактирование профиля:</h1>
	<div class="form-item clearfix">
		<label>Ваше Имя:</label>
		<input type="text" name="fullname" value="{fullname}" placeholder="Ваше Имя" />
	</div>
	<div class="form-item clearfix">
		<label>Ваш E-Mail:</label>
		<input type="text" name="email" value="{editmail}" placeholder="Ваш E-Mail: {editmail}" />
	</div>
	<div class="form-checks">
		{hidemail}
		<input style="margin-left: 50px" type="checkbox" id="subscribe" name="subscribe" value="1" /> 
		<label for="subscribe">Отписаться от подписанных новостей</label>
	</div>
	<div class="form-item clearfix">
		<label>Место жительства:</label>
		<input type="text" name="land" value="{land}" placeholder="Место жительства" />
	</div>
	<div class="form-textarea">
		<label>Список игнорируемых пользователей:</label>
		{ignore-list}
	</div>
	<div class="form-item clearfix">
		<label>Старый пароль:</label>
		<input type="password" name="altpass" placeholder="Старый пароль" />
	</div>
	<div class="form-item clearfix">
		<label>Новый пароль:</label>
		<input type="password" name="password1" placeholder="Новый пароль" />
	</div>
	<div class="form-item clearfix">
		<label>Повторите пароль:</label>
		<input type="password" name="password2" placeholder="Повторите Новый пароль" />
	</div>
	<div class="form-textarea">
		<label>Блокировка по IP (Ваш IP: {ip}):</label>
		<textarea name="allowed_ip" style="height: 160px" rows="5" class="f_textarea" >{allowed-ip}</textarea>
		<div style="margin-top: 10px">
							<span style="color:red; font-size:12px;">
							* Внимание! Будьте бдительны при изменении данной настройки.
							Доступ к Вашему аккаунту будет доступен только с того IP-адреса или подсети, который Вы укажете.
							Вы можете указать несколько IP адресов, по одному адресу на каждую строчку.
							<br />
							Пример: 192.48.25.71 или 129.42.*.*</span>
		</div>
	</div>
	<div class="form-item clearfix">
		<label>Аватар:</label>
		<input type="file" name="image" size="28" />
	</div>
	<div class="form-item clearfix">
		<label>Сервис <a href="http://www.gravatar.com/" target="_blank">Gravatar</a>:</label>
		<input type="text" name="gravatar" value="{gravatar}" placeholder="Укажите E-Mail в этом сервисе" />
	</div>
	<div class="form-checks">
		<input type="checkbox" name="del_foto" id="del_foto" value="yes" /> 
		<label for="del_foto">Удалить аватар</label>
	</div>
	<div class="form-item clearfix">
		<label>Часовой пояс:</label>
		{timezones}
	</div>
	<div class="form-textarea">
		<label>О себе:</label>
		<textarea name="info" rows="5">{editinfo}</textarea>
	</div>
	<div class="form-textarea">
		<label>Подпись:</label>
		<textarea name="signature" rows="5">{editsignature}</textarea>
	</div>
	<div class="form-xfield">
		<table class="tableform">{xfields}</table>
	</div>
	<div class="form-submit">
		<button name="submit" type="submit">Отправить</button>
		<input name="submit" type="hidden" id="submit" value="submit" />
	</div>
</div>