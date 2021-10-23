<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 데이터 꺼내오기 - sendRedirect방식이라 데이터 공유x
String apple = (String)request.getAttribute("apple");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결과 = <%=apple %> <!-- null값 반환 -->
</body>
</html>