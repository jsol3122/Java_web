package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	
	private static UserDAO instance = null;
	private SqlSessionFactory sqlSessionFactory;
	
	public static UserDAO getInstance() {
		if(instance == null) {
			synchronized (UserDAO.class) { // 여기선 웹이 아니니까 사실 동기화는 생략가능
				instance = new UserDAO();
			}
		}
		return instance;
	} // 싱글톤

	public UserDAO() {
		try {
			/* inputstream사용 방법
			InputStream inputStream = Resources.getResourceAsReader("mybatis-config.xml"); */
			
			// ""안은 기본적으로 src가 기본위치이므로, 경로를 따로 써주지 않았음 ( 상대경로인 것 )
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			
			// sqlSessionFactory 생성 - reader로 xml을 읽어온 후에 생성한 것
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} // 생성자 - mybatis-config에 설정한 환경설정을 딱 한번만 읽어주고 그 참조값을 sqlsession이 갖도록함
	
	public void write(UserDTO userDTO) {
		// myBatis쓰는 이유는 자바와 SQL분리 위해서기 때문에 직접 자바파일에 SQL문 적어주지 않음
		// 생성자를 통해 xml을 읽어와서 sqlSessionFactory 생성까지 하였고, 이제 sqlSession생성
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("userSQL.write", userDTO); // 자동으로 int형으로 n개가 입력되었는지 출력됨
		sqlSession.commit(); // C U D 은 commit()필수 - myBatis는 자동커밋x
		sqlSession.close();
	}

	public List<UserDTO> getUserList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getUserList"); // 자동으로 list형으로 담아옴
		sqlSession.close(); // R에선 commit() 필요 없음
		
		return list;
	}

	public String getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String idChk = sqlSession.selectOne("userSQL.getUser", id);
		sqlSession.close();
		
		return idChk;
	}

	public void update(UserDTO userDTO) {
		// map으로 가져온 경우의 mapper부분도 참고하기
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("userSQL.update", userDTO);
		sqlSession.commit();
		sqlSession.close();		
	}

	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete", id);
		sqlSession.commit();
		sqlSession.close();		
	}

	public List<UserDTO> search(String columnName, String value) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		/* int값을 가져왔을 경우
		if(num==1) { list = sqlSession.selectList("userSQL.searchName", value); 
		}else{ list = sqlSession.selectList("userSQL.searchId", value); }
		 */
		
		// 칼럼명 자체를 설정해서 가져온 경우 - 두개의 값을 가져갈수 없기 때문에 map에 담아서 가져가기
		Map<String, String> map = new HashMap<String, String>();
		map.put("columnName", columnName);
		map.put("value", value);
		List<UserDTO> list = sqlSession.selectList("userSQL.search", map);
		
		sqlSession.close();
		
		return list;
	}

}
