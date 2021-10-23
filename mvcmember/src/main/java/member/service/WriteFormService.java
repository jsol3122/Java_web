package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class WriteFormService implements CommandProcess{ // 인터페이스

	// 부모클래스의 추상메소드 오버라이드
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 서블릿이 가진 request&response를 매개변수로 받아왔음
		return "/member/writeForm.jsp"; // 이 파일 넘길테니(=return) 같이 forward시켜주쇼
	}

}