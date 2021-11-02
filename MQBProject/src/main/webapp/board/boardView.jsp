<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
	#boardViewForm table{
		width: 100%;
		border-top: 2px solid #483D8B;
		border-collapse: collapse;
	}
	
	#boardViewForm #subject td{
		font-size: 25px;
		text-align: center;
		font-weight: bold;
		background-color: aliceblue;
	}
	
	#boardViewForm #info td{
		text-align: center;
		font-size: 15px;
	}
	
	#boardViewForm td{
		border-bottom: 2px solid #483D8B;		
		padding: 10px;
	}
	
	#boardViewForm div{
		text-align: center;
	}
	#boardViewForm #content td{
		word-break: break-all;
		text-align: left;
		font-size: 15px;
	}
	#boardViewForm #content pre{
		white-space: pre-wrap;	
	}
</style>

<form id="boardViewForm">
	<input type="hidden" name="pg" id="pg" value="${pg }" />
	<input type="hidden" name="seq" id="seq" value="${seq }" />
	<table>
	
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
		<input type="hidden" id="update" value="글수정" onclick="mode(1)"/>
		<input type="hidden" id="delete" value="글삭제" onclick="mode(2)"/>
		<input type="button" value="답글" onclick="location.href='/MQBProject/board/boardReplyForm.do?pg=${pg}&seq=${seq}'"/>
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
				
				if(data.sessionId == data.id){ // show() 와 hide() 이용해서 숨기고 보일수도 있음
					$('#update, #delete').prop('type', 'button');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	});
	
	function mode(num){
		if(num == 1){ // 수정
			document.getElementById('boardViewForm').method = 'post'; // 폼에 post방식 지정
			document.getElementById('boardViewForm').action = '/MQBProject/board/boardModifyForm.do';
			document.getElementById('boardViewForm').submit();
		}else if(num == 2){ // 삭제
			document.getElementById('boardViewForm').method = 'post'; 
			document.getElementById('boardViewForm').action = '/MQBProject/board/boardDelete.do';
			alert('삭제 완료');
			document.getElementById('boardViewForm').submit();
		}
	};

</script>
