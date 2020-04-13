<article class="full">

	<header class="full-title ignore-select">
		<h1 class="top-title">{title}</h1>
		[not-group=5][edit]<span class="fa fa-bars" title="�������������"></span>[/edit][/not-group]
	</header>

	<div class="full-desc">
        
		<div class="full-text clearfix video-box">
			<div class="full-poster ignore-select" id="full-poster">
				<div class="f-poster">
					<img src="{image-1}" alt="{title}" />
					<div class="fp-rate">{rating}{vote-num}</div>
                    [rating-type-3]
				<div class="rate3 clearfix">
				<div class="pluss" id="pluss-{news-id}" onclick="doRateLD('plus', '{news-id}');"><span class="fa fa-thumbs-up"></span></div>
				<div class="minuss" id="minuss-{news-id}" onclick="doRateLD('minus', '{news-id}');"><span class="fa fa-thumbs-down"></span></div>
			{rating}
			{vote-num}
			</div>
			[/rating-type-3]
				</div>
                <div style="height: 40px;line-height: 40px;"></div>
				<div class="voices">���. ����������: 
                    <br/>����� �������
                
                </div>
                
          
			</div>
			{full-story}
		</div>

	[tags]
	<div class="full-taglist ignore-select">
		<div class="full-taglist-t">����:</div>
		{tags}
	</div>
	[/tags]
	{pages} {poll}
        
		<div class="full-info clearfix ignore-select">
			<div class="fi-col">
	
				<div class="fi-col-item"><span>����������:</span> �����������2</div>
			</div>

		</div>

	</div>

    
	<div class="info-btns ic-l ignore-select flex-row">

		[add-favorites]<span class="fa fa-bookmark-o"></span>�������� � ��������[/add-favorites]
		[del-favorites]<span class="fa fa-bookmark"></span>������ �� ��������[/del-favorites]
		[rating-plus]<span class="fa fa-thumbs-o-up"></span>��� ��������[/rating-plus]
		[complaint]<span class="fa fa-exclamation"></span>�������� �� ������[/complaint]
	</div>
    

    
	<div class="rels">
		<div class="rel-t">������� ��������:</div>
		<div class="rel-c">
			{related-news}
		</div>
	</div>

</article>

		<div class="full-comms ignore-select" id="full-comms">
			<div class="comms-head clearfix">
				<div class="comms-title">����������� <sup>{comments-num}</sup></div>
				<div class="add-commbtn button ic-l" id="add-commbtn"><span class="fa fa-plus"></span>��������������</div>
			</div>
			{addcomments}
			[comments]
			<div class="comments-items">
				{comments}
				{navigation}
			</div>
			[/comments]
		</div>