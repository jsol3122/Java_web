package com.param;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/ParamServlet")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init()");
	}

	public void destroy() {
		System.out.println("destroy()");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		
		// 데이터 받는 부분
		String name = request.getParameter("name"); // name속성이 name인 값을 받음
		int age = Integer.parseInt(request.getParameter("age")); // 문자열로 들어오니까 변환
		
		// 응답하는 부분
		response.setContentType("text/html;charset=UTF-8"); // 앞으로 쓰는내용은 HTML형식으로 인식해라
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("Hello Servlet^~^<br>");
		out.println("안녕안녕 서블릿~~~");
		out.println("<br><br>");
		
		out.println(name+"님의 나이는 : "+age+"살 이므로 ");
			if(age>=19) out.println("성인 입니다");
			else out.println("청소년입니다");
		
		out.println("</body>");
		out.println("</html>");
	}

}
