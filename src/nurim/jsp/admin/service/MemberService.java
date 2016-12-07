package nurim.jsp.admin.service;

import java.util.List;

import nurim.jsp.model.Member;

public interface MemberService {

	/**
	 * 관리자 계정으로 접속했는지 확인
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public Member selectLoginInfo (Member member) throws Exception;
	
	/**
	 * 전체 회원 수 확인
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public int selectMemberCount (Member member) throws Exception;
	
	/**
	 * 전체 회원 목록 출력
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public List<Member> selectMemberList (Member member)throws Exception;
	
	/**
	 * 관리자 사이트에서 회원 추가
	 * @param member
	 * @throws Exception
	 */
	public void insertMemberByAdmin (Member member)throws Exception;

	/**
	 * 관리자 사이트에서 회원 수정
	 * @param member
	 */
	public void updateMemberByAdmin(Member member);
	
	/**
	 * 선택된 회원 정보 조회
	 * @param member
	 * @return
	 */
	public Member selectMemberByAdmin(Member member);

	/**
	 * 관리자사이트에서 회원삭제
	 * @param member
	 */
	public void deleteMemberByAdmin(Member member);
}

