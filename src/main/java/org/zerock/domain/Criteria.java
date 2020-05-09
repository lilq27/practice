package org.zerock.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum; //현재 선택된 페이지 번호
	private int amount; //한 페이지당 출력되는 데이터 수 
	
	private String type;
	private String keyword;
	
	
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split(""); //split() 괄호 안 기준으로 나눔
	}
	

}
