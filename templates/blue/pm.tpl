<div class="pm-page">

	<header class="sub-title"><h1>Персональные сообщения</h1></header>

	<ul class="pm-menu">
		<li>[inbox]Входящие[/inbox]</li>
		<li>[outbox]Отправленные[/outbox]</li>
		<li>[new_pm]Создать новое[/new_pm]</li>
	</ul>
	<div class="pm-status">
		<div>Папки персональных сообщений заполнены на:</div>
		{pm-progress-bar}
		{proc-pm-limit}% от лимита ({pm-limit} сообщений)
	</div>
	
	[pmlist]
	<header class="sub-title"><h1>Список сообщений</h1></header>	 
	<div class="table-resp">{pmlist}</div>
	[/pmlist]
	
	[newpm]
	<div class="form-wrap">
		<h1>Новое сообщение</h1>
		<div class="form-item clearfix imp">
			<label>Кому:</label>
			<input type="text" name="name" placeholder="Кому" value="{author}" required />
		</div>
		<div class="form-item clearfix">
			<label>Тема:</label>
			<input type="text" name="subj" placeholder="Тема" value="{subj}" />
		</div>
		<div class="form-textarea">
			<label>Ваше письмо:</label>
			{editor}
		</div>
		<div class="form-checks">
			<input type="checkbox" id="outboxcopy" name="outboxcopy" value="1" /> 
			<label for="outboxcopy">Сохранить сообщение в папке "Отправленные"</label>
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
				<input type="text" name="sec_code" id="sec_code" placeholder="Впишите код с картинки" maxlength="45" required />{sec_code}
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
		<div class="form-submit">
			<button type="submit" name="add">Отправить</button>
			<button type="button" onclick="dlePMPreview()">Просмотр</button>
		</div>
	</div>
	[/newpm]

	[readpm]
	<header class="form-title"><h1>Ваши сообщения</h1></header>	
	
<div class="comm-item clearfix[online] status-online[/online]">
	<div class="comm-av img-box"><img src="{foto}" alt="{login}"/></div>
	<div class="comm-one clearfix">
		<div class="comm-meta flex-col">
			<div class="comm-author">{author}</div>
			<div class="comm-group">{group-name}</div>
		</div>
		<div class="comm-meta flex-col">
			<div class="comm-date">{date}</div>
			<div class="comm-num"><span class="fa fa-comment-o"></span> {comm-num}</div>
		</div>
	</div>
	<div class="comm-two">
		<div class="comm-body clearfix">
			{text}
		</div>
		[signature]<div class="signature">{signature}</div>[/signature]
	</div>
	<div class="comm-three">
			<ul class="clearfix">
				<li class="comm-r">[reply]<span class="fa fa-reply"></span>Ответить[/reply]</li>
				[not-group=5]
				<li>[ignore]Игнор[/ignore]</li>
				<li>[complaint]Пожаловаться[/complaint]</li>
				<li>[del]Удалить[/del]</li>
				[/not-group]
			</ul>
	</div>
</div>

	[/readpm]

</div>	