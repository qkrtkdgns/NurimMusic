package nurim.jsp.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.MemberService;
import nurim.jsp.model.Member;

public class MemberServiceImpl implements MemberService {

	Logger logger;
	SqlSession sqlSession;
	
	public MemberServiceImpl( SqlSession sqlSession,Logger logger) {
		super();
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	@Override
	public Member selectLoginInfo(Member member) throws Exception {
		Member result = null;
		try{
			result = sqlSession.selectOne("MemberMapper.selectLoginInfo",member);
			if(result ==null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
		}finally{
			sqlSession.commit();
		}
		return result;
	}

	@Override
	public int selectMemberCount(Member member) throws Exception {
		int result=0;
		try{
			result = sqlSession.selectOne("MemberMapper.selectMemberCount",member);
			if(result ==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
		}finally{
			sqlSession.commit();
		}
		return result;
	}

	@Override
	public List<Member> selectMemberList(Member member) throws Exception {
		List<Member> result= null;
		try{
			result = sqlSession.selectList("MemberMapper.selectMemberList",member);
			if(result ==null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
		}finally{
			sqlSession.commit();
		}
		return result;
	}

	@Override
	public void insertMemberByAdmin(Member member) throws Exception {
		try{
			int result = sqlSession.insert("MemberMapper.insertMember",member);
			if(result ==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
		}finally{
			sqlSession.commit();
		}
	}
	

}
