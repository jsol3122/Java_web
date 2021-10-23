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
	<h3 >아이디 ${id } 사용 불가능</h3>
	<div>
		<label>아이디</label>
		<input type="text" id="reId">
		<input type="button" value="중복체크" onclick="reCheckId()">
	</div>
	<!-- div대신 form태그로 submit시켜서 데이터 들고가도 됨 -->
</body>
</html>