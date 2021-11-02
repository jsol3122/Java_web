<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	#boardListTable{
		width: 100%;
		border-top: 2px solid #483D8B;
		/* border-collapse: collapse; */
	}
	
	#boardListTable #title th{
		border-bottom: 2px solid #483D8B;
		font-size: 20px;
		height: 50px;
		color: #483D8B;
		background-color: aliceblue;
	}
	
	#boardListTable td{
		border-bottom: 1px solid #483D8B;
		height: 30px;
		font-size: 18px;
		color: black;
	}
	
	#boardPagingDiv{
		width: 100%; 
		text-align: center;
		font-size: 20px;
	}
	
	#currentPaging{
		color: red;
		text-decoration: underline;
		cursor: pointer;
	}
	
	#paging{
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
</style>

<input type="hidden" id="pg" value="${pg }" /> <!-- pg값을 js로 전달하기 위한 요소 -->

<table id="boardListTable" cellspacing="0" cellpadding="5"><!-- frame="hsides" rules="rows"로 가로줄만 나오게! -->
	<tr id="title">
		<th>글번호</td> <!-- td대신 th로 잡으면 자동으로 중앙정렬됨 -->
		<th width="600px">제목</td>
		<th >작성자</td>
		<th>조회수</td>
		<th width="180px">작성일</td>
	</tr>
</table>

<br><br>

<div id="boardPagingDiv">
	
</div>
 
<!-- 선생님코드 - 파일 분할해서 display에 안담고 service파일 & js파일로 분할해서 ajax로 처리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/MQBProject/js/board.js"></script>
<script type="text/javascript">
	function boardPaging(param_pg){ // BoardPaging클래스에서 작동시킨 함수의 매개변수 i값(=pg값)이 넘어온 것
		location.href = '/MQBProject/board/boardList.do?pg='+param_pg;
	}
</script>
