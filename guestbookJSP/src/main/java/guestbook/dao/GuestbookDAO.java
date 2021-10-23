package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	private static GuestbookDAO instance = null;
	
	public static GuestbookDAO getInstance() {
		if(instance == null) { 
			synchronized (GuestbookDAO.class) { 
				instance = new GuestbookDAO(); 
			}
		}
		return instance;
	}
	
	// 생성자에 써서 실행 하자마자 connection pool의 모든 내용을 datasource에게 건네주도록
	public GuestbookDAO() { 
		try {
			Context ctx = new InitialContext(); // context객체는 인터페이스라서 자식클래스로 생성
			// 톰캣의 경우에만 커넥션풀이름 앞에 java:comp/env/를 넣어줌(필수) - 다른서버는안이럼
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle"); //꺼내올땐 꼭 lookup메소드필요
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void write(GuestbookDTO guestbookDTO) {
		String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,?,sysdate)";
		
		try {
			conn = ds.getConnection(); // datasource를 통해서 connection얻어오기 - getConnection()대신
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if (pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
	
	public List<GuestbookDTO> getGuestbookList(int startNum, int endNum){
		List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
		String sql = "select *"
				+ "from (select rownum rn, tt.* "
				+ "from (select seq, name, email, homepage, subject, content, to_char(logtime, 'YYYY.MM.DD') as logtime "
				+ "from guestbook order by seq desc) tt "
				+ ")where rn>=? and rn<=?";
		
		try {
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GuestbookDTO guestbookDTO = new GuestbookDTO();
				guestbookDTO.setSeq(rs.getInt("seq"));
				guestbookDTO.setName(rs.getString("name"));
				guestbookDTO.setEmail(rs.getString("email"));
				guestbookDTO.setHomepage(rs.getString("homepage"));
				guestbookDTO.setSubject(rs.getString("subject"));
				guestbookDTO.setContent(rs.getString("content"));
				guestbookDTO.setLogtime(rs.getString("logtime"));
				
				list.add(guestbookDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			list = null; 
		} finally {
			try {
				if(rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from guestbook";
		
		try {
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) totalA = rs.getInt(1); // count(*)는 칼럼명이 아님 - 1번째행으로 검색
			// count는 없어도 0이라는 숫자라도 무조건 값을 얻어오기 때문에 if문 안써도 됨
			// rs.next(); totalA = rs.getInt(1); 로 해도 가능
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return totalA;
	}

}
