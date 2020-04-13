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

<h4>Пополнение баланса <center><font color="#AFEEEE">1: Заполните сумму: 2: Нажмите иконку удобной Вам системы оплаты 3: ОПЛАТИТЬ:</font></center></h4>

	<center><span class="billing-pay-step" style="background-color: #bfe5e7; line-height: 60px;">
		
		<input type="text" value="{get.sum}  {module.get.currency}" name="billingPaySum" id="billingPaySum" style="height: 40px; width: 100px" required>
	</span>
<div><b>ОПИСАНИЯ СИСТЕМ ПОПОЛНЕНИЯ</b></div>
<div><b>WEBMONEY</b> прием <font color="#FF8C00">WMZ, WMR, WMB.</font></div>
<div><b>FREE-KASSA</b> <font color="#FF0000"><font color="#000000">прием</font> <font color="#FF8C00">PAYPAL, QIWI, Яндекс деньги, VISA RUB, VISA UAH, Мобильные операторы РФ, Криптовалюты.</font></font></div>
<div><b>PIASTRIX</b> <font color="#FF0000"><font color="#000000">прием</font> <font color="#FF8C00">QIWI, VISA RUB, VISA UAH, Приват24, Терминалы РФ, Альфа-клик, Perfect Money.</font></font></div>
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
			ОПЛАТИТЬ
		</button>
	</p>

	<input type="hidden" name="billingHash" value="{hash}" />
</form></center>
