package org.zerock.mapper;

import java.util.stream.IntStream;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Inject
	private ReplyMapper mapper;
	
	private Long[] bnoArr= { 40L,  41L,  42L,  43L,  44L};
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i->{
			ReplyVO vo =new ReplyVO();
			vo.setBno(bnoArr[i%5]);
			vo.setReply("댓글 테스트" +i);
			vo.setReplyer("replyer"+i);
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		Long targetRno=5L;
		ReplyVO vo=mapper.read(targetRno);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long targetRno=1L;
		mapper.delete(targetRno);
	}
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	@Test
	public void testUpdate() {
		Long targetRno=10L;
		ReplyVO vo=mapper.read(targetRno);
		vo.setReply("update Reply ");
		int count =mapper.update(vo);
		log.info("update count: "+count);
	}
}
