package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserInsertService implements UserService{

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("이름 입력 : ");
		String name = scan.next();
		System.out.print("아이디 입력 : ");
		String id = scan.next();
		System.out.print("비밀번호 입력 : ");
		String pwd = scan.next();
		
		UserDTO userDTO = new UserDTO();
		userDTO.setName(name);
		userDTO.setId(id);
		userDTO.setPwd(pwd);
		
		// DB 작업
		UserDAO userDAO = UserDAO.getInstance(); // 싱글톤 사용
		userDAO.write(userDTO);
		
		// 응답
		System.out.println("데이터를 DB에 저장하였습니다");
	}

}
