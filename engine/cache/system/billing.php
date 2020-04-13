<link media="screen" href="/templates/{module.skin}/billing/css/styles.css" type="text/css" rel="stylesheet" />

<div class="billing-panel">

	<span class="billing-menu">
		<a href="/{module.cabinet}/log/" title="Ваш баланс" class="billing-item[active]log[/active]">Баланс</a>
		
			<a href="/{module.cabinet}/referrals/" title="Партнерская программа" class="billing-item[active]referrals[/active]">Партнерская программа</a>
		
			<a href="/{module.cabinet}/prcode/" title="Промокод" class="billing-item[active]prcode[/active]">Промокод</a>
		
			<a href="/{module.cabinet}/transfer/" title="Перевод средств пользователям" class="billing-item[active]transfer[/active]">Перевод средств пользователям</a>
		
	</span>

	<img src="{user.foto}" class="billing-foto" title="{user.name}">

	<span class="billing-balance">
		{user.balance}
	</span>

	<br />

	<a href="/{module.cabinet}/pay/" class="billing-item[active]pay[/active]">Пополнить</a>
</div>


<div class="billing-content">
	{content}
</div>
