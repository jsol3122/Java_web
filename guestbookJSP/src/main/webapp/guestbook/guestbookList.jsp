<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.dao.GuestbookDAO" %>
<%@ page import="guestbook.bean.GuestbookDTO" %>
<%@ page import="java.util.List" %>
   
<%
// 데이터
// list에서는 받아올 데이터가 없기 때문에 get방식 / post방식 상관 x  -- 다 db에서 받아옴
int pg = Integer.parseInt(request.getParameter("pg")); // 페이징처리용 설정		

// DB
// 페이징처리 - 1페이지당 3개씩 뜨도록 
int endNum = pg*3; // 페이지당 3개의 글이 뜨니까, 한 페이지당 데이터번호의 시작-끝번호 변수잡기
int startNum = endNum-2;

GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
// 페이지마다 들어가는 데이터의 시작번호-끝번호를 갖고 DB에서 해당페이지의 리스트 받아오기
List<GuestbookDTO> list = guestbookDAO.getGuestbookList(startNum, endNum);

int totalA = guestbookDAO.getTotalA(); // 총 글 수
int totalP = (totalA + 2) / 3; // 페이지번호 계산 = (총글수 + 한페이지당글수-1)/한페이지당글수

%>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
<%-- 내가 쓴 방법 : if문 안쓰고 바로 a태그 자체로 설정하기
	a{
		text-decoration: none;
	}
	a:hover{
		text-decoration: underline;
	}
	a:nth-child(<%=pg%>){
		color: red;
	} --%>
	
	#currentPagingA{
		color: red;
		text-decoration: underline;
	}
	#pagingA{
		color: black;
		text-decoration: none;
	}
</style>
</head>
	<%if(list != null){ %>
		<%for(GuestbookDTO guestbookDTO : list){ %>
			<table border="1">
				<tr>
					<td width="100" align="center">작성자</td>
					<td width="100" align="center"><%=guestbookDTO.getName() %></td>
					<td width="100" align="center">작성일</td>
					<td width="100" align="center"><%=guestbookDTO.getLogtime() %></td>
				</tr>
				
				<tr>
					<td align="center">이메일</td>
					<td colspan="3"><%=guestbookDTO.getEmail() %></td>
				</tr>
				
				<tr>
					<td align="center">홈페이지</td>
					<td colspan="3"><%=guestbookDTO.getHomepage() %></td>
				</tr>
				
				<tr>
					<td align="center">제목</td>
					<td colspan="3"><%=guestbookDTO.getSubject() %></td>
				</tr>
				
				<tr>
					<td colspan="4"><pre><%=guestbookDTO.getContent() %></pre></td>
				</tr>
			</table>
			<hr width="500" align="left" color="red">
		<%} // for %>
		
		<div style="width: 450px; text-align: center;">
		<%for(int i=1; i<=totalP; i++){ %> <!-- 페이지번호 뜨도록 -->
			<%if(i == pg){ %>
				[<a href="guestbookList.jsp?pg=<%=i %>" id="currentPagingA"> <%= i %> </a>]	
			<%}else{ %>	
				[<a href="guestbookList.jsp?pg=<%=i %>" id="pagingA"> <%= i %> </a>]	
			<%} %>
		<%} %>
		</div>
	<%} // if%>
<body>
</body>
</html>