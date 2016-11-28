package nurim.jsp.service;

import nurim.jsp.model.Member;

public interface MemberService {

	/**
	 * 회원정보를 등록한다.
	 * @param member	-등록할 회원 정보
	 * @throws Exception
	 */
	public void insertMember(Member member) throws Exception;
	
	/**
	 * 아이디가 중복되는지 확인한다.
	 * @param member	- 유저 아이디 중복 체크 확인
	 * @return int
	 * @throws Exception
	 */
	public int selectMemberCheck(Member member) throws Exception;
	/**
	 * 회원 정보를 조회한다.
	 * @param member	-조회할 회원 아이디,비밀번호
	 * @return Member
	 * @throws Exception
	 */
	public Member selectLoginInfo(Member member)throws Exception;
	
	public int selectMemberEmailCheck(Member member)throws Exception;
}
