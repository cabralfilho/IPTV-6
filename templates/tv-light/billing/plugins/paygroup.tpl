<div id='paygrouptpl' title='������� ��������� ����� "{pay.group_name}"' style='display:none'>

	<link media="screen" href="/templates/{module.skin}/billing/css/styles.css" type="text/css" rel="stylesheet" />

	[need_login]
		<p>��������� �����������</p>
	[/need_login]

	[plugin_off]
		<p>����� ������ �������� ����������</p>
	[/plugin_off]

	[group_denied]
		<p>��� ����� ������� ������ ���������� ������� � ������ ������</p>
	[/group_denied]

	[group_was_paid]
		<p>�� ��� ���������� � ������ ������</p>
	[/group_was_paid]

	[pay_error_time]
		<p>���������� �������� ��������� ���������� ����</p>
	[/pay_error_time]

	[pay_error_balance]
		<p>������������ ������� �� �������</p>
	[/pay_error_balance]

	[pay_ok]
		<p><b>������ ���������</b><br>�� ������� � ������ {pay.group_name} [pay_time] �� {date} [/pay_time] [pay_one][/pay_one]</p>
	[/pay_ok]

	[form]
		<table width="100%" class="billing-table">
			<tr>
				<td>��� �������� ����:</td>
				<td>{user.group_name}</td>
			</tr>
			[pay_time]
				<tr>
					<td>���� �������:</td>
					<td>
						<select id="BillingGroupDays" onchange="BillingGroup.Days()" style="width: 140px">
						[select]
							<option value="{days}" data-price="{price}" data-currency="{currency}">{title}</option>
						[/select]
					</select>
					</td>
				</tr>
			[/pay_time]
			[pay_one]
				<tr>
					<td>����� ��������: </td>
					<td>��������<input type="hidden" id="BillingGroupDays" data-price="{pay.sum}" data-currency="{pay.sum.currency}" value="1"></td>
				</tr>
			[/pay_one]
			<tr>
				<td>��� ������:</td>
				<td>{user.balance} {user.balance.currency}</td>
			</tr>
			<tr>
				<td>� ������:</td>
				<td><span id="BillingGroupBalancePay"></span><td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center" id="BillingGroupBalance">
					������ ����� ������: <span id="BillingGroupBalanceSum"></span>
				</td>
			</tr>
		</table>

		<input type="hidden" id="BillingGroupMyBalance" value="{user.balance}">
		<input type="hidden" id="BillingGroupCurrency" value="{module.currency}">
		
		<div style="text-align: center; padding-top: 10px">
			<span id="BillingGroupBtn">
				<button type="submit" class="btn" onClick="BillingGroup.Pay()">
					<span>������� � ������</span>
				</button>
			</span>
			
			<span id="BillingGroupBtnPay">
				<button type="submit" class="btn" id="BillingGroupBtnPayClick">
					<span>��������� ������ �� <span id="BillingGroupNeedPay"></span></span>
				</button>
			</span>
		</div>
	[/form]

	{content}
</div>
