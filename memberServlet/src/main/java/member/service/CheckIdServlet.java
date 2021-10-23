package member.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;

@WebServlet("/CheckIdServlet")
public class CheckIdServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		String idChk = memberDAO.checkId(id);
		// boolean exist = memberDAO.isCheckId(id);
		
		response.setContentType("text/html;charset=UTF-8"); // 앞으로 쓰는내용은 HTML형식으로 인식해라
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
			if(idChk!=null) out.println("사용할 수 없는 아이디입니다 :(");
			else out.println("사용 가능한 아이디입니다 :)");
		out.println("</body>");
		out.println("</html>");
	}

}
