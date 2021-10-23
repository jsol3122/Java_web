<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>
    
<%
request.setCharacterEncoding("UTF-8");
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg")); 
/* 지금은 history.back으로 써도 똑같지만, 실제로는 여러 경로로 해당 화면에 들어올 수 있으므로 페이지번호 받아오기! */

BoardDAO boardDAO = BoardDAO.getInstance();
BoardDTO boardDTO = boardDAO.detailView(seq);

%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table{
			width: 450px;
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
</head>
<body>
	<form>l
		<table>
			<tr id="subject">
				<td colspan="3"><%=boardDTO.getSubject() %></td>
			</tr>
			<tr id="info">
				<td>글 번호 : <%=boardDTO.getSeq() %></td>
				<td>작성자 : <%=boardDTO.getId() %></td>
				<td>조회수 : <%=boardDTO.getHit() %></td>
			</tr>
			<tr>
				<td colspan="3" height="150" valign="top" id="content"><%=boardDTO.getContent() %></td>
			</tr>			
		</table>
		<br>
		<div>
			<input type="button" value="목록" onclick="location.href='boardList.jsp?pg=<%=pg%>'">
		</div>
	</form>
</body>
</html>