<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#boardListPage a:nth-child(${pg}){
			color: red;
		}
		
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
	
		#boardListForm table{
			width: 100%;
			border-top: 2px solid blue;
			/* border-collapse: collapse; */
		}
		
		#boardListForm #title th{
			border-bottom: 2px solid blue;
			font-size: 15px;
			height: 30px;
			color: blue;
		}
		
		#boardListForm td{
			border-bottom: 1px solid blue;
			text-align: center;
			font-size: 13px;
			color: black;
		}
		
		#boardListPage{
			width: 100%; 
			text-align: center;
			position: relative;
			left: -330px;
		}
	</style>
</head>
<body>
	<table id="boardListForm" cellspacing="0" cellpadding="5"><!-- frame="hsides" rules="rows"로 가로줄만 나오게! -->
		<tr id="title">
			<th>글번호</td> <!-- td대신 th로 잡으면 자동으로 중앙정렬됨 -->
			<th style="width: 200px">제목</td>
			<th >작성자</td>
			<th>조회수</td>
			<th style="width: 130px">작성일</td>
		</tr>
	<c:if test="${list != null}"> 
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
	<div id="boardListPage">
		<c:forEach var="i" begin="1" end="${totalP }">
			[<a href="/MQBProject/board/boardList.do?pg=${i }"> ${i } </a>]
		</c:forEach>
	</div>
	</c:if> 
</body>
</html>