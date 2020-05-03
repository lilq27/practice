package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;




@Controller
@RequestMapping("/sample/*")

public class SampleController {
	
	@RequestMapping("")
	public void basic() {
		
		System.out.println("basic...........");
		
	}
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		System.out.println(" "+dto);
		return "ex01";
	}
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, 
			@RequestParam("age") int age) {
		System.out.println("name: "+ name);
		System.out.println("age: "+ age);
		return "ex02";
	}
	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids")ArrayList<String> ids) {
		System.out.println("ids: "+ ids);
		
		return "ex02List";
	}
	@GetMapping("/ex02Array")
	public String ex02Array(@RequestParam("ids")String[] ids) {
		System.out.println("array ids: " +Arrays.toString(ids));
		return "ex02Array";
	}
	
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList list) {
		System.out.println("list dtos: "+list);
		return "ex02Bean";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		binder.registerCustomEditor(java.util.Date.class,new CustomDateEditor(dateFormat, false));
	}
	
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		System.out.println("todo: " +todo);
		return "ex03";
	}
	
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto,@ModelAttribute("page") int page,TodoDTO todo) {
		System.out.println("dto: " + dto);
		System.out.println("page: "+ page);
		System.out.println("todo: "+todo);
		return "sample/ex04";
	}
	
	@GetMapping("/ex05")
	public void ex05() { 
		System.out.println("/ex05.................");
	}
	
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		System.out.println("/ex06.........");
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("홍길동");
		
		return dto;
	}
	
	@GetMapping("/ex07")
	public ResponseEntity<String> ex07(){
		System.out.println("ex07.....");
		
		String msg="{\"name\": \"홍길동\"}";
		
		HttpHeaders headers= new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=UTF-8");
		
		return new ResponseEntity<String>(msg,headers,HttpStatus.OK);
	}
	@GetMapping("/exUpload")
	public void exUpload() {
		System.out.println("/exUpload......");
	}
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files) {
		
		files.forEach(file->{ //for문 람다식 
			System.out.println("-------------");
			System.out.println("name: "+file.getOriginalFilename());
			System.out.println("size: "+file.getSize());
		});
	}
}
