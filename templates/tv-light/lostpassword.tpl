<div class="form-wrap">
	<h1>������������ ������</h1>
	<div class="form-item clearfix">
		<label>��� �����:</label>
		<input type="text" name="lostname" placeholder="��� ����� ��� E-Mail �� �����" />
	</div>
	[sec_code]
	<div class="form-item clearfix imp">
		<label>������� ��� � ��������:</label>
		<div class="form-secur">
            <input type="text" name="sec_code" id="sec_code" placeholder="������� ��� � ��������" maxlength="45" required />{code}
		</div>
	</div>
	[/sec_code]
	[recaptcha]
	<div class="form-item clearfix imp">
		<label>������� ��� ����� � ��������:</label>
		<div class="form-secur">
			{recaptcha}
		</div>
	</div>
	[/recaptcha]
	<div class="form-submit">
		<button name="submit" type="submit">���������</button>
	</div>
</div>
