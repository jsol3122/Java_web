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

	public void modify(int seq, String subject, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("subject", subject);
		map.put("content", content);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.modify", map);
		sqlSession.commit();
		sqlSession.close();	
	}
}
