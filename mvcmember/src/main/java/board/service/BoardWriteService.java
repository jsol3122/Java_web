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
		
		/* DTO째로 담아서 꺼내올때는 (MemberDTO)session.getAttribute("memDTO")로 형변환해서 
		 * 새로운 DTO에 담아놓고, 담아놓은 DTO에서 개별적으로 getter로 담아오면 됨 */
		
		/*
		 * Map<String, String> map = new HashMap<String, String>(); 
		 * map.put("id", id);
		 * map.put("name", name);
		 * map.put("email", email);
		 * map.put("subject", subject);
		 * map.put("content", content);
		 * 이렇게 DTO대신 Map에 넣어서 map을 가지고 db에 갈 수도 있음
		 */
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.write(boardDTO);
		
		return "/board/boardWrite.jsp";
	}

}
