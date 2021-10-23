<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* Cookie[] ar = request.getCookies();
if(ar != null){
	for(int i=0; i<ar.length; i++){
		if(ar[i].getName().equals("memName")){
			ar[i].setMaxAge(0); // 쿠키삭제
			response.addCookie(ar[i]); // 클라이언트로 보내기 
		}
		if(ar[i].getName().equals("memId")){
			ar[i].setMaxAge(0); // 쿠키삭제
			response.addCookie(ar[i]); // 클라이언트로 보내기 
		}
		
		System.out.println("쿠키명 = "+ar[i].getName());
		System.out.println("값 = "+ar[i].getValue());
	}
} */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그아웃 완료</h3>
	
	<script type="text/javascript">
	 window.onload=function(){
		 alert("로그아웃");
		 location.href = "../index.jsp";
	 }
	</script>
</body>
</html>