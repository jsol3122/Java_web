<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> <%-- XML파일 태그 시작 전의 공백 문자 제거--%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%!
// 처음 한번만 처리 - 전역
int num = 3;
%>

<%
// 서비스 요청할 때마다 처리되는 구역 - 지역
request.setCharacterEncoding("UTF-8"); // post방식이기 때문
String user_name = request.getParameter("user_name");
String comment = request.getParameter("comment");

Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String datetime = sdf.format(date);

num++; // 4부터 시작 ( 1~3번내용은 외부 xml 파일에서 끌어올 에정)
boolean result = true;
String message = "덧글이 등록되었습니다";
%>

<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result><%=result %></result>
	<message><%=message %></message>
	<item>
		<num><%=num %></num>
		<writer><%=user_name %></writer>
		<content><%=comment %></content>
		<datetime><%=datetime %></datetime>
	</item>
</comment>









