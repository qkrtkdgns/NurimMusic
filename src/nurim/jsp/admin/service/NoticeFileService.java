package nurim.jsp.admin.service;

import java.util.List;

import nurim.jsp.model.File;
import nurim.jsp.model.Member;

public interface NoticeFileService {
	
	/**
	 * 파일 정보를 저장한다.
	 * @param file	- 파일 데이터
	 * @throws Exception
	 */
	public void insertFile(File file) throws Exception;
	
	
	/**
	 * 하나의 게시물에 종속된 파일목록을 조회한다.
	 * @param file		- 게시물 일련번호를 저장하고 있는 Beans
	 * @return				- 파일데이터 컬렉션
	 * @throws Exception	
	 */
	public List<File> selectNoticeFileList(File file) throws Exception;
	
	
	/**
	 * 하나의 게시물에 종속된 파일 목록을 삭제한다.
	 * @param document
	 * @throws Exception
	 */
	public void deleteFileAll(File documentNotice) throws Exception;
	
	
	/**
	 * 하나의 단일 파일 정보를 조회한다.
	 * @param file
	 * @return BbsFile  - 저장된 경로 정보
	 * @throws Exception
	 */
	public File selectFile(File file) throws Exception;
	
	
	/**
	 * 하나의 단일 파일 정보를 삭제한다.
	 * @param file
	 * @throws Exception
	 */
	public void deleteFile(File file) throws Exception;
	
	/**
	 * 내가 올린 파일들을 조회한다.
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public List<File> selectMemberFileList(Member member) throws Exception;

}
