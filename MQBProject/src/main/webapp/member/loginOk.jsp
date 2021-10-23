<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		img#ok{
		width: 350px;
		height: 350px;
		cursor: pointer;
		}
	</style>
</head>
<body>
	<img src="/MQBProject/image/bunny1.jpg" id="ok" onclick="location.href='/MQBProject/index.jsp'">
	
	<br>
	<%-- <%=name %>님 로그인 --%>
	${sessionScope.memName }님 로그인
	<br><br>
	<input type="button" value="로그아웃" onclick="location.href='/MQBProject/member/logout.do'">
	<input type="button" value="회원정보수정" onclick="location.href='/MQBProject/member/modifyForm.do'">
</body>
</html>