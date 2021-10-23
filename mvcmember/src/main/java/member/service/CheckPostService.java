package member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

public class CheckPostService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");
		
		List<ZipcodeDTO> list = null;
		// CheckPostService로 들어오는 경로가 둘인데, 하나는 싣고오는 데이터가 없으므로 분기점 나눠주기
		if(sido != null && roadname != null) { // 세종시는 구가 없어서 sigungu는 null일때가 있어서 뺌
			MemberDAO memberDAO = MemberDAO.getInstance();
			list = memberDAO.getZipcodeList(sido, sigungu, roadname);
		}
		
		request.setAttribute("list", list);
		return "/member/checkPost.jsp";
	}

}
