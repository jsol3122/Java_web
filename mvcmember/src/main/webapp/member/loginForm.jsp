<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		div{
			color: red;
			font-size: 8pt;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<form name="loginForm" method="post" action="http://localhost:8080/mvcmember/member/login.do">
		<h4>로그인</h4>
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td style="text-align: center; font-size: 13px;">아이디</td>
				<td>
					<input type="text" name="id"  id="id" placeholder="아이디 입력">
					<div id="idDiv"></div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center; font-size: 13px;">비밀번호</td>
				<td>
					<input type="password" name="pwd"  id="pwd" size="30" placeholder="비밀번호 입력">
					<div id="pwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" id="loginBtn">
					<input type="button" value="회원가입" onclick="location.href='/mvcmember/member/writeForm.do'">
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="http://localhost:8080/mvcmember/js/member.js"></script> 
</body>
</html>