<h4><center>�� ������ �������� <b>5%</b> �� �������, ��� ��������� �������� �� ����� ������ � �� ��������� ��������.</center></h4>
<h5>���� ����������� ������</h5>

<p>
	{link}<br/>
    ���<br/>
    {link2}<br/>
    ���<br/>
    {link3}<br/>
</p>
<h5>�������� ���������</h5>

<table class="billing-table">
	<tr>
		<td width="5%"><b>������������</b></td>
        <td width="5%"><b>����</b></td>
        <td><b>��������</b></td>
        <td width="5%"><b>����������</b></td>
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
		<td colspan="5">&raquo; �������������� ���</td>
    </tr>
    [/not_history]
</table>

[paging]
	<div class="billing-pagination">
		[page_link]<a href="{page_num_link}">{page_num}</a>[/page_link]
		[page_this] <strong>{page_num}</strong> [/page_this]
	</div>
[/paging]


<h5>������������ ������������ ({count})</h5>

<p>
	{list}
</p>
