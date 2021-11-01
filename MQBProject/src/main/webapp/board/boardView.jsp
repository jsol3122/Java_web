<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
	#boardDetail table{
		width: 100%;
		border-top: 2px solid #483D8B;
		border-collapse: collapse;
	}
	
	#boardDetail #subject td{
		font-size: 25px;
		text-align: center;
		font-weight: bold;
		background-color: aliceblue;
	}
	
	#boardDetail #info td{
		text-align: center;
		font-size: 15px;
	}
	
	#boardDetail td{
		border-bottom: 2px solid #483D8B;		
		padding: 10px;
	}
	
	#boardDetail div{
		text-align: center;
	}
	#boardDetail #content td{
		word-break: break-all;
		text-align: left;
		font-size: 15px;
	}
</style>

<form id="boardDetail">
	<table>
		<input type="hidden" id="pg" value="${pg }" />
		<input type="hidden" id="seq" value="${seq }" />
	
		<tr id="subject">
			<td colspan="3"></td>
		</tr>
		<tr id="info">
			<td>글 번호 : <span></span></td>
			<td>작성자 : <span></span></td>
			<td>조회수 : <span></span></td>
		</tr>
		<tr id="content">
			<td colspan="3" height="150" valign="top" id="content"><pre></pre></td>
		</tr>			
	</table>
	<br>
	<div>
		<input type="button" value="목록" onclick="location.href='/MQBProject/board/boardList.do?pg=${pg}'">
		<input type="hidden" id="update" value="글수정" />
		<input type="hidden" id="delete" value="글삭제" />
		<input type="button" value="답글" />
	</div>
</form>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url: '/MQBProject/board/getBoardView.do',
			type: 'post',
			data: {'seq': $('#seq').val()},
			dataType: 'json',
			success: function(data){
				// alert(JSON.stringify(data));
				$('#subject td').html(data.subject);
				$('#info span:eq(0)').html(data.seq);
				$('#info span:eq(1)').html(data.id);
				$('#info span:eq(2)').html(data.hit);
				$('#content pre').html(data.content);
				
				if(data.sessionId == data.id){
					$('#update, #delete').prop('type', 'button');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	});
</script>
