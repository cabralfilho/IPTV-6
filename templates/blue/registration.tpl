<div class="form-wrap">
	<h1>[registration]Регистрация[/registration][validation]Продолжения регистрации[/validation]</h1>
	<div class="full-text">		
			
			[validation]
				<b>Уважаемый посетитель,</b><br />
				Спасибо за регистрацию на нашем сайте,
				теперь Вы можете пользоаться всеми функциями сайта!.
			[/validation]
	</div>		

[registration]

<div class="login-social clearfix">
                  <p align="center"><b>Здравствуйте, уважаемый посетитель нашего сайта!</b><br>
	<b>Зарегистрируйтесь с помощью аккаунта Вашей почты</b></p>
						
		</div>

	<div class="form-item clearfix imp">
		<label for="name">Логин:</label>
		<input type="text" name="name" id="name" required />
		<input title="Проверить доступность логина для регистрации" onclick="CheckLogin(); return false;" type="button" value="Проверить имя" />
	</div>
	<div id='result-registration'></div>
	<div class="form-item clearfix imp">
		<label for="password1">Пароль:</label>
		<input type="password" name="password1" id="password1" required />
	</div>
	<div class="form-item clearfix imp">
		<label for="password2">Повторите пароль:</label>
		<input type="password" name="password2" id="password2" required />
	</div>
	<div class="form-item clearfix imp">
		<label for="email">Ваш E-Mail:</label>
		<input type="text" name="email" id="email" required />
	</div>
	[question]
	<div class="form-item clearfix imp">
		<label>Вопрос:</label>
		<div class="form-secur"><div style="margin-bottom:10px;">{question}</div>
        <input type="text" name="question_answer" placeholder="Впишите ответ на вопрос" required />
		</div>
	</div>
	[/question]
	[sec_code]
	<div class="form-item clearfix imp">
		<label>Введите код с картинки:</label>
		<div class="form-secur">
            <input type="text" name="sec_code" id="sec_code" placeholder="Впишите код с картинки" maxlength="45" required />{reg_code}
		</div>
	</div>
	[/sec_code]
	[recaptcha]
	<div class="form-item clearfix imp">
		<label>Введите два слова с картинки:</label>
		<div class="form-secur">
			{recaptcha}
		</div>
	</div>
	[/recaptcha]
[/registration]



	<div class="form-submit">
		<button name="submit" type="submit">Продолжить</button>
	</div>		
			
</div>