package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.delete(request.getParameter("seq"));

		int pg = Integer.parseInt(request.getParameter("pg"));
		request.removeAttribute("display");
		
		return "/index.jsp";
	}

}
