<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="guestbook.bean.GuestbookDTO"  %>
<%@ page import="guestbook.dao.GuestbookDAO" %>
    
<%
// 데이터 받아오기
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String email = request.getParameter("email");
String homepage = request.getParameter("homepage");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

GuestbookDTO guestbookDTO = new GuestbookDTO();
guestbookDTO.setName(name);
guestbookDTO.setEmail(email);
guestbookDTO.setHomepage(homepage);
guestbookDTO.setSubject(subject);
guestbookDTO.setContent(content);

// DB 연동하기
GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
guestbookDAO.write(guestbookDTO);

// 클라이언트에게 응답하기


%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>작성하신 글을 저장하였습니다</h3>
	<br><br>
	<input type="button" value="글목록" onclick="location.href='guestbookList.jsp?pg=1'">
</body>
</html>