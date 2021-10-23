package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.bean.MemberDTO;

public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";
	
	private static MemberDAO instance = null;
	
	public static MemberDAO getInstance() {
		if(instance == null) { // 싱글톤 설정
			synchronized (MemberDAO.class) { // 동기화처리 - 웹이라 여러 스레드가 접근가능하니
				instance = new MemberDAO(); // DAO파일 싱글톤으로 한번만 생성
			}
		}
		return instance;
	}
	
	// Driver Loading
	public MemberDAO() {
		try {
			Class.forName(driver);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// Connection
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	// PreparedStatement
	public void write(MemberDTO memberDTO) {
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql); // java에서 오라클 접속 위해 생성
			pstmt.setString(1,  memberDTO.getName());
			pstmt.setString(2,  memberDTO.getId());
			pstmt.setString(3,  memberDTO.getPwd());
			pstmt.setString(4,  memberDTO.getGender());
			pstmt.setString(5,  memberDTO.getEmail1());
			pstmt.setString(6,  memberDTO.getEmail2());
			pstmt.setString(7,  memberDTO.getTel1());
			pstmt.setString(8,  memberDTO.getTel2());
			pstmt.setString(9,  memberDTO.getTel3());
			pstmt.setString(10,  memberDTO.getZipcode());
			pstmt.setString(11,  memberDTO.getAddr1());
			pstmt.setString(12,  memberDTO.getAddr2());
			
			pstmt.executeUpdate(); // 실행
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public String login(String id, String pwd) {
		String name = null;
		String sql = "select name from member where id=? and pwd=?";
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			// if(rs.next()) name = rs.getString("name");  --  아래 내용과 동일결과
			rs.next();
			name = rs.getString("name");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return name;
	}

	public String checkId(String id) {
		String yn = null;
		String sql = "select * from member where id=?";
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) yn = rs.getString("id");
			// 검색결과가 존재하면 rs.next()=true 가 됨  --  이를 통해 boolean값 반환하도록 쓸 수 있음
			// if(rs.next()) exist = true; 의 형식으로 boolean값 반환
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return yn;
	}
	
}
