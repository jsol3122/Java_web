package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {	
	private static BoardDAO instance = null;
	private SqlSessionFactory sqlSessionFactory;
	
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
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // 생성자

	public void write(BoardDTO boardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.write", boardDTO);
		sqlSession.commit();
		sqlSession.close();		
	} // 글쓰기

	public List<BoardDTO> getBoardList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardList", map);
		sqlSession.close();
		
		return list;
	}

	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		
		return totalA;
	}

	public BoardDTO detailView(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.detailView", seq);
		sqlSession.close();
		
		return boardDTO;
	}

	
	
/*
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
*/
}
