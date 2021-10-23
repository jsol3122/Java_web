<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<form name="clacForm" method="get" action="elResult2.jsp">
		<h3>자바클래스의 메소드를 이용하여 계산</h3>
		<table border="1" cellspacing="0" cellpadding="5"> 
			<tr>
				<td width="50" align="center">X</td>
				<td>
					<input type="text" name="x" >
				</td>
			</tr>
			<tr>
				<td width="50" align="center">Y</td>
				<td>
					<input type="text" name="y">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="계산">
					<input type="reset" value="취소">
				</td>	
			</tr>
		</table>
	</form>
</body>
</html>