package user.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);

		System.out.println("---------------");
		System.out.println(" 1. 이름 검색");
		System.out.println(" 2. 아이디 검색");
		System.out.println("---------------");
		System.out.print("번호 입력 : ");
		int num = scan.nextInt();
		
		String columnName = null; // 칼럼명을 받아서 설정해버려서 sql문도 하나로 줄이기
		
		if(num==1) {
			columnName = "name";
			System.out.print("이름 입력 : ");
		}else if(num==2) {
			columnName = "id";
			System.out.print("아이디 입력 : ");
		}
		String value = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.search(columnName, value);
		
		for(UserDTO userDTO : list) {
			System.out.println(userDTO.getName()+"\t"+userDTO.getId()+"\t"+userDTO.getPwd());
		}
		
		
		
	}

}
