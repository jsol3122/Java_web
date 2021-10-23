<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>	
	<h3>** 메인 화면 **</h3>
	
	<c:if test="${sessionScope.memName == null }">
		<a href="/mvcmember/member/writeForm.do">회원가입</a><br>
		<a href="/mvcmember/member/loginForm.do">로그인</a><br>
	</c:if>
	
	<c:if test="${sessionScope.memName != null }">
		<a href="/mvcmember/member/logout.do">로그아웃</a><br>
		<a href="/mvcmember/member/modifyForm.do">회원정보수정</a><br>
		<a href="/mvcmember/board/boardWriteForm.do">글쓰기</a><br>
	</c:if>
	
	<a href="/mvcmember/board/boardList.do?pg=1">목록</a><br>
	<a href=""></a><br>
	
</body>
</html>