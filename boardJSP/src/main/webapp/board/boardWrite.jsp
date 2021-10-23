<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.bean.BoardDTO"%>
<%@ page import="board.dao.BoardDAO" %>
    
<%
request.setCharacterEncoding("UTF-8"); /* post방식일때만 이작업 필요 */

BoardDTO boardDTO = new BoardDTO();
boardDTO.setSubject(request.getParameter("subject"));
boardDTO.setContent(request.getParameter("content"));
/* 여기서 DTO안에 데이터를 int값들 제외하고 다 넣어준 다음, DAO에서 DTO자체를 넣어줘도 됨 */

BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.write(boardDTO);

%>
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h2 style="color: blue">글쓰기 성공</h2>
	<br><br>
	<input type="button" value="글목록" onclick="location.href='boardList.jsp?pg=1'">
</body>
</html>