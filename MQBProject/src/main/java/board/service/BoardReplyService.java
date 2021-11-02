package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardReplyService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		HttpSession session = request.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("memId"));
		map.put("name", session.getAttribute("memName"));
		map.put("email", session.getAttribute("memEmail"));
		map.put("subject", request.getParameter("subject"));
		map.put("content", request.getParameter("content"));
		map.put("pseq", request.getParameter("pseq"));
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.reply(map);
		
		return "/board/boardReply.jsp";
	}

}
