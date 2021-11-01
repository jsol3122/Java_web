<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#GuestbookWrite').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('input[name=subject]').val() == '')
			$('#subjectDiv').html('제목을 입력하세요');
		else if($('textarea[name=content]').val() == '')
			$('#contentDiv').html('내용을 입력하세요');
		else{
			$.ajax({
				url: '/MQBProject/guestbook/guestbookWrite.do',
				type: 'post',
				data: $('#guestForm').serialize(),
				success: function(){
					alert('방명록 쓰기 성공 ;p');
					location.href='/MQBProject/guestbook/guestbookList.do?pg=1';
				},
				error: function(err){
					console.log(err);
				}
			});
		}
			
	});
});
</script>
<style type="text/css">
	#guestForm div{
		color: red;
		font-size: 8pt;
		font-weight: bold;
	}
</style>

<form name="guestForm" id="guestForm">
	<h3>글쓰기</h3>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">작성자</td>
			<td><input type="text" name="name" placeholder="작성자 입력"></td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">이메일</td>
			<td><input type="email" name="email" placeholder="이메일 입력" size="30"></td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">제목</td>
			<td>
				<input type="text" name="subject" placeholder="제목입력" size="50">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">내용</td>
			<td>
				<textarea name="content" placeholder="내용입력" rows="10" cols="50"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글작성" id="GuestbookWrite">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
