<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="../js/guestbook.js"></script>
	<style type="text/css">
		div{
			color: red;
			font-size: 8pt;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<form name="guestForm" action="guestbookWrite.jsp">
		<h3>글쓰기</h3>
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td style="text-align: center; font-size: 13px; width: 80px;">작성자</td>
				<td><input type="text" name="name" placeholder="작성자 입력"></td>
			</tr>
			<tr>
				<td style="text-align: center; font-size: 13px; width: 80px;">이메일</td>
				<td><input type="email" name="email" placeholder="이메일 입력" size="30"></td>
			</tr>
			<tr>
				<td style="text-align: center; font-size: 13px; width: 80px;">홈페이지</td>
				<td><input type="text" name="homepage" value="http://" size="40"></td>
			</tr>
			<tr>
				<td style="text-align: center; font-size: 13px; width: 80px;">제목</td>
				<td>
					<input type="text" name="subject" placeholder="제목입력" size="50">
					<div id="subjectDiv"></div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center; font-size: 13px; width: 80px;">내용</td>
				<td>
					<textarea name="content" placeholder="내용입력" rows="10" cols="50"></textarea>
					<div id="contentDiv"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="글작성" onclick="checkGuestbookWrite()">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onclick="location.href='guestbookList.jsp?pg=1'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>