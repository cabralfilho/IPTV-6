<!DOCTYPE html>
<html lang="en">

<head>
    {headers}
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="{THEME}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="{THEME}/css/mdb.min.css" rel="stylesheet">
    <link href="{THEME}/css/compiled.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="{THEME}/css/style.min.css" rel="stylesheet">
    <link href="{THEME}/css/engine.css" rel="stylesheet">
</head>

<body class="grey lighten-3">
    {AJAX}
    <!--Main Navigation-->
    <header>

        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
            <div class="container-fluid">

                <!-- Collapse -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Links -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <!-- Left -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="index.php?do=rules"> <i class="fa fa-shield" aria-hidden="true"></i> Правила сайта
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="/" target="_blank"><i class="fa fa-info-circle" aria-hidden="true"></i> О проекте</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="statistics.html" target="_blank"><i class="fa fa-line-chart" aria-hidden="true"></i>Статистика</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="index.php?do=feedback" target="_blank"><i class="fa fa-share-alt" aria-hidden="true"></i> Контакты</a>
                        </li>
                    </ul>

                    <!-- Right -->
                    <ul class="navbar-nav nav-flex-icons">
                        <li class="nav-item">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModAuthe">
                                <i class="fa fa-user-o" aria-hidden="true"></i>[group=5]  Авторизоваться[/group] 
                                [group=4,3,2,1]  Мой профиль[/group]
                            </button>
                        </li>
                    </ul>

                </div>

            </div>
        </nav>
        <!-- Navbar -->

        <!-- Sidebar -->
        <div class="sidebar-fixed position-fixed">

            <a class="logo-wrapper waves-effect">
                <img  class="animated rubberBand" src="https://mdbootstrap.com/img/logo/mdb-transparent.png" class="img-fluid" alt="">
            </a>

            <div class="list-group list-group-flush">
                <a href="/" class="list-group-item active waves-effect">
                    <i class="fa fa-pie-chart mr-3"></i>На главную
                </a>
                <a href="/news" class="list-group-item list-group-item-action waves-effect">
                    <i class="fa fa-user mr-3"></i>Новости</a>
                <a href="/dle" class="list-group-item list-group-item-action waves-effect">
                    <i class="fa fa-table mr-3"></i>DLE</a>
                <a href="/wordpress" class="list-group-item list-group-item-action waves-effect">
                    <i class="fa fa-map mr-3"></i>Wordpress</a>
                <a href="/" class="list-group-item list-group-item-action waves-effect">
                    <i class="fa fa-money mr-3"></i>Orders</a>
            </div>
        </div>
        <!-- Sidebar -->

    </header>
    <!--Main Navigation-->

    <!--Main layout-->
    <main class="pt-5 mx-lg-5">
        <div class="container-fluid mt-5">

            <!-- Heading -->
            <div class="card mb-4 wow fadeIn">

                <!--Card content-->
                <div class="card-body d-sm-flex justify-content-between">

                    <h4 class="mb-2 mb-sm-0 pt-1">
                        <a href="https://mdbootstrap.com/material-design-for-bootstrap/" target="_blank">{speedbar}</a>
                    </h4>

                    <form class="d-flex justify-content-center" action="" name="searchform" method="post">
                        <!-- Default input -->
                    <input type="hidden" name="do" value="search"  class="form-control"/>
					<input type="hidden" name="subaction" value="search" class="form-control" />
                    <input class="form-control" id="story" name="story" value="Введите текст для поиска..." onblur="if(this.value=='') this.value='Введите текст для поиска...';" onfocus="if(this.value=='Введите текст для поиска...') this.value='';" type="text" maxlength="60">
                        <button class="btn btn-primary btn-sm my-0 p" type="submit">
                            <i class="fa fa-search"></i>
                        </button>

                    </form>

                </div>

            </div>
            <!-- Heading -->

            <!--Grid row-->
            <div class="row wow fadeIn">
                <!--Grid column-->
                <div class="col-md-8 mb-4">

                    <!--Card-->
                    
                    {info}
                    {content}
                    <!--/.Card-->

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-4 mb-4">

                    <!--Card-->
                    <div class="card mb-4">

                        <!-- Card header -->
                        <div class="card-header text-center primary-color white-text">
                            Новые посты
                        </div>

                        <!--Card content-->
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                {custom category="1-8" template="topnews" aviable="global" limit="5" order="reads" cache="yes"}
                            </ul>
                        </div>

                    </div>
                    <!--/.Card--> 
                    <!--Card-->
                    <div class="card mb-4">

                        <!-- Card header -->
                        <div class="card-header text-center primary-color white-text">
                            Архив постов
                        </div>

                        <!--Card content-->
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                               {archives}
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!--/.Card-->

                </div>
                <!--Grid column-->

            </div>
           <!--Grid row--> 
        </div>
    </main>
    <!--Main layout-->

    <!--Module_Auth-->
    <!-- Modal -->
<div class="modal fade index-position" id="ModAuthe" tabindex="-1" role="dialog" aria-labelledby="ModAutheLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        {login}
    </div>
</div>
    <!--Module_Auth-->    
    
    <!--Footer-->
    <footer class="page-footer text-center font-small primary-color darken-2 mt-4 wow fadeIn">

        <!--Copyright-->
        <div class="footer-copyright py-3">
            Powered by <a target="_blank" href="/engine/go.php?url=aHR0cDovL25ld3RlbXBsYXRlcy5ydS8%3D">DataLife Engine</a>
        </div>
        <!--/.Copyright-->

    </footer>
    <!--/.Footer-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="{THEME}/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="{THEME}/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="{THEME}/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="{THEME}/js/mdb.min.js"></script>
    <script type="text/javascript" src="{THEME}/js/compiled.min.js"></script>
    <script type="text/javascript" src="{THEME}/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Initializations -->
    <script type="text/javascript">
        // Animations initialization
        new WOW().init();
    </script>
    <script>
(function($){
$(window).load(function(){
 
$("body").mCustomScrollbar({
theme:"minimal-dark"
});
 
});
})(jQuery);
</script>
</body>

</html>