<div class="card">
<div class="card-body">
	<h1 class="title h1">
		[registration]Регистрация[/registration]
		[validation]Продолжение регистрации[/validation]
	</h1>
	<div class="page_form__form">
		<div class="regtext">
		[registration]
			Регистрация на нашем сайте позволит Вам быть его полноценным участником.
			Вы сможете добавлять новости на сайт, оставлять свои комментарии, просматривать скрытый текст и многое другое.
			<br>В случае возникновения проблем с регистрацией, обратитесь к <a href="/index.php?do=feedback">администратору</a> сайта.
		[/registration]
		[validation]
			Ваш аккаунт был зарегистрирован на нашем сайте,
			однако информация о Вас является неполной, поэтому ОБЯЗАТЕЛЬНО заполните дополнительные поля в Вашем профиле.<br>
		[/validation]
		</div>
		<ul class="list-group">
		[registration]
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="name">Логин</label>
				<div class="login_check">
					<input type="text" name="name" id="name" class="wide" required>
					<button class="btn btn-primary btn-sm" title="Проверить" onclick="CheckLogin(); return false;">Проверить</button>
				</div>
				<div id="result-registration"></div>
			</li>
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="password1">Пароль</label>
				<input type="password" name="password1" id="password1" class="wide" required>
			</li>
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="password2">Повторите пароль</label>
				<input type="password" name="password2" id="password2" class="wide" required>
			</li>
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="email">E-mail</label>
				<input type="email" name="email" id="email" class="wide" required>
			</li>
		[question]
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="question_answer">{question}</label>
				<input placeholder="Введите ответ" type="text" name="question_answer" id="question_answer" class="wide" required>
			</li>
		[/question]
		[sec_code]
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<div class="c-captcha">
					{reg_code}
					<input placeholder="Повторите код" title="Введите код указанный на картинке" type="text" name="sec_code" id="sec_code" required>
				</div>
			</li>
		[/sec_code]
		[recaptcha]
			<li>{recaptcha}</li>
		[/recaptcha]
		[/registration]
		[validation]
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="fullname">Ваше имя</label>
				<input type="text" id="fullname" name="fullname" class="wide">
			</li>
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="land">Место жительства</label>
				<input type="text" id="land" name="land" class="wide">
			</li>
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="image">О себе</label>
				<textarea id="info" name="info" rows="5" class="wide"></textarea>
			</li>
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="image">Аватар</label>
				<input type="file" id="image" name="image" class="wide">
			</li>
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<table class="xfields">
					{xfields}
				</table>
			</li>
		[/validation]
		</ul>
		<div class="form_submit">
			<button class="btn btn-primary" name="submit" type="submit">Зарегистрироваться</button>
		</div>
	</div>
</div>
</div>