package nurim.jsp.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Member;
import nurim.jsp.service.MemberService;

public class MemberServiceImpl implements MemberService {
	SqlSession sqlSession;
	Logger logger;

	public MemberServiceImpl(SqlSession sqlSession, Logger logger) {
		super();
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertMember(Member member) throws Exception {
		
		try{
			int result= sqlSession.insert("MemberMapper.insertMember",member);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보가 존재합니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보를 저장하지 못했습니다.");
		}
	}

	@Override
	public Member selectLoginInfo(Member member) throws Exception {
		Member result = null;
		try{
			result = sqlSession.selectOne("MemberMapper.selectLoginInfo",member);
			if(result == null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보가 없습니다.");
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보 조회에 실패했습니다.");
		}
		
		return result;
	}

}
