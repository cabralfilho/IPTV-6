[searchposts]
[fullresult]
<div class="short clearfix">
	<div class="short-i img-box">
		<img src="{image-1}" alt="{title}" />
		<div class="short-mask">
			<div class="mask-top clearfix ic-l"[group=5] onclick="doAlert();"[/group]>
				[group=5]<div><span class="fa fa-heart-o"></span>мне нравится</div>
				<div><span class="fa fa-star-o"></span>в закладки</div>[/group]
				[not-group=5]<div>[rating-plus]<span class="fa fa-heart-o"></span>мне нравится[/rating-plus]</div>
				<div>[add-favorites]<span class="fa fa-star-o"></span>в закладки</div>[/add-favorites][del-favorites]<span class="fa fa-star"></span>из закладок</div>[/del-favorites][/not-group]
			</div>
			<div class="mask-middle">
				<div class="m-rate">{rating}{vote-num}</div>
				<div class="m-views flex-col ps-link"; data-link="{full-link}">
					<div>{views}</div>
					<span>[declination={views}]просмотр|ов|а|ов[/declination]</span>
				</div>
				<div class="m-meta ic-l">
					<span><span class="fa fa-commenting"></span>{comments-num}</span>
					<span><span class="fa fa-heart"></span>{vote-num}</span>
				</div>
			</div>
			<div class="mask-bottom ic-l clearfix">
				<div class="ps-link" data-link="{full-link}"><span class="fa fa-download"></span>скачать</div>
				<div class="ps-link" data-link="{full-link}"><span class="fa fa-angle-right"></span>подробно</div>
			</div>
		</div>
	</div>
	<div class="short-text">
		<div class="short-t-or">Concrete Revolutio: Choujin Gensou</div>
		<a class="short-t" href="{full-link}">{title limit="80"}</a>
		<div class="short-c">жанр: {link-category}</div>
		<div class="short-d">{short-story limit="350"}</div>
		<div class="ps-link ic-l" data-link="{full-link}"><span class="fa fa-angle-right"></span>подробно</div>
	</div>
</div>
[/fullresult]
[shortresult]
<div class="short clearfix">
	<div class="short-i img-box">
		<img src="{image-1}" alt="{title}" />
		<div class="short-mask">
			<div class="mask-top clearfix ic-l"[group=5] onclick="doAlert();"[/group]>
				[group=5]<div><span class="fa fa-heart-o"></span>мне нравится</div>
				<div><span class="fa fa-star-o"></span>в закладки</div>[/group]
				[not-group=5]<div>[rating-plus]<span class="fa fa-heart-o"></span>мне нравится[/rating-plus]</div>
				<div>[add-favorites]<span class="fa fa-star-o"></span>в закладки</div>[/add-favorites][del-favorites]<span class="fa fa-star"></span>из закладок</div>[/del-favorites][/not-group]
			</div>
			<div class="mask-middle">
				<div class="m-rate">{rating}{vote-num}</div>
				<div class="m-views flex-col ps-link"; data-link="{full-link}">
					<div>{views}</div>
					<span>[declination={views}]просмотр|ов|а|ов[/declination]</span>
				</div>
				<div class="m-meta ic-l">
					<span><span class="fa fa-commenting"></span>{comments-num}</span>
					<span><span class="fa fa-heart"></span>{vote-num}</span>
				</div>
			</div>
			<div class="mask-bottom ic-l clearfix">
				<div class="ps-link" data-link="{full-link}"><span class="fa fa-download"></span>скачать</div>
				<div class="ps-link" data-link="{full-link}"><span class="fa fa-angle-right"></span>подробно</div>
			</div>
		</div>
	</div>
	<div class="short-text">
		<div class="short-t-or">Concrete Revolutio: Choujin Gensou</div>
		<a class="short-t" href="{full-link}">{title limit="80"}</a>
		<div class="short-c">жанр: {link-category}</div>
		<div class="short-d">{short-story limit="350"}</div>
		<div class="ps-link ic-l" data-link="{full-link}"><span class="fa fa-angle-right"></span>подробно</div>
	</div>
</div>
[/shortresult]
[/searchposts]

[searchcomments]
[fullresult]

<h3 style="margin-bottom: 0.4em;">{news_title}</h3>

<div class="comm-item clearfix">
	<div class="comm-left">
		<div class="comm-av"><img src="{foto}" alt="{login}"/></div>
	</div>
	<div class="comm-right">
		<div class="comm-top-info clearfix">
			<div class="comm-author[online] status-online[/online]">{author}</div>
			<div class="comm-date">{date}</div>
		</div>
		<div class="comm-text clearfix">
			{comment}
			[signature]<br clear="all" /><div class="signature">{signature}</div>[/signature]
		</div>
	</div>
</div>
[/fullresult]
[shortresult]
<h3 style="margin-bottom: 0.4em;">{news_title}</h3>

<div class="comm-item clearfix">
	<div class="comm-left">
		<div class="comm-av"><img src="{foto}" alt="{login}"/></div>
	</div>
	<div class="comm-right">
		<div class="comm-top-info clearfix">
			<div class="comm-author[online] status-online[/online]">{author}</div>
			<div class="comm-date">{date}</div>
		</div>
		<div class="comm-text clearfix">
			{comment}
			[signature]<br clear="all" /><div class="signature">{signature}</div>[/signature]
		</div>
	</div>
</div>
[/shortresult]
[/searchcomments]