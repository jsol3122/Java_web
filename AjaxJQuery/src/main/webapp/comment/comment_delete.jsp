<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> <%-- XML파일 태그 시작 전의 공백 문자 제거--%>
<%
int num = Integer.parseInt(request.getParameter("num"));

// DB연동할때는 여기서 하기
boolean result = false;
String message = "덧글 삭제에 실패하였습니다";

if(num != 0){
	result = true;
	message = "덧글이 삭제되었습니다";
}

%>

<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result><%=result%></result>
	<message><%=message%></message>
</comment>