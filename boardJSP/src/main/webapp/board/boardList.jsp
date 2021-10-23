<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="java.util.List"%>

<%
int pg = Integer.parseInt(request.getParameter("pg"));

int endNum = pg*5;
int startNum = endNum-4;

BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);

int totalA = boardDAO.getTotalA();
int totalP = (totalA + 4) / 5;

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		a{
			text-decoration: none;
			color: black;
		}
		
		a:hover{
			text-decoration: underline;
		}
		
		table a:hover{
			color: limegreen;
		}
	
		div a:nth-child(<%=pg%>){
			color: red;
		}
		
		table{
			width: 100%;
			border-top: 1px solid blue;
			/* border-collapse: collapse; */
		}
		
		#title td{
			font-weight: bold;
			font-size: 15px;
			height: 30px;
			color: blue;
		}
		
		td{
			border-bottom: 1px solid blue;
			text-align: center;
			font-size: 13px;
		}
	</style>
</head>
<body>
	<table cellspacing="0" cellpadding="5"><!-- frame="hsides" rules="rows"로 가로줄만 나오게! -->
		<tr id="title">
			<td>글번호</td> <!-- td대신 th로 잡으면 자동으로 중앙정렬됨 -->
			<td style="width: 200px">제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td style="width: 100px">작성일</td>
		</tr>
	<%if(list != null){ %>
		<%for(BoardDTO boardDTO : list){ %>
		<tr>
			<td><%=boardDTO.getSeq() %></td>
			<td style="text-align:left"><a href="boardView.jsp?seq=<%=boardDTO.getSeq() %>"><%=boardDTO.getSubject() %></a></td>
			<!-- <a href="boardView.jsp?seq=<%=boardDTO.getSeq() %>&pg=<%=pg%>"> 로 해서 pg값도 보내주기 -->
			<td><%=boardDTO.getId() %></td>
			<td><%=boardDTO.getHit() %></td>
			<td><%=boardDTO.getLogtime() %></td>
		</tr>
		<%} // for %>
	</table>
	<br><br>
	<div style="width: 100%; text-align: center;">
		<% for(int i=1; i<=totalP; i++){%>
			[<a href="boardList.jsp?pg=<%=i %>"> <%=i %> </a>]
		<%} // for %>
	</div>
	<%} // if %>
</body>
</html>