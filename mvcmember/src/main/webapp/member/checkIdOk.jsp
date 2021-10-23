<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/mvcmember/js/member.js"></script> 
</head>
<body>
	<h3>아이디 ${id } 사용 가능</h3>
	<input type="button" value="사용하기" onclick="idInsert('${id}')">
	<input type="hidden" id="savedId" value="${id }"> <%-- 이렇게 해서 id의 value값을 가져와도 됨 --%>
</body>
</html>