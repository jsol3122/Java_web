package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);

		System.out.print("삭제할 아이디 입력 : ");
		String id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		String idChk = userDAO.getUser(id);
		
		if(idChk == null) {
			System.out.println("찾고자 하는 아이디가 없습니다");
			return;
		}else {
			userDAO.delete(id);
			
			System.out.println("데이터를 삭제하였습니다");
		}
		
	}

}
