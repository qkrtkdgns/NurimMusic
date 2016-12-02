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
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public int selectMemberCheck(Member member) throws Exception {
		int result = 0;
		try{
			result = sqlSession.selectOne("MemberMapper.selectMemberCheck",member);
			if(result >0){
				throw new Exception();
			}
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			if(result >0){
				throw new Exception("아이디가 중복됩니다.");
			}else{
			throw new Exception("아이디 중복검사를 실패했습니다.");
			}
		}
		return result;
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

	@Override
	public int selectMemberEmailCheck(Member member) throws Exception {
		int result = 0;
		try{
			result = sqlSession.selectOne("MemberMapper.selectMemberEmailCheck",member);
			if(result >0){
				throw new Exception();
			}
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			if(result >0){
				throw new Exception("이메일이 중복됩니다.");
			}else{
			throw new Exception("이메일 중복검사를 실패했습니다.");
			}
		}
		return result;
	}

	@Override
	public int selectMemberPasswordCheck(Member member) throws Exception {
		int result = 0;
		try{
			result = sqlSession.selectOne("MemberMapper.selectMemberPasswordCheck",member);
			if(result ==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("비밀번호가 일치하지 않습니다.");
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("비밀번호 검사를 실행하지 못했습니다.");
		}
		return result;
	}

	@Override
	public int selectMemberInformation(Member member) throws Exception {
		int result = 0;
		
		try{
			result = sqlSession.selectOne("MemberMapper.selectMemberInformation",member);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보가 없습니다.");
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보 검색에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void updateMemberInformation(Member member) throws Exception {

		try{
			sqlSession.update("MemberMapper.updateMemberInformation",member);
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public Member selectUserId(Member member) throws Exception {
		Member result = null;
		
		try{
			result = sqlSession.selectOne("MemberMapper.selectUserId",member);
			if(result == null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보가 존재하지 않습니다.");
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public Member selectUserPw(Member member) throws Exception {
Member result = null;
		
		try{
			result = sqlSession.selectOne("MemberMapper.selectUserPw",member);
			if(result == null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보가 존재하지 않습니다.");
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void updateUserPw(Member member) throws Exception {
		try{
			sqlSession.update("MemberMapper.updateUserPw",member);
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("비밀번호 변경에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void deleteMember(Member member) throws Exception {
		
		try{
			int result = sqlSession.delete("MemberMapper.deleteMember",member);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("등록된 회원정보가 존재하지 않습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("회원정보 삭제를 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

}
