package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class WriteFormService implements CommandProcess{ 

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// ${display} 값으로 body부분을 결정하기 위해서 request안에 값 넣어줌
		request.setAttribute("display","/member/writeForm.jsp");
		
		return "/index.jsp"; 
	}

}