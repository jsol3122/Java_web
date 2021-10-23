package com.calc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/CalcServlet")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init()");
	}

	public void destroy() {
		System.out.println("destroy()");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		
		int x = Integer.parseInt(request.getParameter("x"));
		int y = Integer.parseInt(request.getParameter("y"));
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		
		out.println(x+" + "+y+" = "+(x+y)+"<br>");
		out.println(x+" - "+y+" = "+(x-y)+"<br>");
		out.println(x+" * "+y+" = "+(x*y)+"<br>");
		out.println(x+" / "+y+" = "+(x/(double)y)+"<br>");
		out.println("<input type='button' value='뒤로' onclick='history.back()'>");
		//  onclick='history.go(-1)' 으로 해도 됨
		
		out.println("</body>");
		out.println("</html>");
	}

}
