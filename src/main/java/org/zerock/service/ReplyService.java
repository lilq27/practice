package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);

	public ReplyVO get(Long rno);
	
	public int remove (Long rno);
	
	public int modify(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri, //MyBatis에 두 개 이상의 데이터를 파라미터로 전달 
			@Param("bno") Long bno
			);

}
