<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<fmt:requestEncoding value="UTF-8"/> <!-- post방식일때만 한글 안깨지게 해주는 작업 -->
	<style type="text/css">
		body{
			color: ${param.color}
		}
	</style>
</head>
<body>
	<!-- request.setCharecterEncoding("UTF-8"); 과 아래 fmt이용 방식한것 동일 역할 -->
	<ul>
		<li>이름 : ${param.name }</li><br>
		<li>나이 : ${param.age }
			<c:if test="${param.age >= 20}">
				<strong>성인</strong>
			</c:if>
			<c:if test="${param.age < 20}">
				<strong>청소년</strong>
			</c:if>
		</li><br>
		<li>색깔 : 
			<c:if test="${param.color == 'red'}">
				<strong>빨강</strong>
			</c:if>
			<c:if test="${param.color == 'green'}">
				<strong>초록</strong>
			</c:if>
			<c:if test="${param.color == 'blue'}">
				<strong>파랑</strong>
			</c:if>
			<c:if test="${param.color == 'violet'}">
				<strong>보라</strong>
			</c:if>
			<c:if test="${param.color == 'cyan'}">
				<strong>하늘</strong>
			</c:if>
		</li><br>
		
		<li>취미 : 
			${paramValues['hobby'][0] } <!-- 가능한 모든 배열의 방 다 출력해주기 (어차피 값없는애들은 안나오니까) -->
			${paramValues['hobby'][1] } <!-- paramValues.hobby[0] 과 같은 형식으로 써도 됨 -->
			${paramValues['hobby'][2] }
			${paramValues['hobby'][3] }
			${paramValues['hobby'][4] }
		</li><br>
		
		<li>취미 : <br>
			<c:forEach var="data" items="${paramValues.hobby }" varStatus="i">
				인덱스 = ${i.index } &emsp; 개수 = ${i.count } &emsp; ${data }<br>
			</c:forEach>
		</li><br>
	</ul>
</body>
</html>