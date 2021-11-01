package guestbook.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;
import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	private static GuestbookDAO instance = null;
	private SqlSessionFactory sqlSessionFactory;
	
	public static GuestbookDAO getInstance() {
		if(instance == null) { 
			synchronized (GuestbookDAO.class) { 
				instance = new GuestbookDAO(); 
			}
		}
		return instance;
	}
	
	public GuestbookDAO() { 
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void write(GuestbookDTO guestbookDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("guestBookSQL.write", guestbookDTO);
		sqlSession.commit();
		sqlSession.close();	
	}

	public List<GuestbookDTO> getBoardList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<GuestbookDTO> list = sqlSession.selectList("guestBookSQL.getBoardList", map);
		sqlSession.close();
		
		return list;
	}

}
