<!DOCTYPE html>
<html lang="ru">
<head>
{headers}
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="{THEME}/images/favicon.png" />
  <link href="{THEME}/style/styles.css" type="text/css" rel="stylesheet" />
  <link href="{THEME}/style/engine.css" type="text/css" rel="stylesheet" />

    
  <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
</head>

<body>

<div class="wrap">


	<div class="main center">

		
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
   
  [/aviable]
   
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
	
<center>
<a href="//www.free-kassa.ru/"><img src="//www.free-kassa.ru/img/fk_btn/17.png"></a>
<script id="_waug0a">var _wau = _wau || []; _wau.push(["dynamic", "lmsd6b59gm", "g0a", "000000ffffff", "small"]);</script><script async src="//waust.at/d.js"></script>
</center>

  <script type="text/javascript" src="{THEME}/billing/js/paygroups.js"></script>



</body>
 
</html>