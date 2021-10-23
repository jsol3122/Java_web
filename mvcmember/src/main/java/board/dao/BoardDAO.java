package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private DataSource ds;
	
	private static BoardDAO instance = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd"); //mm은 분단위인 것에 주의
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	} // 싱글톤
	
	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	} // 생성자
	
	public void write(BoardDTO boardDTO) { 
		String sql = "insert into board values(seq_board.nextval,?,?,?,?,?,seq_board.currval,0,0,0,0,0,sysdate)";
		// sql = "insert into board(seq,id,name,email,subject,content,ref) values(seq_board.nextval,?,?,?,?,?,seq_board.currval)"; 도 가능
		// 위의 방법으로 sql문 을 하면 default값이 잡혀있는 애들은 not null이더라도 안넣으면 디폴트값이 입력됨
		
		try {
			conn = ds.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, boardDTO.getId());
			ps.setString(2, boardDTO.getName());
			ps.setString(3, boardDTO.getEmail());
			ps.setString(4, boardDTO.getSubject());
			ps.setString(5, boardDTO.getContent());
			
			/* map으로 쓰는 경우
			 * ps.setString(1, map.get("id");
			 * ps.setString(2, map.get("name");
			 * ps.setString(3, map.get("email");
			 * ps.setString(4, map.get("subject");
			 * ps.setString(5, map.get("content");
			 * */
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // write()
	
	public List<BoardDTO> getBoardList(int startNum, int endNum){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		String sql = "select *"
				+ "from (select rownum rn, tt.* "
				+ "from (select * from board order by ref desc, step asc) tt "
				+ ")where rn>=? and rn<=?";
		
		try {
			conn = ds.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startNum);
			ps.setInt(2, endNum);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq")); // 나중을 위해 13개의 칼럼 다 꺼내와야함
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(sdf.format(rs.getDate("logtime"))); //날짜형으로 꺼내서 format설정(자동으로 string형변환)
				
				list.add(boardDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		} finally {
			try {
				if(rs != null) rs.close();
				if (ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	} // getBoardList
	
	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from board";
		
		try {
			conn = ds.getConnection();
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if(rs.next()) totalA = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if (ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return totalA;
	} // getTotalA()
	
	public BoardDTO detailView(int seq) {
		BoardDTO boardDTO = null;
		String sql = "select * from board where seq=?";
		
		try {
			conn = ds.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, seq);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq")); // 나중을 위해 13개의 칼럼 다 꺼내와야함
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(sdf.format(rs.getDate("logtime")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return boardDTO;
	} // detailView()
}
