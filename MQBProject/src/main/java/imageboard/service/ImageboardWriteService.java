package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 이클립스의 실제폴더 얻어오기
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println(realFolder);
		
		// 실제폴더에 업로드 ( 요청자, 업로드할 위치, 업로드할 파일의 최대용량(byte단위), 문자 인코딩형식, 중복파일명 발생시 후행파일명 바꾸기 설정 )
		MultipartRequest multi = new MultipartRequest(request
													, realFolder
													, 5*1024*1024
													, "UTF-8"
													, new DefaultFileRenamePolicy()); // 5MB
		
		// 파일을 업로드하고 나면 request의 모든 권한은 multi로 넘어감 (=request에서 못 얻어옴)
		String imageId = multi.getParameter("imageId");
		String imageName = multi.getParameter("imageName");
		int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
		int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
		String imageContent = multi.getParameter("imageContent");
		
		// DefaultFileRenamePolicy과 같은 규약으로 원본파일명과 달라졌을 경우가 있기 때문 - image2는 db에 저장x
		// String image1 = multi.getFilesystemName("image1"); -- 변경된 이름 얻을 때
		String image1 = multi.getOriginalFileName("image1"); // 원래 이름 얻을 때
		
		// DB 작업
		ImageboardDTO imageboardDTO = new ImageboardDTO();
		imageboardDTO.setImageId(imageId);
		imageboardDTO.setImageName(imageName);
		imageboardDTO.setImagePrice(imagePrice);
		imageboardDTO.setImageQty(imageQty);
		imageboardDTO.setImageContent(imageContent);
		imageboardDTO.setImage1(image1); // 파일명만 넣는 것 ( 파일 자체X )
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.imageboardWrite(imageboardDTO);
		
		// display에 넣어서 include를 할 경우, jsp파일 형식만 가능 ( *.do 불가능 / 소스만 가져오기 때문 )
		request.setAttribute("display", "/imageboard/imageboardWrite.jsp");
		
		return "/index.jsp";
	}

}
