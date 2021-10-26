package board.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDTO boardDTO = new BoardDTO();
		HttpSession session = request.getSession();
		boardDTO.setId((String)session.getAttribute("memId"));
		boardDTO.setName((String)session.getAttribute("memName"));
		boardDTO.setEmail((String)session.getAttribute("memEmail"));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.write(boardDTO);
		
		return "/board/boardWrite.jsp";
	}

}
