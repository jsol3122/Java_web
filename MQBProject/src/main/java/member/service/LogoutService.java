package member.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class LogoutService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		
		// 세션 - 특정 세션 제거
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		
		// 세션 - 모든 세션 삭제
		session.invalidate();
		
		// 응답
		request.setAttribute("display", "/member/logout.jsp");
		return "/index.jsp";
	}

}
