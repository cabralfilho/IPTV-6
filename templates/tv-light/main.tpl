<!DOCTYPE html>
<html lang="ru">
<head>
{headers}
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="{THEME}/images/favicon.png" />
  <link href="{THEME}/style/styles.css" type="text/css" rel="stylesheet" />
  <link href="{THEME}/style/engine.css" type="text/css" rel="stylesheet" />
  <script type="text/javascript" src="{THEME}/billing/js/paygroups.js"></script>

    
  <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
</head>

<body>

<div class="wrap">


	<div class="main center">
		<div class="menus clearfix">
		
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-40069519-4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-40069519-4');
</script>		
		
          <ul><li><a href="https://billing.alternativa.fun/">Главная</a></li>
		       <li><a href="/profile/">Личный кабинет</a></li>
               <li><a href="/profile/">ПОЛУЧИТЬ ТЕСТ</a></li>
			   <li><a href="/billing.html/pay/">ПОПОЛНИТЬ БАЛАНС</a></li>
							<!--<li><a href="/" class="active ic-l" id="show-menu"><span class="fa fa-folder-o"></span>Главная</a></li>
				<li><a href="#">Ссылка</a></li>-->
			</ul>
		</div>
		
		<!--<nav class="menu-inner" id="menu-inner">
			<ul class="flex-row">
				<li><a href="#">Ссылка 4</a></li>
			</ul>
		</nav>-->
		
		<div class="cols clearfix">
		
			<div class="cont">
				{info}
				
  [aviable=main][/aviable]
   <p align="center">&nbsp;</p>
   <center>{login}</center>
   <p align="center">&nbsp;</p>
   [aviable=main]
   
   <center><script type="text/javascript" src="https://vk.com/js/api/openapi.js?157"></script>
   


<!-- VK Widget -->
<div id="vk_groups"></div>
<script type="text/javascript">
VK.Widgets.Group("vk_groups", {mode: 4, wide: 1, no_cover: 1, width: "800", height: "600", color1: 'DCF9EA', color3: '0F1BFC'}, 160404871);
</script><center>[/aviable]
   
				[aviable=main|cat]
				[sort]<div class="sorter clearfix" data-label="Сортировать по:">
					{sort}
					<div class="grid-select clearfix" id="grid-select">
						<div data-type="grid-list"><span class="fa fa-reorder"></span></div>
						<div data-type="grid-thumb" class="current"><span class="fa fa-th"></span></div>
					</div>
				</div>[/sort]
				<div class="floaters clearfix grid-thumb" id="grid">
					{content}
				</div>
				[/aviable]
				[not-aviable=main|cat]
				<div class="speedbar">{speedbar}</div>
					{content}
				[/not-aviable]
			</div>
			<!-- end cont -->
			
			<aside class="side" id="side">
				<div class="side-b">
					
					
				</div>

				<div class="side-b">
					
					
					
					
				</div>
			</aside>
			<!-- end side -->
			
		</div>
		<!-- end cols -->
		
	</div>
	<!-- end main -->
	
	
	
</div>
<!-- end wrap -->	

<ul class="mob-menu" id="mob-menu"></ul>
<!-- мобильное меню, не удалять -->
 
[not-aviable=search]{jsfiles}[/not-aviable]
[not-static=tv-programma] 
<script src="{THEME}/js/libs.js"></script> [/not-static]
[static=tv-programma] 
      <link rel="stylesheet" type="text/css" href="/test/csstv1.css">
     <link rel="stylesheet" type="text/css" href="/test/quyrytv.css" />	    
    <script src="{THEME}/js/libs1.js"></script>
        <script type="text/javascript" src="http://kartina.tv/epg/js/jquery-1.6.4.min.js" charset="windows-1251"></script>
	
    <script type="text/javascript" src="http://kartina.tv/epg/js/ui/jquery-ui-1.8.16.custom.min.js" charset="windows-1251"></script>
        <script type="text/javascript" src="http://kartina.tv/epg/js/jquery.cookie.js" charset="windows-1251"></script>
    <script type="text/javascript" src="/test/epg.js" charset="windows-1251"></script>  
    <script type="text/javascript">    
 	if ($(window).width() > 750) {	
		var $gotops=$('.san_active'); 
		$ (window).scroll (function () {
			if ($ (this).scrollTop () > 300) {$gotops.fadeIn(200);
			} else {$gotop.fadeOut(200);}
		});	
		$gotops.click(function(){
		$('html, body').animate({ scrollTop : 0 }, 'slow');
		});
	};             
 </script>
    
    [/static]  
    

{AJAX}  

	<script src="{theme}/js/slider.js"></script>
	<script>
		$(function(){
			$('#slides').slides({
				preload: true,
				preloadImage: '{theme}/images/loading.gif',
				play: 4000,
				pause: 2000,
				hoverPause: true,
				animationStart: function(){
					$('.caption').animate({
						//bottom:-35
					},100);
				},
				animationComplete: function(current){
					$('.caption').animate({
						bottom:0
					},200);
					if (window.console && console.log) {
						// example return of current slide number
						console.log(current);
					};
				}
			});
		});
	</script>
	
<!-- Chatra {literal} -->
<script>
    (function(d, w, c) {
        w.ChatraID = '5kvpu7vYeyTWP7vnY';
        var s = d.createElement('script');
        w[c] = w[c] || function() {
            (w[c].q = w[c].q || []).push(arguments);
        };
        s.async = true;
        s.src = 'https://call.chatra.io/chatra.js';
        if (d.head) d.head.appendChild(s);
    })(document, window, 'Chatra');
</script>
<!-- /Chatra {/literal} -->
	
	<!--LiveInternet counter--><script type="text/javascript">
document.write("<a href='//www.liveinternet.ru/click' "+
"target=_blank><img src='//counter.yadro.ru/hit?t50.1;r"+
escape(document.referrer)+((typeof(screen)=="undefined")?"":
";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
";h"+escape(document.title.substring(0,150))+";"+Math.random()+
"' alt='' title='LiveInternet' "+
"border='0' width='31' height='31'><\/a>")
</script><!--/LiveInternet-->

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-40069519-5"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-40069519-5');
</script>


</body>
 
</html>