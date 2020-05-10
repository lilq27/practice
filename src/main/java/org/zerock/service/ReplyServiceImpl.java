package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired )
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		// TODO Auto-generated method stub
		return mapper.update(reply);
	}

	@Override
	public List<ReplyVO> getListWithPaging(Criteria cri, Long bno) {
		log.info("get Reply List of a Board "+bno);
		return mapper.getListWithPaging(cri, bno); //MyBatis에 두 개 이상의 데이터를 파라미터로 전달 
	}

}
