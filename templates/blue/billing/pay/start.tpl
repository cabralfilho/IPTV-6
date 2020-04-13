<script type="text/javascript" src="/templates/{module.skin}/billing/js/scripts.js"></script>
<script type="text/javascript">
	var billingLang = [
		"Внимание",
		"Введите корректную сумму",
		"Выберите один из предложенных способов оплаты",
		"Минимальная сумма оплаты через выбранную платежную систему - ",
		"Максимальная сумма оплаты через выбранную платежную систему - "
	];

	var BillingJS = new BillingJS( billingLang, '{module.currency}', {module.format} );

	$(function()
	{
		$("#payform").submit(function(e)
		{
			return BillingJS.Pay();
		});

		$('#billingPaySum').keyup(function(e)
		{
			BillingJS.Convert();
		});

		$('.paymentSelect').click(function(e)
		{
			BillingJS.Payment($(this).attr('data-js'));
		});
	});
</script>


<form action="" id="payform" method="post">

	<center><span class="billing-pay-step" style="background-color: #ffffff; line-height: 60px;">
		
		<input type="text" value="{get.sum}  {module.get.currency}" name="billingPaySum" id="billingPaySum" style="height: 40px; width: 100px" required>
	</span>
	<span class="billing-pay-step" style="background-color: #f9fdff; line-height: 20px;">
			<br />
		[payment]
			<label class="billing-pay-label">
				<input name="billingPayment" id="{payment.name}" type="radio" value="{payment.name}" class="paymentSelect" data-js='{payment.js}'>
				<img src="{THEME}/billing/icons/{payment.name}.png" alt="{payment.title}" title="{payment.title}" />
			</label>
		[/payment]
	</span>

	<p>
		<button type="submit" id="billingPayBtn" name="submit" class="btn" style="opacity: 0.6">
			ПОПОЛНИТЬ БАЛАНС
		</button>
	</p>

	<input type="hidden" name="billingHash" value="{hash}" />
</form></center>
