<div class="user-prof">
	<div class="up-first">

		<h1 class="nowrap">��� ����� :<font color="#FF0000"> {usertitle} </font></h1>
		<div class="up-group">�������� ���� : <font color="#FF0000">{status}</font></div>
		<div class="up-img img-box"><img src="{foto}" alt=""/></div>
		<div class="up-status">
			[online]<p class="online">� ����</p>[/online]
			[offline]<p class="offline">�� � ����</p>[/offline]
		</div>
	</div>
	<ul class="up-second flex-row">
	
		
        [not-group=5]
        
        {include file="popup.tpl"}
        
		<li><a class="Okno" href='#' onClick='BillingGroup.Form(3)'>����� ������������</a></li>
        <li><a class="Okno" href="#" onclick="showOkno(); return false;" class="mainlevel">��� �������?</a></li>
        <li><a class="online" href="/index.php?do=pm&doaction=newpm&username=Admin">������� �����</a></li>[/not-group]
        
        <li>{email}</li>
	
	</ul>
	<ul class="up-third flex-row"> 
        [time_limit]<li> �������� �� : <font color="#FF0000">{time_limit}</font></li>[/time_limit]
		
		<li>�����������: {registration}</li>
		
		[group=1,2,3] [keyiptv]<li><font color="#FF0000">��� ID: </font>{user_ids}</li><li><font color="#FF0000">��� ���������� ���� : </font>{keyiptv}</li>[/keyiptv] [/group] 
[group=1,6] [keyiptv2]<li><font color="#FF0000">��� �������� ���� : </font>{keyiptv2}</li>[/keyiptv2] [/group]
		<li>�������(�): {lastdate}</li>
		
		[comm-num]<li>{comments}</li>[/comm-num]
		[not-group=5]
		[fullname]<li>������ ���: {fullname}</li>[/fullname]
		[signature]<li>�������: {signature}</li>[/signature]
		[/not-group]
	</ul>
   [group=1,2,3,6]    
<select id="list">
<option value="1">M3U �������� </option>
<option value="1">M3U</option> 
</select>
<select id="site"  class="uniform" >
<option value="1">������ �������</option>
<option value="1">�������</option>
</select>  <input type="button" class="btn btn-inverse" onclick="listgenerat();return false;" value="������� ��������/�����/���� "/>





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
var dutu = '<span class="sucess">��������� ���� ������������ ���������</span>';
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
    document.getElementById("list_down").innerHTML='<center><br /><br /><span  style="font-size:16px;">�� ������ ������ ��������� ,��� ������</span><br /><br /><br /></center>';
return false;
};
function succes()
{
document.getElementById("error").classList.add("sucess");
document.getElementById("error").innerHTML='';
};
</script>                     
    [/group]    
    
	
	
	[not-logged]<div class="up-edit"> {edituser} </div>[/not-logged]
</div>

<a class="catName">{include file="/engine/modules/billing/cabinet.php"}</a>
<div id="options" style="display:none; margin-bottom: 30px" class="form-wrap">
	<h1>�������������� �������:</h1>
	<div class="form-item clearfix">
		<label>���� ���:</label>
		<input type="text" name="fullname" value="{fullname}" placeholder="���� ���" />
	</div>
	<div class="form-item clearfix">
		<label>��� E-Mail:</label>
		<input type="text" name="email" value="{editmail}" placeholder="��� E-Mail: {editmail}" />
	</div>
	<div class="form-checks">
		{hidemail}
		<input style="margin-left: 50px" type="checkbox" id="subscribe" name="subscribe" value="1" /> 
		<label for="subscribe">���������� �� ����������� ��������</label>
	</div>
	<div class="form-item clearfix">
		<label>����� ����������:</label>
		<input type="text" name="land" value="{land}" placeholder="����� ����������" />
	</div>
	<div class="form-textarea">
		<label>������ ������������ �������������:</label>
		{ignore-list}
	</div>
	<div class="form-item clearfix">
		<label>������ ������:</label>
		<input type="password" name="altpass" placeholder="������ ������" />
	</div>
	<div class="form-item clearfix">
		<label>����� ������:</label>
		<input type="password" name="password1" placeholder="����� ������" />
	</div>
	<div class="form-item clearfix">
		<label>��������� ������:</label>
		<input type="password" name="password2" placeholder="��������� ����� ������" />
	</div>
	<div class="form-textarea">
		<label>���������� �� IP (��� IP: {ip}):</label>
		<textarea name="allowed_ip" style="height: 160px" rows="5" class="f_textarea" >{allowed-ip}</textarea>
		<div style="margin-top: 10px">
							<span style="color:red; font-size:12px;">
							* ��������! ������ ��������� ��� ��������� ������ ���������.
							������ � ������ �������� ����� �������� ������ � ���� IP-������ ��� �������, ������� �� �������.
							�� ������ ������� ��������� IP �������, �� ������ ������ �� ������ �������.
							<br />
							������: 192.48.25.71 ��� 129.42.*.*</span>
		</div>
	</div>
	<div class="form-item clearfix">
		<label>������:</label>
		<input type="file" name="image" size="28" />
	</div>
	<div class="form-item clearfix">
		<label>������ <a href="http://www.gravatar.com/" target="_blank">Gravatar</a>:</label>
		<input type="text" name="gravatar" value="{gravatar}" placeholder="������� E-Mail � ���� �������" />
	</div>
	<div class="form-checks">
		<input type="checkbox" name="del_foto" id="del_foto" value="yes" /> 
		<label for="del_foto">������� ������</label>
	</div>
	<div class="form-item clearfix">
		<label>������� ����:</label>
		{timezones}
	</div>
	<div class="form-textarea">
		<label>� ����:</label>
		<textarea name="info" rows="5">{editinfo}</textarea>
	</div>
	<div class="form-textarea">
		<label>�������:</label>
		<textarea name="signature" rows="5">{editsignature}</textarea>
	</div>
	<div class="form-xfield">
		<table class="tableform">{xfields}</table>
	</div>
	<div class="form-submit">
		<button name="submit" type="submit">���������</button>
		<input name="submit" type="hidden" id="submit" value="submit" />
	</div>
</div>