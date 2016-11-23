package nurim.jsp.dao;


import org.apache.ibatis.session.SqlSession;

import nurim.jsp.dao.MyBatisConnectionFactory;

public class MyBatisConnectionTest {

	public static void main(String[] args) {

		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		
		sqlSession.close();
	}

}
