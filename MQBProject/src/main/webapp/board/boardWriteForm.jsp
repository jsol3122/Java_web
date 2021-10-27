<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#writeBtn').click(function(){
			$('#subjectDiv').empty();
			$('#contentDiv').empty();
			
			if($('input[name=subject]').val() == '')
				$('#subjectDiv').html('제목을 입력하세요');
			else if($('textarea[name=content]').val() == '')
				$('#contentDiv').html('내용을 입력하세요');
			else{
				$.ajax({
					url: '/MQBProject/board/boardWrite.do',
					type: 'post',
					data: $('#boardWriteForm').serialize(),
					success: function(){
						alert('글쓰기 성공 ;p');
						location.href='/MQBProject/board/boardList.do?pg=1';
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
	#boardWriteForm div{
		color: red;
		font-size: 8pt;
		font-weight: bold; 
	}
</style>
<form id="boardWriteForm" name="form">
	<h3>글쓰기</h3>
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
				<input type="button" id="writeBtn" value="글쓰기">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
