<div class="form-wrap">
	<h1>�������� �������</h1>
	<div class="form-item clearfix imp">
		<label for="title">���������:</label>
		<input type="text" id="title" name="title" value="{title}" maxlength="150" placeholder="������� ���������" required />
	</div>
	<div class="form-buts clearfix">
        <input title="����� �������" onclick="find_relates(); return false;" type="button" value="����� �������" />
        <a href="#" class="button" onclick="$('.form-vote').toggle();return false;">�������� �����</a>
	</div>
    <div id="related_news"></div>
	<div class="form-vote" style="display:none;">
		<div class="form-item clearfix">
			<label>���������:</label>
			<input type="text" name="vote_title" value="{votetitle}" maxlength="150" placeholder="��������� ������" />
		</div>
		<div class="form-item clearfix">
			<label>��� ������:</label>
			<input type="text" name="frage" value="{frage}" maxlength="150" placeholder="��� ������" />
		</div>
		<div class="form-textarea">
			<label>�������� ������� (������ ����� ������ �������� ����� ��������� ������):</label>
			<textarea name="vote_body" rows="10">{votebody}</textarea>
		</div>
        <div class="form-checks">
            <input type="checkbox" name="allow_m_vote" value="1" {allowmvote}>
            <label>��������� ����� ���������� ���������</label>
        </div>
	</div>
	[urltag]
	<div class="form-item clearfix">
		<label for="alt_name">URL ������:</label>
		<input type="text" name="alt_name" value="{alt-name}" maxlength="150" placeholder="��� �������" />
	</div>
	[/urltag]
	<div class="form-textarea">
		<label>����� ���������:</label>
		{category}
	</div>
	<div class="form-textarea imp">
		<label>������� �����:</label>
		[not-wysywyg]
            {bbcode}
            <textarea name="short_story" id="short_story" onfocus="setFieldName(this.name)" rows="10">{short-story}</textarea>
		[/not-wysywyg] 
		{shortarea}
	</div>
	<div class="form-textarea">
		<label>��������� �����:</label>
		[not-wysywyg]
            {bbcode}
            <textarea name="full_story" id="full_story" onfocus="setFieldName(this.name)" rows="20">{full-story}</textarea>
		[/not-wysywyg] 
		{fullarea}
	</div>
	<div class="form-xfield"><table class="tableform">{xfields}</table></div>
	<div class="form-item clearfix">
		<label for="tags">�������� �����:</label>
        <input type="text" name="tags" id="tags" value="{tags}" maxlength="150" autocomplete="off" />
	</div>
	<div class="form-checks">{admintag}</div>
	[question]
	<div class="form-item clearfix imp">
		<label>������:</label>
		<div class="form-secur"><div style="margin-bottom:10px;">{question}</div>
        <input type="text" name="question_answer" placeholder="������� ����� �� ������" required />
		</div>
	</div>
	[/question]
	[sec_code]
	<div class="form-item clearfix imp">
		<label>������� ��� � ��������:</label>
		<div class="form-secur">
            <input type="text" name="sec_code" id="sec_code" placeholder="������� ��� � ��������" maxlength="45" required />{sec_code}
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
        <button name="add" type="submit">���������</button>
        <button name="nview" onclick="preview()" type="submit">��������</button>
    </div>
</div>