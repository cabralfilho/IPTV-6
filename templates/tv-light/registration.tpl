<div class="form-wrap">
	<h1>[registration]�����������[/registration][validation]����������� �����������[/validation]</h1>
	<div class="full-text">		
			
			[validation]
				<b>��������� ����������,</b><br />
				������� �� ����������� �� ����� �����,
				������ �� ������ ����������� ����� ��������� �����!.
			[/validation]
	</div>		

[registration]

<div class="login-social clearfix">
                  <p align="center"><b>������������, ��������� ���������� ������ �����!</b><br>
	<b>����������������� � ������� �������� ��� ���� ���� ������ ����� �����</b></p>
						[vk]<a href="{vk_url}" target="_blank"><img src="{THEME}/images/social/vkontakte.png" /></a>[/vk]
						[odnoklassniki]<a href="{odnoklassniki_url}" target="_blank"><img src="{THEME}/images/social/odnoklassniki.jpg" /></a>[/odnoklassniki]
						[facebook]<a href="{facebook_url}" target="_blank"><img src="{THEME}/images/social/facebook.jpg" /></a>[/facebook]
						[mailru]<a href="{mailru_url}" target="_blank"><img src="{THEME}/images/social/mailru.gif" /></a>[/mailru]
						[google]<a href="{google_url}" target="_blank"><img src="{THEME}/images/social/google.jpg" /></a>[/google]
						[yandex]<a href="{yandex_url}" target="_blank"><img src="{THEME}/images/social/yandex.png" /></a>[/yandex]
		</div>

	<div class="form-item clearfix imp">
		<label for="name">�����:</label>
		<input type="text" name="name" id="name" required />
		<input title="��������� ����������� ������ ��� �����������" onclick="CheckLogin(); return false;" type="button" value="��������� ���" />
	</div>
	<div id='result-registration'></div>
	<div class="form-item clearfix imp">
		<label for="password1">������:</label>
		<input type="password" name="password1" id="password1" required />
	</div>
	<div class="form-item clearfix imp">
		<label for="password2">��������� ������:</label>
		<input type="password" name="password2" id="password2" required />
	</div>
	<div class="form-item clearfix imp">
		<label for="email">��� E-Mail:</label>
		<input type="text" name="email" id="email" required />
	</div>
	[question]
	<div class="form-item clearfix imp">
		<label>������:</label>
		<div class="form-secur"><div style="margin-bottom:10px;">{question}</div>
        <input type="text" name="question_answer" placeholder="������� ����� �� ������" required />
		</div>
	</div>
	[/question]
	[sec_code]
	<div class="form-item clearfix imp">
		<label>������� ��� � ��������:</label>
		<div class="form-secur">
            <input type="text" name="sec_code" id="sec_code" placeholder="������� ��� � ��������" maxlength="45" required />{reg_code}
		</div>
	</div>
	[/sec_code]
	[recaptcha]
	<div class="form-item clearfix imp">
		<label>������� ��� ����� � ��������:</label>
		<div class="form-secur">
			{recaptcha}
		</div>
	</div>
	[/recaptcha]
[/registration]



	<div class="form-submit">
		<button name="submit" type="submit">����������</button>
	</div>		
			
</div>