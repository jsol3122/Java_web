<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	#boardModifyForm div{
		color: red;
		font-size: 8pt;
		font-weight: bold; 
	}
</style>
<form id="boardModifyForm" name="form">
	<input type="hidden" name="seq" id="seq" value="${seq }" />
	<input type="hidden" name="pg" id="pg" value="${pg }" />
	
	<h3>글 수정</h3>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">제목</td>
			<td>
				<input type="text" name="subject" id="subject" size="41">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">내용</td>
			<td>
				<textarea name="content" id="content" rows="10" cols="40"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="boardModifyBtn" value="글수정">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url: '/MQBProject/board/getBoardView.do',
			type: 'post',
			data:  {'seq': $('#seq').val()},
			dataType: 'json',
			success: function(data){
				console.log(JSON.stringify(data));
				
				$('#subject').val(data.subject);
				$('#content').html(data.content);
			},
			error: function(err){
				console.log(err);
			}
		});
	
	});
	
	$('#boardModifyBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val() == '')
			$('#subjectDiv').html('제목을 입력하세요');
		else if($('#content').val() == '')
			$('#contentDiv').html('내용을 입력하세요');
		else{
			$.ajax({
				url: '/MQBProject/board/boardModify.do',
				type: 'post',
				data: $('#boardModifyForm').serialize(),
				success: function(){
					alert('글 수정 완료');
					location.href = '/MQBProject/board/boardList.do?pg='+$('#pg').val();
				},
				error: function(err){
					console.log(err);
				}
			});
		}
	});
</script>
