<h4><center>Вы будете получать <b>5%</b> от каждого, кто подключит подписку по Вашей ссылке и за продление подписки.</center></h4>
<h5>Выша партнерская ссылка</h5>

<p>
	{link}<br/>
    или<br/>
    {link2}<br/>
    или<br/>
    {link3}<br/>
</p>
<h5>Действия партнеров</h5>

<table class="billing-table">
	<tr>
		<td width="5%"><b>Пользователь</b></td>
        <td width="5%"><b>Дата</b></td>
        <td><b>Действие</b></td>
        <td width="5%"><b>Отчисления</b></td>
	</tr>

    [history]
	<tr>
		<td>{referral.name}</td>
		<td>{date=j.m.Y}</td>
        <td>{referral.desc}</td>
        <td>{referral.bonus} {referral.bonus.currency}</td>
    </tr>
    [/history]

	[not_history]
    <tr>
		<td colspan="5">&raquo; Вознаграждений нет</td>
    </tr>
    [/not_history]
</table>

[paging]
	<div class="billing-pagination">
		[page_link]<a href="{page_num_link}">{page_num}</a>[/page_link]
		[page_this] <strong>{page_num}</strong> [/page_this]
	</div>
[/paging]


<h5>Приглашенные пользователи ({count})</h5>

<p>
	{list}
</p>
