package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor //모든 속성을 사용하는 생성자 
@NoArgsConstructor //비어 있는 생성자
public class AjaxSampleVO {
	
	private Integer mno;
	private String firstName;
	private String lastName;

}
