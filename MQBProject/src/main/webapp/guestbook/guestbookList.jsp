<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	a{
		text-decoration: none;
		color: black;
	}
	
	a:hover{
		text-decoration: underline;
	}
	
	#guestbookListTable table a:hover{
		color: limegreen;
	}

	#guestbookListTable{
		width: 100%;
		border-top: 2px solid #483D8B;
		/* border-collapse: collapse; */
	}
	
	#guestbookListTable #title th{
		border-bottom: 2px solid #483D8B;
		font-size: 20px;
		height: 50px;
		color: #483D8B;
		background-color: aliceblue;
	}
	
	#guestbookListTable td{
		border-bottom: 1px solid #483D8B;
		height: 30px;
		font-size: 18px;
		color: black;
	}
</style>
<input type="hidden" id="pg" value="${pg }" />

<table id="guestbookListTable" cellspacing="0" cellpadding="5">
	<tr id="title">
		<th>글번호</td> 
		<th width="600px">제목</td>
		<th >작성자</td>
		<th width="200px">이메일</td>
		<th width="180px">작성일</td>
	</tr>
</table>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/MQBProject/guestbook/getGuestbookList.do',
		type: 'post',
		data: 'pg='+$('#pg').val(),
		dataType: 'json', 
		success: function(data){
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
				})).append($('<td/>',{
					align: 'left',
					}).append($('<a>',{
						href: '#',
						text: items.subject			
				}))).append($('<td/>',{
					align: 'center',
					text: items.name
				})).append($('<td/>',{
					align: 'center',
					text: items.email
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
				})).appendTo($('#guestbookListTable'));
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>
