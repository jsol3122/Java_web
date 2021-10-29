<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
	table{
		width: 100%;
		border-top: 1px solid black;
		border-collapse: collapse;
	}
	
	#subject td{
		font-size: 25px;
		text-align: center;
		font-weight: bold;
	}
	
	#info td{
		text-align: center;
	}
	
	td{
		border-bottom: 1px solid black;		
		padding: 10px;
	}
	
	div{
		text-align: center;
	}
	#content{
		word-break: break-all;
	}
</style>

<form>
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
		<input type="button" value="목록" onclick="location.href='boardList.jsp?pg='">
	</div>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url: '/MQBProject/board/getBoardView.do',
				type: 'post',
				data: 'pg='+$('#pg').val()+'&seq='+$('#seq').val(),
				dataType: 'json',
				success: function(data){
					// alert(JSON.stringify(data));
					$('#subject td').html(data.subject);
					$('#info span:eq(0)').html(data.seq);
					$('#info span:eq(1)').html(data.id);
					$('#info span:eq(2)').html(data.hit);
					$('#content pre').html(data.content);
				},
				error: function(err){
					console.log(err);
				}
			});
		});
	</script>
</form>
