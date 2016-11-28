package nurim.jsp.service;

import nurim.jsp.model.Member;

public interface MemberService {

	public void insertMember(Member member) throws Exception;
	
	/**
	 * 회원 정보를 조회한다.
	 * @param member	-조회할 회원 아이디,비밀번호
	 * @return Member
	 * @throws Exception
	 */
	public Member selectLoginInfo(Member member)throws Exception;
}
