package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);

		System.out.print("수정할 아이디 입력 : ");
		String id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		String idChk = userDAO.getUser(id);
		
		if(idChk == null) {
			System.out.println("찾고자 하는 아이디가 없습니다");
			return;
		}else {
			UserDTO userDTO = new UserDTO();
			userDTO.setId(id);
			System.out.print("수정할 이름 입력 : ");
			userDTO.setName(scan.next());
			System.out.print("수정할 비밀번호 입력 : ");
			userDTO.setPwd(scan.next());
			
			/* DTO가 아닌 Map에 담아서 가져갈 수도 있음
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name);
			map.put("id", id);
			map.put("pwd", pwd);
			*/
			
			userDAO.update(userDTO);
			System.out.println("데이터를 수정하였습니다");
		}
		
	}

}
