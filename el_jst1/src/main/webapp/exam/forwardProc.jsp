<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 데이터 넣기
request.setAttribute("apple", "사과");

// 페이지 이동
// 자주 쓰이는 방법 (디스패처 이용) - 디스패처는 인터페이스라서 바로 new 불가능
// 반드시 상대번지만 써야함 - 형식이 절대번지는 걍 안먹어서 못씀
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp"); 
dispatcher.forward(request, response); // request와 response 제어권을 Result파일까지 확장시키기
%>
<%-- <jsp:forward page="forwardResult.jsp"/> -- 잘 안쓰는 방법 --%>