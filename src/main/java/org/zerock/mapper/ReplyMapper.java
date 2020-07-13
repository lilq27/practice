package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);

	public ReplyVO read(Long rno);
	
	public int delete (Long rno);
	
	public int update(ReplyVO replyVo);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri, //MyBatis에 두 개 이상의 데이터를 파라미터로 전달 
			@Param("bno") Long bno
			);
}
