<link media="screen" href="/templates/{module.skin}/billing/css/styles.css" type="text/css" rel="stylesheet" />

<div class="billing-panel">

	<span class="billing-menu">
		<a href="/{module.cabinet}/log/" title="��� ������" class="billing-item[active]log[/active]">������</a>
		[plugin]
			<a href="/{module.cabinet}/{plugin.tag}/" title="{plugin.name}" class="{plugin.active}">{plugin.name}</a>
		[/plugin]
	</span>

	<img src="{user.foto}" class="billing-foto" title="{user.name}">

	<span class="billing-balance">
		{user.balance}
	</span>

	<br />

	<a href="/{module.cabinet}/pay/" class="billing-item[active]pay[/active]">���������</a>
</div>


<div class="billing-content">
	{content}
</div>
