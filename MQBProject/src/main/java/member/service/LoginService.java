package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터 받아오기
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// DB 연동 - myBatis 사용
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.login(id, pwd);
		
		// 응답 - js파일의 ajax에서 요청한거니까 거기로 다시 응답이 돌아가는 것임
		if(memberDTO != null){
			// 세션
			HttpSession session = request.getSession(); // 세션은 인터페이스라 new생성 불가
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", id);
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			
			session.setAttribute("memDTO", memberDTO); // 이렇게 DTO째로 세션에 넣어도 됨
		}
		return "/member/login.jsp";
	}

}
