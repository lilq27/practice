package org.zerock.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.AjaxSampleVO;
import org.zerock.domain.Ticket;

import lombok.extern.log4j.Log4j;

@RestController //서버에서 전송하는 순수한 데이터= @Controller+ @ResponseBody
@RequestMapping("/ajaxSample")
@Log4j
public class AjaxSampleController {
	
	@GetMapping(value="/getTest",
			produces = "text/plain; charset=UTF-8" )
	public String getTest() {
		
		log.info("MIME TYPE"+MediaType.TEXT_PLAIN_VALUE);
		
		return "안녕하세요";
	}
	@GetMapping(value="/getSample",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, //JSON 방식, produces속성은 생략가능
				    MediaType.APPLICATION_XML_VALUE}) //XML 방식
	public AjaxSampleVO getSample() {
		return new AjaxSampleVO(112,"스타","로드");
	}
	@GetMapping(value="/getList")
	public List<AjaxSampleVO> getList(){
		return IntStream.range(1, 10).mapToObj(i-> new AjaxSampleVO(i,i+"First", i+"Last"))
				.collect(Collectors.toList());	//IntStream은 for문과 유사 
	}
	@GetMapping(value="/getMap")
	public Map<String,AjaxSampleVO> getMap(){
		Map<String, AjaxSampleVO> map=new HashMap<>();
		map.put("First", new AjaxSampleVO(111,"그루트","주니어"));
		return map;
	}
	@GetMapping(value="/check", params= {"height","weight"})
	public ResponseEntity<AjaxSampleVO> check(Double height, Double weight){
		AjaxSampleVO vo=new AjaxSampleVO(0,""+height,""+weight);
		ResponseEntity<AjaxSampleVO> result=null;
		if(height<150) {
			result=ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		}else {
			result=ResponseEntity.status(HttpStatus.OK).body(vo);
		}
		return result;
	}
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat, //url값을 파라미터로 사용 
							@PathVariable("pid") Integer pid) { 
		//ex)http://localhost:9090/ajaxSample/product/bags/1234 => bags와 1234를 파라미터로 사용
		return new String[] { "category: " +cat, "productid: "+pid};
	}
	@PostMapping("/ticket")
	public Ticket convert(@RequestBody Ticket ticket) {
		log.info("convert..........ticket: "+ticket);
		return ticket;
	}
	
}
