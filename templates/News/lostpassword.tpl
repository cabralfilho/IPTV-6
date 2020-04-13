<div class="card">
	<h1 class="card-header">Восстановление пароля</h1>
	<div class="card-body">
		<ul class="list-group">
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<label for="lostname">Логин или E-mail</label>
				<input type="text" name="lostname" id="lostname" class="form-control" required>
			</li>
		[sec_code]
			<li class="list-group-item md-form" style="border: 1px solid rgba(0,0,0,0);">
				<div class="c-captcha">
					{code}
					<input placeholder="Повторите код" class="form-control" title="Введите код указанный на картинке" type="text" name="sec_code" id="sec_code" required>
				</div>
			</li>
		[/sec_code]
		[recaptcha]
			<li>{recaptcha}</li>
		[/recaptcha]
		</ul>
		<div class="form_submit">
			<button class="btn btn-primary" name="submit" type="submit">Восстановить</button>
		</div>
	</div>
</div>