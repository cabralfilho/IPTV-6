<div class="form-wrap">
	<h1>�������� �����</h1>
	[not-logged]
	<div class="form-item clearfix imp">
		<label>���� ���:</label>
		<input type="text" maxlength="35" name="name" placeholder="���� ���" />
	</div>
	<div class="form-item clearfix imp">
		<label>��� E-Mail:</label>
		<input type="text" maxlength="35" name="email" placeholder="��� �����" />
	</div>
	[/not-logged]
	<div class="form-item clearfix">
		<label>�������� ����:</label>
		<div class="form-secur">
            {recipient}
		</div>
	</div>
	<div class="form-item clearfix">
		<label>���� ���������:</label>
		<input type="text" maxlength="45" name="subject" placeholder="���� ���������" />
	</div>
	<div class="form-textarea">
		<label>���� ������:</label>
		<textarea name="message" style="height: 160px" ></textarea>
	</div>
	[attachments]
	<div class="form-item">
		<label>���������� �����:</label>
		<input name="attachments[]" type="file" multiple>
	</div>
	[/attachments]
	[question]
	<div class="form-item clearfix imp">
		<label>������:</label>
		<div class="form-secur"><div style="margin-bottom:10px;">{question}</div>
        <input type="text" name="question_answer" id="question_answer" placeholder="������� ����� �� ������" required />
		</div>
	</div>
	[/question]
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
		<button name="send_btn" type="submit">���������</button>
	</div>
</div>