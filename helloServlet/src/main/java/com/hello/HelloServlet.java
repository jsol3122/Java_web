package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		System.out.println("실행하자마자 가장 먼저 호출되는 함수 - init()"); // 콘솔창에 결과물 출력
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("클라이언트 요청이 있을때마다 호출되는 함수 - service()");
		
		response.setContentType("text/html"); // 이제부터 모든 내용을 html형식으로 인식해라 - 명령어
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("Hello Servlet!");
		out.println("</body>");
		out.println("</html>");
	}
	
	@Override
	public void destroy() {
		System.out.println("서블릿이 종료될 때 호출되는 함수 - destroy()");
	}

}
