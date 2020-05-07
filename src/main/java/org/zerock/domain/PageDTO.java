package org.zerock.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageDTO {
	private int startPage;// 표시되는 첫 페이지의 숫자
	private int endPage; // 표시되는 끝 페이지의 숫자
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri=cri;
		this.total=total;
		
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10; //표시되는 페이지 숫자의 개수가 10개일 때 , Math.ceil()은 소수점을 올림으로 처리  
																// ex) 현재 페이지가 12이면  12/10=1.2 => 2*10=20, 표시되는 끝 페이지의 숫자가 20이 됨  
		this.startPage=this.endPage-9; 
		
		int realEnd=(int)(Math.ceil((total*1.0)/cri.getAmount())); //realEnd는 생성되는 페이지 숫자의 가장 마지막 숫자 
		if (realEnd<this.endPage) { // ex) 페이지 숫자의 개수를 10개로 설정 했을 때 총 페이지가 8개만 나오면 표시되는 끝 페이지의 숫자를 8로 하겠다는 뜻 
			this.endPage=realEnd;
		}
		this.prev=this.startPage>1; //시작 번호가 1보다 큰 경우에만 prev가 존재 
		this.next=this.endPage<realEnd;
		
	}
}
