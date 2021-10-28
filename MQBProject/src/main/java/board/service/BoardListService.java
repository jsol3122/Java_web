package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		/*
		 * int endNum = pg*5; 
		 * int startNum = endNum-4;
		 * 
		 * BoardDAO boardDAO = BoardDAO.getInstance(); List<BoardDTO> list =
		 * boardDAO.getBoardList(startNum, endNum);
		 * 
		 * int totalA = boardDAO.getTotalA(); int totalP = (totalA + 4) / 5;
		 * 
		 * request.setAttribute("pg", pg); 
		 * request.setAttribute("endNum", endNum);
		 * request.setAttribute("startNum", startNum); 
		 * request.setAttribute("list", list); 
		 * request.setAttribute("totalA", totalA); 
		 * request.setAttribute("totalP", totalP);
		 * 
		 */
		
		// 선생님 코드 - pg랑 display만 담고 인덱스로 가고, list.jsp파일 자체에서 js로 ajax써서 데이터불러와서 출력
		request.setAttribute("pg", pg); 

		request.setAttribute("display","/board/boardList.jsp"); 
		return "/index.jsp";
	}

}
