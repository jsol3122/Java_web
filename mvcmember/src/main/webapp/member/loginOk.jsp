<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//String name = null;
//String id = null;
/* 
// 쿠키를 꺼내올 때는 특정 몇개만 뽑아올 수 없고, 모든 쿠키를 다 가져와야 함
Cookie[] ar = request.getCookies();
if(ar != null){
	for(int i=0; i<ar.length; i++){
		String cookieName = ar[i].getName(); // 쿠키명 출력해보기
		String cookieValue = ar[i].getValue(); // 쿠키값 출력해보기
		
		System.out.println("쿠키명 = "+cookieName);
		System.out.println("값 = "+cookieValue);
		System.out.println("-------------------------");
		
		if(cookieName.equals("memName")) name = cookieValue;
		if(cookieName.equals("memId")) id = cookieValue;
	} 
} */

// 세션
//name = (String)session.getAttribute("memName");
//id = (String)session.getAttribute("memId");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		img{
		width: 350px;
		height: 350px;
		cursor: pointer;
		}
	</style>
</head>
<body>
	<img src="../image/bunny1.jpg" onclick="location.href='../index.jsp'">
	
	<br>
	<%-- <%=name %>님 로그인 --%>
	${sessionScope.memName }님 로그인
	<br><br>
	
	<input type="button" value="로그아웃" onclick="location.href='/mvcmember/member/logout.do'">
	<input type="button" value="회원정보수정" onclick="location.href='/mvcmember/member/modifyForm.do'">
</body>
</html>