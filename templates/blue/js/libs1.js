/* Datalife Engine template by: redissx (ICQ: 275116000, E-mail: redissx@gmail.com, Website: webrambo.ru )  */
 $.noConflict();
 jQuery(document).ready(function($) {

//$(document).ready(function(){
	
	$("body").addClass("js");

    
	$(document).on('click','.ps-link',function(){
			var $url = $(this).attr("data-link");
			window.location.href=$url;
	});
	$('.head-menu li:has(ul) > a').click(function() {
			$(this).next('.hidden-menu').stop(true,true).slideToggle(200);
			$(this).parent().toggleClass('menuactive').siblings().removeClass('menuactive').children('ul').fadeOut(100);
			return false;
	});	
	$("#show-menu").click(function(){
		if($.cookie('vis-menu') != '1' ) {
			$("#menu-inner").slideDown(200);
			$.cookie('vis-menu', 1, { path: '/', expires : 7});
			$(this).find('.fa').toggleClass('fa-folder-o fa-times');
		} else {
			$("#menu-inner").slideUp(200);
			$.cookie('vis-menu', 0, { path: '/', expires : 7});
			$(this).find('.fa').toggleClass('fa-folder-o fa-times');
		};
		return false;
	});
	if($.cookie('vis-menu') != '1' ) {
		$("#menu-inner").hide();
	} else {
		$("#menu-inner").show();
		$('#show-menu').find('.fa').removeClass('fa-folder-o').addClass('fa-times');
	}; 
		if($.cookie('grid-view') == 'grid-list' ) {
		$('#grid').removeClass('grid-thumb').addClass('grid-list');
		$('#grid-select div:first-child').addClass('current').siblings('div').removeClass('current');
		} 
		if($.cookie('grid-view') == 'grid-thumb' ) {
		$('#grid').removeClass('grid-list').addClass('grid-thumb');
		$('#grid-select div:last-child').addClass('current').siblings('div').removeClass('current');
		} 
		$('#grid-select').on('click', 'div:not(.current)', function() {
			var viewType = $(this).attr('data-type'),
				gr = $('#grid');
			$(this).addClass('current').siblings('div').removeClass('current');
			gr.stop().fadeOut(100, function(){
				gr.toggleClass('grid-list grid-thumb');
				$(this).fadeIn().addClass(viewType);
			});
			$.cookie('grid-view', viewType, { path: '/', expires : 7});
		});
	if ($(window).width() > 1220) {	
		$('#grid').on({
			mouseenter: function () {
					if($.cookie('grid-view') != 'grid-list' ) {
						$(this).closest('.short').addClass('s-active').find('.short-d').fadeIn(200);
					};
			},
			mouseleave: function () {
					if($.cookie('grid-view') != 'grid-list' ) {
						$(this).closest('.short').removeClass('s-active').find('.short-d').fadeOut(200);
					};
			}
		},'.short-mask');
	//	$('#full-poster').prependTo('#side');
		$('.m-rate').wrate();
		$('.tops-r').wrate();
		$('.fp-rate').wrate();
	} else {
		$(document).on('click','.short-i',function(){
				var $url = $(this).find('.ps-link:first').attr("data-link");
				window.location.href=$url;
		});
		$('.tops-r').wrate();
		$('.fp-rate').wrate();
		$('#head-menu > li:not(.head-ic').each(function(){
			var $item = $(this);
			$item.appendTo('#mob-menu');
		}); 
		$(".show-menu").click(function(){
			$("#mob-menu").fadeToggle(0);
			$(this).find('.fa').toggleClass('fa-bars fa-times');
			$('.main, .section, .foot').toggleClass('fada');
		});
	};	
	$(".scrolla").click(function(){
		$('html, body').animate({scrollTop: $(".tabs-box").offset().top - 140}, 800);
	});
	$('.tabs-box').wtabs();
	$('.rate3').each(function(){
        var ratebox = $(this);
        var raterate = parseInt(ratebox.find('.ratingtypeplusminus').text());
        var ratecount = parseInt(ratebox.find('span[id]:last').text());
        if ( ratecount >= raterate ) {
		ratebox.append('<div class="ratebar"><div class="ratefill"></div></div>');
        var minusik = (ratecount - raterate)/2;
        var plusik = ratecount - minusik;
		if ( ratecount > 0 ) {
			var ratefill = ratebox.find('.ratefill');
			var fill = Math.round(plusik/ratecount*100);
			ratefill.css({'width':''+fill+'%'});
		};
        $(this).children('.pluss').append('<span class="plusik">'+plusik+'</span>');
        $(this).children('.minuss').append('<span class="minusik">'+minusik+'</span>');
        };
    });
	$('#loginbtn, #ac-av').html($('#avatar-box').html());
	$('.login-social a').on('click',function(){
	   var href = $(this).attr('href');
       var width  = 820;
       var height = 420;
       var left   = (screen.width  - width)/2;
       var top   = (screen.height - height)/2-100;   

       auth_window = window.open(href, 'auth_window', "width="+width+",height="+height+",top="+top+",left="+left+"menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no");
       return false;
	});
	$("#add-commbtn").click(function(){
		$("#add-comm-form").fadeToggle(200);
	});
	$(".comm-q").click(function(){
		$("#add-comm-form").fadeIn(200);
	});
    $('#dle-content > #dle-ajax-comments').appendTo($('#full-comms')); 
	if ($(window).width() > 750) {
		$('body').append('<div id="gotop"><span class="fa fa-chevron-up"></span></div>');
		var $gotop=$('#gotop'); 
		$ (window).scroll (function () {
			if ($ (this).scrollTop () > 300) {$gotop.fadeIn(200);
			} else {$gotop.fadeOut(200);}
		});	
		$gotop.click(function(){
		$('html, body').animate({ scrollTop : 0 }, 'slow');
		});
	};
});
function doAlert() {
	DLEalert("Регистрируйтесь, и вы сможете добавлять в закладки, оценивать и многое другое!", 'Необходима регистрация');
};
function doRateLD( rate, id ) {
	ShowLoading('');
	$.get(dle_root + "engine/ajax/rating.php", { go_rate: rate, news_id: id, skin: dle_skin , user_hash: dle_login_hash }, function(data){
		HideLoading('');
		if ( data.success ) {
			var rating = data.rating;
			rating = rating.replace(/&lt;/g, "<");
			rating = rating.replace(/&gt;/g, ">");
			rating = rating.replace(/&amp;/g, "&");
			$("#ratig-layer-" + id).html(rating);
			$("#vote-num-id-" + id).html(data.votenum);
			var ratingtext = parseInt($(rating).text());
			var minusik = (data.votenum - ratingtext)/2;
			var plusik = data.votenum - minusik;
			$("#pluss-" + id).children('.plusik').text(plusik);
			$("#minuss-" + id).children('.minusik').text(minusik);
			var ratefill = $("#pluss-" + id).parent().find('.ratefill');
			var fill = Math.round(plusik/data.votenum*100);
			ratefill.css({'width':''+fill+'%'});
		} else if (data.error) {DLEalert ( data.errorinfo, dle_info );}
	}, "json");
};
jQuery.fn.wrate = function(){
	return this.each(function() {
		var wrbox = $(this);
		var wrr = parseInt(wrbox.find('.ratingtypeplusminus').text());
		var wrv = parseInt(wrbox.find('span[id]:last').text());
        if ( wrv >= wrr && wrv > 0) {
        var wrtext = (Math.round((wrv - (wrv - wrr)/2)/wrv*100))/10;
        wrbox.text(wrtext+'/10');
        } else {wrbox.text('0/10');};
	});
};
jQuery.fn.wtabs = function(){
	return this.each(function() {
		var tabsbox = $(this);
		tabsbox.find('.tabs-sel span:first').addClass('current');
		tabsbox.find('.tabs-b:first').addClass('visible');
		tabsbox.find('.tabs-sel').on('click', 'span:not(.current)', function() {
			$(this).addClass('current').siblings().removeClass('current');
		    tabsbox.find('.tabs-b').hide().eq($(this).index()).fadeIn(400);
		});
	});
};
	

/*!
 * jQuery Cookie Plugin v1.3
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2011, Klaus Hartl
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */
 (function(e,h,j){function k(b){return b}function l(b){return decodeURIComponent(b.replace(m," "))}var m=/\+/g,d=e.cookie=function(b,c,a){if(c!==j){a=e.extend({},d.defaults,a);null===c&&(a.expires=-1);if("number"===typeof a.expires){var f=a.expires,g=a.expires=new Date;g.setDate(g.getDate()+f)}c=d.json?JSON.stringify(c):String(c);return h.cookie=[encodeURIComponent(b),"=",d.raw?c:encodeURIComponent(c),a.expires?"; expires="+a.expires.toUTCString():"",a.path?"; path="+a.path:"",a.domain?"; domain="+
a.domain:"",a.secure?"; secure":""].join("")}c=d.raw?k:l;a=h.cookie.split("; ");f=0;for(g=a.length;f<g;f++){var i=a[f].split("=");if(c(i.shift())===b)return b=c(i.join("=")),d.json?JSON.parse(b):b}return null};d.defaults={};e.removeCookie=function(b,c){return null!==e.cookie(b)?(e.cookie(b,null,c),!0):!1}})(jQuery,document);

/*! end */