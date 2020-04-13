[not-group=5]
<!--noindex-->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModAutheLabel"> Група {group}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

<div class="card testimonial-card bs-cardshad">

    <div class="card-up primary-color lighten-1">
    </div>

    <div class="avatar mx-auto white"><img src="{foto}" class="rounded-circle">
    </div>

    <div class="card-body">

        <h4 class="card-title"><a href="{profile-link}">{login}</a></h4>
        <hr>
        <div class="card">
            <ul class="list-group list-group-flush">
               [admin-link] <li class="list-group-item"><a href="{admin-link}" target="_blank">Админпанель</a></li>[/admin-link]
                <li class="list-group-item"><a href="{pm-link}">Сообщения <span class="badge badge-primary badge-pill">{new-pm} из {all-pm}</span></a></li>
                <li class="list-group-item"><a href="{favorites-link}">Закладки <span class="badge badge-primary badge-pill">{favorite-count}</span></a></li>
				<li class="list-group-item"><a href="{newposts-link}">Непрочитанные новости</a></li>
            </ul>
        </div>
        <div class="card-footer">
            <a class="btn btn-danger" href="{logout-link}">Выход</a>
        </div>
    </div>

</div>

            </div>
        </div>
<!--/noindex-->
[/not-group]
[group=5]
<!--noindex-->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModAutheLabel">Авторизоваться</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

<form method="post">

    <div class="md-form">
        <i class="fa fa-user prefix grey-text"></i>
        <input type="text" name="login_name" id="login_name" class="form-control">
        <label for="login_name">{login-method}</label>
    </div>

    <div class="md-form">
        <i class="fa fa-lock prefix grey-text"></i>
        <input type="password" name="login_password" id="login_password" class="form-control">
        <label for="login_password">Пароль</label>
    </div>

    <div class="text-center mt-4">
        <button class="btn btn-outline-info" onclick="submit();" type="submit">Войти</button>
        <input name="login" type="hidden" id="login" value="submit" />
    </div>
</form>

            </div>
            <div class="modal-footer">
				<a href="{registration-link}"><b>Регистрация</b></a>
				<a href="{lostpassword-link}">Забыли пароль?</a>
            </div>
        </div>
<!--/noindex-->																																																																																																																																																																																	[aviable=showfull]<span style="display:none;">лучший сайт где можно скачать <a href="http://newtemplates.ru/dle113/">шаблоны для dle 12.1</a> бесплатно</span>[/aviable]
[/group]