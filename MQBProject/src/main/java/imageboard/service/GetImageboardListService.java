package imageboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardPaging;
import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GetImageboardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg*3;
		int startNum = endNum-2;
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		List<ImageboardDTO> list = imageboardDAO.getImageboardList(startNum, endNum);
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(3);
		boardPaging.setTotalA(imageboardDAO.getTotalA());
		boardPaging.makePagingHTML();

		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			for(ImageboardDTO imageboardDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("seq", imageboardDTO.getSeq());
				temp.put("imageId", imageboardDTO.getImageId());
				temp.put("imageName", imageboardDTO.getImageName());
				temp.put("imagePrice", imageboardDTO.getImagePrice());
				temp.put("imageQty", imageboardDTO.getImageQty());
				temp.put("imageContent", imageboardDTO.getImageContent());
				temp.put("image1", imageboardDTO.getImage1());
				temp.put("logtime", imageboardDTO.getLogtime());
	         
	            array.add(temp);
			} // for
			json.put("list", array);
			json.put("boardPaging", boardPaging.getPagingHTML().toString());
		} // if
		
		System.out.println(json);
		request.setAttribute("list", json);
		
		return "/imageboard/getImageboardList.jsp";
	}

}
