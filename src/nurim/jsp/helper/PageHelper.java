package nurim.jsp.helper;

public class PageHelper {
  private int page = 1;
  private int totalCount = 0;
  private int listCount = 10;
  private int groupCount = 5;
  private int totalPage = 0;
  private int startPage=0;
  private int endPage=0;
  private int prevPage=0;
  private int nextPage=0;
  private int limitStart = 0;
 
  private static PageHelper current=null;
  
  public static PageHelper getInstance(){
	  if(current ==null){
		  current = new PageHelper();
	  }
	  //current.pageProcess(page, totalCount, listCount, groupCount);
	  //Model2 형식 페이지에서는 객체 선언/할당/초기화를 나눠서 처리하기 때문에 해당 부분은
	  //삭제한다.  pageProcess의 접근 한정자는 private=>public으로 수정
	  return current;
  }
  
  public static void freeInstance(){current = null;}
  
  private PageHelper() { super();
  }
  

public void pageProcess(int page, int totalCount, int listCount, int groupCount){
	this.page =page;
	this.totalCount = totalCount;
	this.listCount = listCount;
	this.groupCount =groupCount;
	
	totalPage=((totalCount-1)/listCount)+1;
	
	if(page<0){
		page=1;
	}
	
	if(page>totalPage){
		page=totalPage;
	}
	
	startPage = ((page-1)/groupCount)*groupCount+1;
	
	endPage = (((startPage-1)+groupCount)/groupCount)*groupCount;
	
	if(endPage > totalPage){endPage=totalPage;}
	
	if(startPage > groupCount){prevPage = startPage -1;}
	else{prevPage=0;}

	if(endPage < totalPage){ nextPage = endPage +1;}
	else{nextPage=0;}
	
	limitStart = (page-1)*listCount;
	
}

public int getPage() {
	return page;
}
public void setPage(int page) {
	this.page = page;
}

public int getTotalCount() {
	return totalCount;
}
public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
}

public int getListCount() {
	return listCount;
}
public void setListCount(int listCount) {
	this.listCount = listCount;
}

public int getGroupCount() {
	return groupCount;
}
public void setGroupCount(int groupCount) {
	this.groupCount = groupCount;
}

public int getTotalPage() {
	return totalPage;
}
public void setTotalPage(int totalPage) {
	this.totalPage = totalPage;
}

public int getStartPage() {
	return startPage;
}
public void setStartPage(int startPage) {
	this.startPage = startPage;
}

public int getEndPage() {
	return endPage;
}
public void setEndPage(int endPage) {
	this.endPage = endPage;
}

public int getPrevPage() {
	return prevPage;
}
public void setPrevPage(int prevPage) {
	this.prevPage = prevPage;
}

public int getNextPage() {
	return nextPage;
}
public void setNextPage(int nextPage) {
	this.nextPage = nextPage;
}

public int getLimitStart() {
	return limitStart;
}
public void setLimitStart(int limitStart) {
	this.limitStart = limitStart;
}

@Override
public String toString() {
	return "PageHelper [page=" + page + ", totalCount=" + totalCount + ", listCount=" + listCount + ", groupCount="
			+ groupCount + ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage=" + endPage
			+ ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", limitStart=" + limitStart + "]";
}



}
