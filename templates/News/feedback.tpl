	<div class="card">
        <div class="card-header primary-color lighten-1 white-text text-center"><h4>Обратная связь</h4></div>
<div class="card-body">
			<ul class="list-group">
			[not-logged]
			<li class="list-group-item" style="border: 1px solid rgba(0,0,0,0);">
				<div class="md-form"><input  placeholder="Ваше имя" type="text" maxlength="35" name="name" id="name" class="form-control" required></div>
				<div class="md-form"><input placeholder="Ваш E-mail" type="email" maxlength="35" name="email" id="email" class="form-control" required></div>
			</li>
			[/not-logged]
				<li class="list-group-item" style="border: 1px solid rgba(0,0,0,0);">
					<input placeholder="Тема сообщения" type="text" maxlength="45" name="subject" id="subject" class="form-control" required>
				</li>
				<li class="list-group-item" style="border: 1px solid rgba(0,0,0,0);">
					<label>Получатель</label>
					{recipient}
				</li>
				<li class="list-group-item form-group" style="border: 1px solid rgba(0,0,0,0);">
					<textarea placeholder="Сообщение" name="message" id="message" rows="5" class="form-control" required></textarea>
				</li>
			[attachments]
				<li class="list-group-item" style="border: 1px solid rgba(0,0,0,0);">
                    <form>
                            <div class="md-form">
                                <div class="file-field">
                                    <div class="btn btn-primary btn-sm float-left">
                                        <span>Вибрать файлы</span>
                                        <input name="attachments[]" type="file" multiple>
                                    </div>
                                    <div class="file-path-wrapper">
                                        <input class="file-path validate" type="text" placeholder="Загрузить один и больше файлов...">
                                    </div>
                                </div>
                        </div>
                    </form>
				</li>
			[/attachments]
			[recaptcha]
				<li class="list-group-item" style="border: 1px solid rgba(0,0,0,0);">{recaptcha}</li>
			[/recaptcha]
			[question]
				<li class="list-group-item" style="border: 1px solid rgba(0,0,0,0);">
					<label for="question_answer">Вопрос: {question}</label>
					<input placeholder="Ответ" type="text" name="question_answer" id="question_answer" class="form-control" required>
				</li>
			[/question]
			</ul>
			<div class="form_submit">
				[sec_code]
					<div class="c-captcha">
						{code}
						<input placeholder="Повторите код" title="Введите код указанный на картинке" type="text" name="sec_code" id="sec_code" required>
					</div>
				[/sec_code]
				<button class="btn btn-primary" type="submit" name="send_btn"><b>Отправить сообщение</b></button>
			</div>
		</div>
	</div>