<h4>��������� �������</h4>

<form action="" method="post">
	<ul class="ui-form">
		<li class="form-group">
			<label>����� ��������:</label>
			<input type="text" value="{get.sum}" name="bs_summa" style="width: 30%" required> {get.sum.currency}
			<span style="margin-left: 70px">( �������: {minimum} {minimum.currency}, �� ��� �������� {commission}% )</span>
		</li>
		<li class="form-group">
			<label>����������:</label>
			<input type="text" name="bs_user_name" style="width: 100%" value="{to}" placeholder="����� ��� email ����������" required>
		</li>
	</ul>

	<p style="padding-top: 20px">
		<button type="submit" name="submit" class="btn"><span>���������</span></button>
	</p>

	<input type="hidden" name="bs_hash" value="{hash}" />
</form>

<h4>������� �������� �������</h4>

<table class="billing-table">
	<tr>
		<td><b>����</b></td>
        <td><b>�����</b></td>
        <td><b>������������</b></td>
	</tr>

	[history]
	<tr>
		<td>{date=j.m.Y G:i}</td>
		<td>{transfer.sum}</td>
		<td>{transfer.desc}</td>
    </tr>
    [/history]

    [not_history]
	<tr>
		<td colspan="3">&raquo; ��������� �� �������</td>
	</tr>
    [/not_history]
</table>

[paging]
	<div class="billing-pagination">
		[page_link]<a href="{page_num_link}">{page_num}</a>[/page_link]
		[page_this] <strong>{page_num}</strong> [/page_this]
	</div>
[/paging]
