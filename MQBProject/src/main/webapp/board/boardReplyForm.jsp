<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	#boardReplyForm div{
		color: red;
		font-size: 8pt;
		font-weight: bold; 
	}
</style>
<form id="boardReplyForm">
	<h3>답글쓰기</h3>
	<input type="hidden" id="pseq" name="pseq" value="${pseq }" />
	<input type="hidden" id="pg" name="pg" value="${pg }" />
	
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">제목</td>
			<td>
				<input type="text" name="subject" size="41">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">내용</td>
			<td>
				<textarea name="content" rows="10" cols="40"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="replyBtn" value="답글쓰기">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#replyBtn').click(function(){
			$('#subjectDiv').empty();
			$('#contentDiv').empty();
			
			if($('input[name=subject]').val() == '')
				$('#subjectDiv').html('제목을 입력하세요');
			else if($('textarea[name=content]').val() == '')
				$('#contentDiv').html('내용을 입력하세요');
			else{
				$.ajax({
					url: '/MQBProject/board/boardReply.do',
					type: 'post',
					data: $('#boardReplyForm').serialize(),
					success: function(){
						alert('답글쓰기 성공 :-)');
						location.href='/MQBProject/board/boardList.do?pg='+$('#pg').val();
					},
					error: function(err){
						console.log(err);
					}
				});
			}
				
		});
	});
</script>