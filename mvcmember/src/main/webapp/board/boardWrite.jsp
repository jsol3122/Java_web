<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.bean.BoardDTO"%>
<%@ page import="board.dao.BoardDAO" %>  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<!-- 	<h2 style="color: blue">글쓰기 성공</h2>
	<br><br>
	<input type="button" value="홈으로" onclick="location.href='../index.jsp'"> -->
	
	<script type="text/javascript">
		window.onload=function(){
			alert('글쓰기 성공');
			location.href="/mvcmember/board/boardList.do?pg=1";
		}
	</script>
</body>
</html>