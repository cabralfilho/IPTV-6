<!--noindex-->
<div class="add-comm-form clearfix" id="add-comm-form">
		
	<div class="ac-title">����������������� <span class="fa fa-chevron-down"></span></div>
	<div class="ac-av img-box" id="ac-av"></div>
			[not-logged]
			[vk]<div class="login-social" data-label="����� �����">[/vk]
						[vk]<a href="{vk_url}" target="_blank"><img src="{THEME}/images/social/vkontakte.png" /></a>[/vk]
						[odnoklassniki]<a href="{odnoklassniki_url}" target="_blank"><img src="{THEME}/images/social/odnoklassniki.jpg" /></a>[/odnoklassniki]
						[facebook]<a href="{facebook_url}" target="_blank"><img src="{THEME}/images/social/facebook.jpg" /></a>[/facebook]
						[mailru]<a href="{mailru_url}" target="_blank"><img src="{THEME}/images/social/mailru.gif" /></a>[/mailru]
						[yandex]<a href="{yandex_url}" target="_blank"><img src="{THEME}/images/social/yandex.png" /></a>[/yandex]
						[google]<a href="{google_url}" target="_blank"><img src="{THEME}/images/social/google.jpg" /></a>[/google]
			[vk]</div>[/vk]
			
			<div class="ac-inputs clearfix">
				<input type="text" maxlength="35" name="name" id="name" placeholder="���� ���" />
				<input type="text" maxlength="35" name="mail" id="mail" placeholder="��� e-mail (�������������)" />
			</div>
			[/not-logged]
			
			<div class="ac-textarea">{editor}</div>
			
[not-group=1]
			<div class="ac-protect">
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
						<input type="text" name="sec_code" id="sec_code" placeholder="������� ��� � ��������" maxlength="45" required />{sec_code}
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
			</div>
[/not-group]

	<div class="ac-submit"><button name="submit" type="submit">���������</button></div>
	
</div>
<!--/noindex-->