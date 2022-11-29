package pyr.mycompany.domain;

public class PageDTO {
	// 시작페이지
	public int startPage;
	// 끝페이지
	public int endPage;
	// 이전
	public boolean prev;
	// 다음
	public boolean next;
	// 전체 건 수
	public int total;
	// Criteria클래스
	public Criteria cri;
	
	// 생성자
	public PageDTO(Criteria cri, int total) {
		this.cri=cri;
		this.total=total;
		
		// 페이지 시작페이지, 끝페이지 처리
		this.endPage=(int)Math.ceil(cri.getPageNum()/10.0)*10;
		this.startPage=endPage-9;
		
		int realEnd=(int)Math.ceil(total*1.0/cri.getAmount());
		
		if(realEnd<endPage) {
			this.endPage=realEnd;
		}
		// 이전, 다음 버튼 보이기
		this.prev=this.startPage>1;
		this.next=this.endPage<realEnd;
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
}
