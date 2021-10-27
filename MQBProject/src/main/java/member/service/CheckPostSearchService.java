package member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CheckPostSearchService implements CommandProcess {

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
		// list -> json형식으로 변환 작업 필요 ( 최종 ajax으로 json형식으로 받기로 했으니까 )
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			// list안의 DTO수만큼 JSON객체 하나씩 배열 안에 들어감
			for(ZipcodeDTO zipcodeDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("zipcode", zipcodeDTO.getZipcode());
				temp.put("sido", zipcodeDTO.getSido());
				temp.put("sigungu", zipcodeDTO.getSigungu());
				temp.put("yubmyundong", zipcodeDTO.getYubmyundong());
				temp.put("ri", zipcodeDTO.getRi());
				temp.put("roadname", zipcodeDTO.getRoadname());
				temp.put("buildingname", zipcodeDTO.getBuildingname());
				
				array.add(temp);
			} // for
			json.put("list", array);
		} // if
		
		request.setAttribute("list", json);
		
		return "/member/checkPostSearch.jsp";
	}

}
