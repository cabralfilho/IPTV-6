		<div class="dcont ignore-select">
			<p class="gradlight polltitle">{question}</p>
			{list}
			[voted]<div align="center">����� �������������: {votes}</div>[/voted]
			[not-voted]
			<br>
			<button class="fbutton" type="submit" onclick="doPoll('vote', '{news-id}'); return false;" ><span>����������</span></button>
			<button class="fbutton" type="submit" onclick="doPoll('results', '{news-id}'); return false;"><span>����������</span></button>
			[/not-voted]
		</div>