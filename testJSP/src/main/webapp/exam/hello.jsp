<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
// 전역변수 설정이므로 1번만 생성 - 서블릿의 init()의 역할
String name = "홍길동";
int age = 25;
%>

<%
// 지역변수 설정이므로 요청시마다 매번 처리됨 - 서블릿의 service()의 역할
age++;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- 주석 설정 : html주석 / jsp주석 -->
	<!--  Hello JSP :)<br>  -->
	<%-- 안녕하세요 JSP ;)<br>  --%>
	
	내 이름은 <%=name %> 입니다<br>
	<!--  내 나이는 <%=age %>살 입니다<br>  -->
	<%-- <% out.println("내 나이는 "+age+"살 입니다");%> --%> <!-- 내장객체 out 사용 -->
</body>
</html>