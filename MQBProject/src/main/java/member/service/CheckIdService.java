package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean yn = memberDAO.checkId(id);
		request.setAttribute("id", id);
		// 여기서 request안에 안넣어놔도, 같은 request공유하니까 param.id로 바로 갖고올 수 있음
		
		if(yn) 
			return "/member/checkIdFail.jsp";
		else 
			return "/member/checkIdOk.jsp";
				
	}

}
