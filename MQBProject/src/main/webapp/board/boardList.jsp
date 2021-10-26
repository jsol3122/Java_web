<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
		div a:nth-child(${pg}){
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
	<c:if test="${requestScope.list != null}"> 
		<c:forEach var="boardDTO" items="${list }">
		<tr>
			<td>${boardDTO.seq }</td>
			<td style="text-align:left">
				<a href="boardView.jsp?seq=${boardDTO.seq }&pg=${pg}" id="subjectA">${boardDTO.subject }</a>
			</td>
			<td>${boardDTO.id }</td>
			<td>${boardDTO.hit }</td>
			<td>${boardDTO.logtime }</td>
		</tr>
		</c:forEach>
	</table>
	<br><br>
	<div style="width: 100%; text-align: center;">
		<c:forEach var="i" begin="1" end="${totalP }">
			[<a href="/mvcmember/board/boardList.do?pg=${i }"> ${i } </a>]
		</c:forEach>
	</div>
	</c:if> 
</body>
</html>