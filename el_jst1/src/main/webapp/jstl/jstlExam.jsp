<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jstl.PersonDTO"%>

<% 
// 자바 파일의 역할 --> 여기서 실행(Run)하세요! (원래 java파일써야되는데 걍...jsp로 java파일인척 실습중...)
List<String> list = new ArrayList<String>();
list.add("호랑이");
list.add("돼지");
list.add("코끼리");
list.add("다람쥐");
list.add("기린");
list.add("토끼");
list.add("여우");

PersonDTO aa = new PersonDTO("홍길동",25);
PersonDTO bb = new PersonDTO("네 오",14);
PersonDTO cc = new PersonDTO("프로도",13);

List<PersonDTO> list2 = new ArrayList<PersonDTO>();
list2.add(aa);
list2.add(bb);
list2.add(cc);

// 데이터 싣기 - 주소를 통해 가는 데이터는 문자열형식이라 객체는 절대못감(걍 객체주소값만 가버림)
// 그래서!!! 객체를 넘길 때는 setAttribute("변수명", 객체)를 써야함
request.setAttribute("list", list);
request.setAttribute("list2", list2);

// 페이지 이동 - 데이터 싣고 가기(sendRedirect는 안싣고가니까 못씀)
// response.sendRedirect("jstlTest.jsp");

// forward 개념 이용 - 방법 1
RequestDispatcher dispatcher = request.getRequestDispatcher("jstlTest.jsp");
dispatcher.forward(request, response);
%>
<!--  페이지 이동 - forward방식 이용 - 방법 2(데이터 싣고 감) -->
<%-- <jsp:forward page="jstlTest.jsp" /> --%>