<div class="card">
    <div class="card-body">
        <h1 class="text-center">Личные сообщения</h1>
        <div class="progress" style="height: 20px">
            {pm-progress-bar}
            <div class="progress-bar" role="progressbar" style="width: {proc-pm-limit}; height: 20px" aria-valuenow="{proc-pm-limit}" aria-valuemin="0" aria-valuemax="100"><h6 style="color: #000;width: 550px;margin-bottom: 1px;">{proc-pm-limit}% от лимита ({pm-limit} сообщений)</h6></div>
</div>
    </div>
</div>

<div class="card">
    <div class="card-header white-color white-text">
    <ul class="nav nav-justified">
    <li class="nav-item white-text">
        [inbox]Входящие[/inbox]
    </li>
    <li class="nav-item white-text">
        [outbox]Отправленные[/outbox]
    </li>
    <li class="nav-item white-text">
        [new_pm]Написать новое сообщение[/new_pm]
    </li>
</ul>
    </div>
    <div class="card-body">
        <div>
        [pmlist] {pmlist} [/pmlist]
        </div>
        <div>
        [readpm]
            <!--Newsfeed-->
            <div class="mdb-feed">
                <!--Fourth news-->
                <div class="news">
                    <!--Label-->
                    <div class="label">
                        <img src="{foto}" class="rounded-circle z-depth-1-half">
                    </div>
                    <!--Excert-->
                    <div class="excerpt">
                        <!--Brief-->
                        <div class="brief" style="display: inline-flex;">
                            <a class="name">{author} </a>
                            <div class="date"> &nbsp;&nbsp;{date}</div>
                            <div class="date"> <h6>[reply] &nbsp;&nbsp;Ответить[/reply]</h6></div>
                        </div>
                        <!--Added text-->
                        <div class="added-text"><h3>[reply]{subj}[/reply]</h3></div>
                        <div class="added-text"><h5>{text}</h5></div>
                        <!--Feed footer-->
                        <div class="feed-footer">
                    <div class="text-right" style="font-size: 15px;">[ignore]Игнорировать[/ignore]&nbsp;[complaint]Жалоба[/complaint]&nbsp;[del]Удалить[/del]</div>
                <div class="">
					[signature]<hr><div style="font-size: 18px;">{signature}</div>[/signature]
                </div>
                        </div>
                    </div>
                </div>
                <!--Fourth news-->
            </div>
            <!--Newsfeed-->
            <button type="button" class="btn btn-primary white-text">[reply]Ответить[/reply]</button>
        [/readpm]
        </div>
        <div>
        [newpm]
		<div class="">
                <div class="md-form">
                    <i class="fa fa-user prefix" aria-hidden="true"></i>
                    <input type="text" name="name" value="{author}" id="inputIconEx1" class="form-control">
                    <label for="inputIconEx1">Кому:</label>
                </div>
                 <div class="md-form">
                    <i class="fa fa-exclamation prefix" aria-hidden="true"></i>
                    <input type="text" name="subj" value="{subj}" id="inputIconEx2" class="form-control">
                    <label for="inputIconEx2">Тема:</label>
                </div>
            <br>
                <div>
                    <div class="editorcomm">
                        {editor}
                    </div>
                </div>
            </div>
            <div class="fieldsubmit">
                <div class="lcol input">
                    <input type="checkbox" id="outboxcopy" name="outboxcopy" value="1" /> <label for="outboxcopy">Сохранить сообщение в папке "Отправленные"</label>
                </div>
                <div class="rcol">
                    <button type="submit" name="submit" class="submit btn btn-primary"><span>Отправить</span></button>
                </div>
                <div class="clr"></div>
            </div>
        [/newpm]
        </div>
    </div>
</div>