package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor //@NoArgsConstructor는 기본생성자, @AllArgsConstructor는 필드값을 모두 포함한 생성자를 자동 생성해준다.
@Log4j
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model,Criteria cri) {
		log.info("list"+cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,123));
	}
	@GetMapping("/register")
	public void register() {
		
	}
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register: "+board);								
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno()); //addFlashAttribute() 는 리다이렉트 직전 플래시에 저장하는 메소드다. 리다이렉트 이후에는 소멸한다.
														  //url에 노출되지 않음 , 리다이렉트 후 정보를 자져옴 
		return "redirect:/board/list";
	}
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) { //@RequestParam은 파라미터 이름과 변수 이름을 기준으로 동작하기 때문에 생략해도 무방
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	@PostMapping("/modify")
	public String modify(RedirectAttributes rttr, BoardVO board) {
		log.info("modify:  "+board);
		if(service.modify(board)) { //boolean값이기 때문에 성공한 경우만 값을 가져옴 
		rttr.addFlashAttribute("result", "success");	
	}
		return "redirect:/board/list";
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("bno")Long bno, RedirectAttributes rttr) {
		log.info("remove:  "+bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
}
