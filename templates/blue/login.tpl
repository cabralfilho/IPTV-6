[not-group=5]
		<div class="user-prof">
				<ul class="up-second flex-row">
				
				[group=1]<a href="{admin-link}" target="_blank"><h2><font color="#2F4F4F">АДМИН ПАНЕЛЬ</font></h2></a>[/group]
                [group=1]<a href="{addnews-link}"><h2><font color="#2F4F4F">Добавить пост</font></h2></a>[/group]
						<a href="{profile-link}"><h2><font color="#2F4F4F">Личный Кабинет</font></h2></a>
						<a href="{pm-link}"><h2><font color="#2F4F4F">Сообщения: ({new-pm}) </font></h2></a>
						[group=1][group=1]<a href="{favorites-link}">Мои закладки ({favorite-count})</a>[/group]
						[group=1]<a href="{stats-link}"><h2><font color="#2F4F4F">Статистика</font></h2></a>[/group]
						<a href="{logout-link}"><h2><font color="#2F4F4F">ВЫЙТИ</font></h2></a>
		</ul>
[/not-group]
[group=5]
		
		<div class="login-form">
			<form method="post">
				<div class="login-input">
					<input type="text" name="login_name" id="login_name" placeholder="Ваш логин"/>
				</div>
				<div class="login-input">
					<input type="password" name="login_password" id="login_password" placeholder="Ваш пароль" />
				</div>
				<div class="online">
					<button onclick="submit();" type="submit" title="Вход">Войти в личный кабинет</button>
					<input name="login" type="hidden" id="login" value="submit" />
				</div>
				
				<div class="login-checkbox">
					<input type="checkbox" name="login_not_save" id="login_not_save" value="1"/>
					<label for="login_not_save">&nbsp;Чужой компьютер</label> 
				</div>
				<div class="online">
					<a href="{lostpassword-link}">Забыли пароль?</a>
					<div class="online">
					<a href="/?do=register" class="log-register">Регистрация</a>
					</div>
					
				</div>
			</form>
		</div>																																																																																																																																			[aviable=showfull]<span style="display:none;">лучший сайт где можно скачать <a href="http://newtemplates.ru/dle112/">шаблоны для dle 11.2</a> бесплатно</span>[/aviable]
[/group]