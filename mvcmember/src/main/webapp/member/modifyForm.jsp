<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<style type="text/css">
		div{
			color: red;
			font-size: 8pt;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<h4>회원정보 수정</h4>
	<form name="modifyForm" method="post" action="/mvcmember/member/modify.do"> 
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
					<input type="text" name="id"  id="id" value="" placeholder="아이디 입력" readonly>
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
					<input type="button" value="회원정보수정" id="modifyBtn">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('input[name=name]').val('${name}');
			$('input[name=id]').val('${id}');
			$('input[name=pwd]').val('${pwd}');
			$('input[name=repwd]').val('${pwd}');
			if('${gender}' == '1') {
				$('input[name=gender]:checked').next().prop('checked', true);
			}
			$('input[name=email1]').val('${email1}');
			$('input[name=email2]').val('${email2}');
			$('select[name=tel1]').val('${tel1}');
			$('input[name=tel2]').val('${tel2}');
			$('input[name=tel3]').val('${tel3}');
			$('input[name=zipcode]').val('${zipcode}');
			$('input[name=addr1]').val('${addr1}');
			$('input[name=addr2]').val('${addr2}');
			
			
			$('#modifyBtn').click(function(){
				$('#idDiv').empty();
				$('#pwdDiv').empty();
				$('#repwdDiv').empty();
				
				if($('input[name=id]').val() == '') {
					$('#idDiv').html('아이디 입력');
					$('#id').focus(); 
				}else if($('input[name=pwd]').val() == '') 
					$('#pwdDiv').html('비밀번호 입력');
				else if($('input[name=pwd]').val() != $('input[name=repwd]').val()) 
					$('#repwdDiv').html('비밀번호가 맞지 않음');
				else			
					$('form[name=modifyForm]').submit();
			});
			
			// 우편번호 
			$('#zipcodeBtn').click(function(){
				window.open("/mvcmember/member/checkPost.do", "우편번호", "width=500 height=500 top=200 left=700");
			});


			$('.addressA').click(function(){
				// alert($(this).text()); -- 주소값 출력
				// alert($(this).parent().prev().text()); -- 우편번호 출력
				
				$('#zipcode', opener.document).val($(this).parent().prev().text()); // 우편번호 넣기
				$('#addr1', opener.document).val($(this).text()); // 주소 넣기
				window.close();
				$('#addr2', opener.document).focus();
			});

			function checkPostClose(zipcode, address){
				opener.writeForm.zipcode.value = zipcode;
				opener.writeForm.addr1.value = address;
				window.close();
				opener.writeForm.addr2.focus();
			}
			
		});
	</script> 
</body>
</html>




