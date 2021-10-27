<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	#writeForm div{
		color: red;
		font-size: 8pt;
		font-weight: bold;
	}
</style>

<h4>회원가입</h4>
<form name="writeForm" id="writeForm"> 
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">이름</td>
			<td>
				<input type="text" name="name" id="name" placeholder="이름 입력">
				<div id="nameDiv"></div>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px;">아이디</td>
			<td>
				<input type="text" name="id"  id="id" value="" placeholder="아이디 입력">
				<input type="hidden" id="check" value="">
				<div id="idDiv"></div>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px;">비밀번호</td>
			<td>
				<input type="password" name="pwd"  id="pwd" size="30">
				<div id="pwdDiv"></div>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px;">재확인</td>
			<td>
				<input type="password" name="repwd"  id="repwd" size="30">
				<div id="repwdDiv"></div>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px;">성별</td>
			<td>
				<input type="radio" name="gender" value=0 checked>남
				<input type="radio" name="gender" value=1>여
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px;">이메일</td>
			<td>
				<input type="text" name="email1">@
				<input type="text" name="email2" list="email2" placeholder="직접입력">
				<datalist id="email2">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
				</datalist>
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px;">핸드폰</td>
			<td>
				<select name="tel1" style="width: 70px">
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="019">019</option>
				</select>-
				<input type="text" name="tel2" size="6" maxlength="4">-
				<input type="text" name="tel3" size="6" maxlength="4">
			</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px;">주소</td>
			<td>
				<input type="text" name="zipcode" id="zipcode" readonly> <!-- 입력불가능 -->
				<input type="button" value="우편번호검색" id="zipcodeBtn"><br>
				<input type="text" name="addr1" id="addr1" placeholder="주소" size="62"><br>
				<input type="text" name="addr2" id="addr2" placeholder="상세주소" size="62">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원가입" id="writeBtn">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/MQBProject/js/member.js"></script> 





