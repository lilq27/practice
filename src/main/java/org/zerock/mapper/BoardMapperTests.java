package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board->System.out.println(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		mapper.insert(board);
		System.out.println(board);
	}
	@Test
	public void testInsertSlectKey() {
		BoardVO board=new BoardVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("newbie");
		
		mapper.InsertSelectKey(board);
		System.out.println("board select key:"+board);
	}
	@Test
	public void testRead() {
		BoardVO board = mapper.read(5L);
		
		System.out.println(board);
	}
	@Test
	public void testdelete() {
		System.out.println("삭제: " +mapper.delete(5L));
	}
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		//실행 전 존재하는 번호인지 확인할 것 
		board.setBno(3L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");
		
		int count =mapper.update(board);
		System.out.println("update count: " +count);
	}
}
