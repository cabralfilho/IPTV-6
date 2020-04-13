<div class="card">
    
    <div class="card-body">
        <h4 class="card-title">Статистика зарегистрированых пользователей</h4>
            <!--Table-->
        <table class="table">
            <!--Table head-->
    <thead>
        <tr>
            <th>#</th>
            <th>За день</th>
            <th>За неделю</th>
            <th>За месяць</th>
        </tr>
    </thead>
  <!--Table head-->

    <!--Table body-->
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>{user_day}</td>
            <td>{user_week}</td>
            <td>{user_month}</td>
        </tr>
        <tr>
            <th class="table-info" scope="row">2</th>
            <td class="table-info" colspan="3">Зарегистрированых за все время {user_num}</td>
        </tr>
        <tr>
        <th class="table-danger" scope="row">3</th>
            <td class="table-danger" colspan="3">Забаненных пользователей за все время {user_banned}</td>
        </tr>
    </tbody>
    <!--Table body-->

</table>
<!--Table-->
        
        <br>
        <hr>
                <h4 class="card-title">Статистика новостей на сайте</h4>
            <!--Table-->
        <table class="table">
            <!--Table head-->
    <thead>
        <tr>
            <th>#</th>
            <th>За день</th>
            <th>За неделю</th>
            <th>За месяць</th>
        </tr>
    </thead>
  <!--Table head-->

    <!--Table body-->
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>{news_day}</td>
            <td>{news_week}</td>
            <td>{news_month}</td>
        </tr>
        <tr>
            <th class="table-info" scope="row">2</th>
            <td class="table-info" colspan="3">Общее количество новостей {news_num}</td>
        </tr>
        <tr>
        <th class="table-success" scope="row">3</th>
            <td class="table-success" colspan="3">Опубликовано новостей {news_allow}</td>
        </tr>   
        <tr>
        <th class="table-success" scope="row">4</th>
            <td class="table-success" colspan="3">Опубликовано новостей на главной {news_main}</td>
        </tr>     
        <tr>
        <th class="table-danger" scope="row">5</th>
            <td class="table-danger" colspan="3">Ожидают модерации {news_moder} </td>
        </tr>
    </tbody>
    <!--Table body-->

</table>
<!--Table-->
        
                <br>
                <hr>
                <h4 class="card-title">Статистика коментариев на сайте</h4>
            <!--Table-->
        <table class="table">
            <!--Table head-->
    <thead>
        <tr>
            <th>#</th>
            <th>За день</th>
            <th>За неделю</th>
            <th>За месяць</th>
        </tr>
    </thead>
  <!--Table head-->

    <!--Table body-->
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>{comm_day}</td>
            <td>{comm_week}</td>
            <td>{comm_month}</td>
        </tr>
    </tbody>
    <!--Table body-->

</table>
<!--Table-->
        
        <br>
        <div class="card-header primary-color lighten-1 white-text">Общий размер базы данных {datenbank}</div>
        <br>
        <br>
        <div class="card">
            <div class="card-body">
			<table>{topusers}</table>
            </div>
		</div>
    </div>

</div>