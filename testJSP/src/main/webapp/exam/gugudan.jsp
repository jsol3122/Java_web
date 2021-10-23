<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
	<!--  out.println쓰는 대신 이렇게 하나 하나 값을 넣어서 쓸 수도 있음 / 줄간격 맞출수없어서 테이블잡음 -->
	<% for(int num=1; num<10; num++){ %>
		<tr>
		<% for(int dan=2; dan<10; dan++){  %>
			<td width="150" align="center"><%=dan %> * <%=num %> = <%=dan*num %></td>
		<% } %>
		</tr>
	<% } %>
	</table>
</body>
</html>