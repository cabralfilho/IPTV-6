<div class="form-wrap">
	<h1>¬осстановить пароль</h1>
	<div class="form-item clearfix">
		<label>¬аш логин:</label>
		<input type="text" name="lostname" placeholder="¬аш логин или E-Mail на сайте" />
	</div>
	[sec_code]
	<div class="form-item clearfix imp">
		<label>¬ведите код с картинки:</label>
		<div class="form-secur">
            <input type="text" name="sec_code" id="sec_code" placeholder="¬пишите код с картинки" maxlength="45" required />{code}
		</div>
	</div>
	[/sec_code]
	[recaptcha]
	<div class="form-item clearfix imp">
		<label>¬ведите два слова с картинки:</label>
		<div class="form-secur">
			{recaptcha}
		</div>
	</div>
	[/recaptcha]
	<div class="form-submit">
		<button name="submit" type="submit">ќтправить</button>
	</div>
</div>
