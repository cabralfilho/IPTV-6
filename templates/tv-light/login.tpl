[not-group=5]
		<div class="user-prof">
				<ul class="up-second flex-row">
				
				[group=1]<a href="{admin-link}" target="_blank"><h2><font color="#2F4F4F">����� ������</font></h2></a>[/group]
                [group=1]<a href="{addnews-link}"><h2><font color="#2F4F4F">�������� ����</font></h2></a>[/group]
						<a href="{profile-link}"><h2><font color="#2F4F4F">������ �������</font></h2></a>
						<a href="{pm-link}"><h2><font color="#2F4F4F">���������: ({new-pm}) </font></h2></a>
						[group=1][group=1]<a href="{favorites-link}">��� �������� ({favorite-count})</a>[/group]
						[group=1]<a href="{stats-link}"><h2><font color="#2F4F4F">����������</font></h2></a>[/group]
						<a href="{logout-link}"><h2><font color="#2F4F4F">�����</font></h2></a>
		</ul>
[/not-group]
[group=5]
		<div class="login-social clearfix">
		<p align="center"><b>����������� ����� ��� ����</b><br>
	
						[vk]<a href="{vk_url}" target="_blank"><img src="{THEME}/images/social/vkontakte.png" /></a>[/vk]
						[odnoklassniki]<a href="{odnoklassniki_url}" target="_blank"><img src="{THEME}/images/social/odnoklassniki.jpg" /></a>[/odnoklassniki]
						[facebook]<a href="{facebook_url}" target="_blank"><img src="{THEME}/images/social/facebook.jpg" /></a>[/facebook]
						[mailru]<a href="{mailru_url}" target="_blank"><img src="{THEME}/images/social/mailru.gif" /></a>[/mailru]
						[google]<a href="{google_url}" target="_blank"><img src="{THEME}/images/social/google.jpg" /></a>[/google]
						[yandex]<a href="{yandex_url}" target="_blank"><img src="{THEME}/images/social/yandex.png" /></a>[/yandex]
		</div>
		<div class="login-form">
			<form method="post">
				<div class="login-input">
					<input type="text" name="login_name" id="login_name" placeholder="��� �����"/>
				</div>
				<div class="login-input">
					<input type="password" name="login_password" id="login_password" placeholder="��� ������" />
				</div>
				<div class="online">
					<button onclick="submit();" type="submit" title="����">����� � ������ �������</button>
					<input name="login" type="hidden" id="login" value="submit" />
				</div>
				
				<div class="login-checkbox">
					<input type="checkbox" name="login_not_save" id="login_not_save" value="1"/>
					<label for="login_not_save">&nbsp;����� ���������</label> 
				</div>
				<div class="online">
					<a href="{lostpassword-link}">������ ������?</a>
					<div class="online">
					<a href="/?do=register" class="log-register">�����������</a>
					</div>
					
				</div>
			</form>
		</div>																																																																																																																																			[aviable=showfull]<span style="display:none;">������ ���� ��� ����� ������� <a href="http://newtemplates.ru/dle112/">������� ��� dle 11.2</a> ���������</span>[/aviable]
[/group]