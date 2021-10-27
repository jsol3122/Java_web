<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.mainnav{
	background-color: #483D8B;
	list-style: none;
}

.mainnav{
	content: '';
}

.mainnav li{
	display: inline-block;
	justify-content: space-between;
}

.mainnav li a{	
	display: block;
	color: #ffffff;
	padding: 0 13px;
	background-color: #483D8B;
	font: bold 16px/40px 'Nanum Gothic', sans-serif;
	text-transform: uppercase;
	text-decoration: none;
}

.mainnav li a:hover{
	color: #660000;
	background-color: #ffcc00;
}
</style>

<ul class="mainnav">
	<li>
		<c:if test="${memId != null }">
			<a href="/MQBProject/board/boardWriteForm.do">글쓰기</a>
		</c:if>
	</li>
	<li><a href="/MQBProject/board/boardList.do?pg=1">목록</a></li>
</ul>
