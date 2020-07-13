package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController// = @Controller+ @ResponseBody
@Log4j
@AllArgsConstructor //@Setter 자동 주입
public class ReplyController {

	private ReplyService service;
	
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE}
	)	
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplyVO: " + vo);
		int insertCount = service.register(vo);
		log.info("Reply INSERT COUNT: " + insertCount);
		
		return insertCount==1
				? new ResponseEntity<>("success",HttpStatus.OK)
						:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE, //JSON 방식, produces속성은 생략가능
					MediaType.APPLICATION_JSON_UTF8_VALUE}
	) //XML 방식
	public ResponseEntity<List<ReplyVO>> getList( //status상태 코드를 갖음 , @ResponseBody와 유사 , 좀 더 세밀한 제어가 가능
			@PathVariable("page") int page, //url값을 파라미터로 사용 
			@PathVariable("bno") Long bno){
		//ex)http://localhost:9090/ajaxSample/pages/{bno}/{page} => bags와 1234를 파라미터로 사용
		log.info("getList...........");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK); //status상태 코드, ok는 정상작동
	}
	
	@GetMapping(value="/{rno}")
	public ResponseEntity<ReplyVO> get(@PathVariable("rno")Long rno){
		log.info("get: " +rno);
		return new ResponseEntity<>(service.get(rno),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{rno}",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		log.info("remove: " +rno);
		return service.remove(rno)==1
				? new ResponseEntity<>("success",HttpStatus.OK)
			    : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{rno}",
			//PUT 과 PATCH 는 공통적으로 update 할 때 사용, PATCH 가 부분 데이타를 업데이트 한다는 점에서 PUT 과 차이가 있음
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("rno")Long rno
	) {
		vo.setRno(rno);
		log.info("rno: "+rno);
		log.info("modify: "+vo);
		return service.modify(vo)==1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
