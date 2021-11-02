package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;

public class ImageboardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 이클립스의 실제폴더 얻어오기
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println(realFolder);
		
		// 실제폴더에 업로드 ( 요청자, 업로드할 위치, 업로드할 파일의 최대용량(byte단위), 문자 인코딩형식 )
		MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8"); // 5MB
		return null;
	}

}
