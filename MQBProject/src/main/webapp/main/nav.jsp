<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${memId == null }">
	<jsp:include page="../member/loginForm.jsp" />
</c:if>

<c:if test="${memId != null }">
	<jsp:include page="../member/loginOk.jsp" />
</c:if>

<!-- 
memId를 잡아서(session)
만약 세션값이 존재하면 (=로그인한경우) loginOk.jsp

만약 세션값이 없다면 (=로그인 안한경우) loginForm.jsp

로그아웃하면 alert('로그아웃')띄우고 index.jsp로 이동

## mvcmember 프로젝트 참조

-->