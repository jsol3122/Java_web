package guestbook.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

public class GuestbookWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		GuestbookDTO guestbookDTO = new GuestbookDTO();
		guestbookDTO.setName(request.getParameter("name"));
		guestbookDTO.setEmail(request.getParameter("email"));
		guestbookDTO.setSubject(request.getParameter("subject"));
		guestbookDTO.setContent(request.getParameter("content"));
		
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		guestbookDAO.write(guestbookDTO);
		
		return "/guestbook/guestbookWrite.jsp";
	}

}
