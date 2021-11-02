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
	} // 글 목록 불러오기

	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		
		return totalA;
	} // 총 글 수 얻어오기

	public BoardDTO detailView(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.detailView", seq);
		sqlSession.close();
		
		return boardDTO;
	} // 글 제목 클릭 시 상세페이지 보기

	public void modify(int seq, String subject, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("subject", subject);
		map.put("content", content);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.modify", map);
		sqlSession.commit();
		sqlSession.close();	
	} // 글 수정

	public void reply(Map<String, Object> map) {
		// 원글 내용을 pDTO 안에 다 넣어주기
		BoardDTO pDTO = detailView(Integer.parseInt(map.get("pseq")+""));
		map.put("ref", pDTO.getRef()); // 답글의 ref는 원글의 ref와 동일하므로
		map.put("lev", pDTO.getLev()+1); // 답글의 lev는 원글의 lev + 1과 동일하므로
		map.put("step", pDTO.getStep()+1); // 답글의 step는 원글의 step + 1과 동일하므로
		
		// step(글순서) update
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.stepUpdate", pDTO);
		
		// 답글 insert
		sqlSession.insert("boardSQL.replyInsert", map);
		
		// reply(답글수) update
		sqlSession.update("boardSQL.replyUpdate", map);
		
		sqlSession.commit();
		sqlSession.close();		
	} // 답글 쓰기

	public void delete(String parameter) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		// 원글 reply -1시키기
		sqlSession.update("boardSQL.updateOrigin", parameter);
		
		// 답글 제목에 [ 원글삭제~ ] 추가
		String str = "[ 원글이 삭제된 답글 ]";
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", parameter);
		map.put("str", str);
		sqlSession.update("boardSQL.replyUpdateStr", map);
		
		// 글 삭제
		sqlSession.delete("boardSQL.delete", parameter);
		
		sqlSession.commit();
		sqlSession.close();		
	} // 글 삭제


}
