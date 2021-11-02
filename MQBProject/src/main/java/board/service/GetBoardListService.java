package board.service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GetBoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		// BoardListService에서 모든 작업을 하는 대신, GetBoardListService에서 기존작업 + json변환작업 수행
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg*5; 
		int startNum = endNum-4;
		
		BoardDAO boardDAO = BoardDAO.getInstance(); 
		List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);
		
		// 페이징처리는 여러번 반복되기 때문에, 전용 자바클래스파일 만들어서 사용
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(boardDAO.getTotalA());
		boardPaging.makePagingHTML(); // 현재 페이지에 따라 [이전][1][2][3][다음] 과 같은 모양 만드는 함수
		
		// 받아온 list를 json형식으로 변환
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			for(BoardDTO boardDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("seq", boardDTO.getSeq());
				temp.put("id", boardDTO.getId());
				temp.put("name", boardDTO.getName());
				temp.put("email", boardDTO.getEmail());
				temp.put("subject", boardDTO.getSubject());
				temp.put("content", boardDTO.getContent());
				temp.put("ref", boardDTO.getRef());
	            temp.put("lev", boardDTO.getLev());
	            temp.put("step", boardDTO.getStep());
	            temp.put("pseq", boardDTO.getPseq());
	            temp.put("reply", boardDTO.getReply());
	            temp.put("hit", boardDTO.getHit());
	            temp.put("logtime", sdf.format(boardDTO.getLogtime()));
	         
	            array.add(temp);
			} // for
			json.put("list", array);
			HttpSession session = request.getSession();
			json.put("sessionId", session.getAttribute("memId"));
		} // if
		
		// json하나에 list, sessionId, BoardPaging 다 넣기
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		
		// 아래와 같이 별도의 json객체로 내부에서 한번 더 묶어서 전체 json객체에 넣고 가져가도됨
		// JSONObject paging = new JSONObject();
		// paging.put("paging", boardPaging.getPagingHTML().toString());
		// json.put("boardPaging", paging); 
		
		System.out.println(json);
		request.setAttribute("list", json);
		
		return "/board/getBoardList.jsp";

	}

}
