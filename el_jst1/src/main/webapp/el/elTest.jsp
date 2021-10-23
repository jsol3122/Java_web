<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<table border="1" width="50%"> <!-- 화면(body)에서 50% 차지 -->
		<tr>
			<th width="50%">표현식</th> <!-- 테이블 전체크기의 50% 차지 -->
			<th width="50%">값</th>
		</tr>
		<tr>
			<td align="center">\${25 + 3}</td>
			<td align="center">${25+3}</td>	
		</tr>
		<tr>
			<td align="center">\${25 / 3}</td>
			<td align="center">${25/3}</td>	
		</tr>
		<tr>
			<td align="center">\${25 div 3 }</td>
			<td align="center">${25 div 3 }</td>	
		</tr>
		<tr>
			<td align="center">\${25 % 3 }</td>
			<td align="center">${25 % 3 }</td>	
		</tr>
		<tr>
			<td align="center">\${25 mod 3 }</td>
			<td align="center">${25 mod 3 }</td>	
		</tr>
		<tr>
			<td align="center">\${25 > 3 }</td>
			<td align="center">${25 > 3 }</td>	
		</tr>
		
		<!-- gt(>), lt(<), ge(>=), le(<=), eq(==), ne(!=) 로 써도 됨 -->
		<tr>
			<td align="center">\${25 gt 3 }</td>
			<td align="center">${25 gt 3 }</td>	
		</tr>
		<tr>
			<td align="center">\${header['host'] }</td>
			<td align="center">${header['host'] }</td>	
		</tr>
		<tr>
			<td align="center">\${header.host }</td>
			<td align="center">${header.host }</td>	
		</tr>
	</table>
</body>
</html>