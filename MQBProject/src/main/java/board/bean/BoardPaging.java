package board.bean;

import lombok.Data;

@Data
public class BoardPaging {
	private int currentPage; // 현재페이지
	private int pageBlock; // [이전][1][2][3][다음] 과 같이 몇 개씩 블럭을 나눠놓을지
	private int pageSize; // 1페이지당 n개씩
	private int totalA; // 총 글 수 
	private StringBuffer pagingHTML;
	
	// 현재 페이지에 따라 [이전][1][2][3][다음] 과 같은 모양 만드는 함수
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		// 총 페이지 수
		int totalP = ( totalA + pageSize - 1 ) / pageSize; 
		
		// [이전][1][2][3][다음] 과 같은 형식일 때 블럭의 첫 페이지 and 마지막 페이지 변수 설정
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		
		// 총 페이지수가 적어서 한 블럭 안에 꽉 차지 않을 경우
		if(endPage > totalP) endPage = totalP; 
		
		// [이전]을 페이지블럭 앞에 붙이는 경우 - if(startPage > pageBlock)으로 표현하는 것도 가능
		if(startPage != 1) 
			pagingHTML.append("<span id='paging' onclick='boardPaging("+(startPage-1)+")'>[ 이전 ]</span>"); 
		
		// 페이지 블럭 안의 숫자 출력 - [1][2][3] 과 같은 형태
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage) {
				pagingHTML.append("[ <span id='currentPaging' onclick='boardPaging("+i+")'>"+i+"</span> ]"); 
			}else {
				pagingHTML.append("[ <span id='paging' onclick='boardPaging("+i+")'>"+i+"</span> ]"); 
			}
		} // for
		
		// [다음]을 페이지블럭 뒤에 붙이는 경우
		if(endPage < totalP) 
			pagingHTML.append("<span id='paging' onclick='boardPaging("+(endPage+1)+")'>[ 다음 ]</span>");
	}
}
