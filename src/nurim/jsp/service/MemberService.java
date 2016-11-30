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
	/**
	 * 이메일이 중복되는지 확인한다.
	 * @param member
	 * @return int
	 * @throws Exception
	 */
	public int selectMemberEmailCheck(Member member)throws Exception;
	
	/**
	 * 입력한 비밀번호와 유저의 비밀번호를 비교한다.
	 * @param member
	 * @return int
	 * @throws Exception
	 */
	public int selectMemberPasswordCheck(Member member)throws Exception;
	
	/**
	 * 회원 아이디와 비밀번호로 정보 확인
	 * @param member
	 * @return int
	 * @throws Exception
	 */
	public int selectMemberInformation(Member member) throws Exception;
	
	/**
	 * 회원정보 업데이트
	 * @param member
	 * @throws Exception
	 */
	public void updateMemberInformation (Member member) throws Exception;
	
	/**
	 * 회원아이디 찾기
	 * @param member
	 * @return Member
	 * @throws Exception
	 */
	public Member selectUserId (Member member) throws Exception;
	
	/**
	 * 회원비밀번호 찾기
	 * @param member
	 * @return Member
	 * @throws Exception
	 */
	public Member selectUserPw (Member member) throws Exception;
	
	/**
	 * 회원 비밀번호 변경
	 * @param member
	 * @throws Exception
	 */
	public void updateUserPw (Member member) throws Exception;
}
