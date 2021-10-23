package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> map = new HashMap<String, Object>();
	   
	public void init(ServletConfig config) {
		// web.xml에 등록된 command.properties 읽기
		String propertyConfig = config.getInitParameter("propertyConfig"); 
		System.out.println("propertyConfig = "+propertyConfig+"\n");
	      
		FileInputStream fin = null;
		Properties properties = new Properties();
	      
		try {
			// properties 안의 내용을 읽어서 Map안에 넣어놓기 - 실질적으로는 map에 담긴걸 요청들어올때마다 꺼내오는것
			fin = new FileInputStream(propertyConfig);
			properties.load(fin);
			System.out.println("properties = "+properties);
	         
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			try {
				fin.close();
			} catch (IOException e) {
	            e.printStackTrace();
			}
		}
	  	System.out.println();
	      
	  	Iterator it = properties.keySet().iterator();
	  	while(it.hasNext()) {
	  		String key = (String)it.next();
	  		System.out.println("key = "+key);
	         
	  		String className = properties.getProperty(key);
	  		System.out.println("className = "+className);
	         
	  		try {
	  			Class<?> classType = Class.forName(className);
	  			Object ob = classType.newInstance();
	            
	            System.out.println("ob = "+ob);
	            
	            map.put(key, ob);
	            
	  		} catch (ClassNotFoundException e) {
	  			e.printStackTrace();
	  		} catch (InstantiationException e) {
	            e.printStackTrace();
	  		} catch (IllegalAccessException e) {
	            e.printStackTrace();
	  		} catch (IllegalArgumentException e) {
	            e.printStackTrace();
	  		} 
	         
	  		System.out.println();
	  	} // while
	      
	} // init()
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		
		// 한글처리 - get/post 확인해서 post방식일때만 한글처리
		if(request.getMethod().equals("POST")) { // method="post"인지를 확인 / 무조건 대문자 "POST"로 쓰기
			request.setCharacterEncoding("UTF-8");
		}
		
		// http://localhost:8080/mvcmember/member/writeForm.do라는 요청이 들어왔을때 /member/writeForm.do만큼만 잘라오는 메소드
		String category = request.getServletPath(); // /member/writeForm.do
		System.out.println("category = "+category);
	      
		// 요청이 들어오면 map.get으로 map에 담아놓은 properties의 내용을 꺼내와서 쓰는 것 
		CommandProcess commandProcess = (CommandProcess)map.get(category); // CommandProcess는 인터페이스
		System.out.println("commandProcess = "+commandProcess);
	      
		String view = null;
		try {
			// requestPro는 오버라이드되어서 여러클래스에 존재함 - 어떤 클래스의 requestPro에서 들어온 요청이든 여기로 와서 view로 들어오는것
			// 클래스파일에 request&response가져가서 jsp파일을 return받아와서 view에 넣음
			view = commandProcess.requestPro(request, response); 
		} catch (Throwable e) {
			e.printStackTrace();
		}
	      
		//forward   
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);//상대번지만 요청(절대번지 쓰지 않기)
		dispatcher.forward(request, response);//제어권 넘기기
	}

}
