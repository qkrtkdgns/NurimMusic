package nurim.jsp.admin.service;

import java.util.List;

import nurim.jsp.model.Member;

public interface MemberService {

	public Member selectLoginInfo (Member member) throws Exception;
	
	public int selectMemberCount (Member member) throws Exception;
	
	public List<Member> selectMemberList (Member member)throws Exception;
	
	public void insertMemberByAdmin (Member member)throws Exception;

	public void updateMemberByAdmin(Member member);
	
	public Member selectMemberByAdmin(Member member);

	public void deleteMemberByAdmin(Member member);
}

