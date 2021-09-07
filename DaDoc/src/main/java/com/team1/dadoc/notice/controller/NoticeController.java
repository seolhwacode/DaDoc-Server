package com.team1.dadoc.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.notice.dto.NoticeDto;
import com.team1.dadoc.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping("/notice/list")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		
		return "notice/list";
	}
	@RequestMapping("/notice/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("notice/insertform");
	}
	//새글 저장 요청 처리
	@RequestMapping("/notice/insert")
	public ModelAndView authInsert(NoticeDto dto, HttpSession session, HttpServletRequest request) {
		//글 작성자는 세션에서 얻어낸다.
		String id=(String)session.getAttribute("id");
		//NoticeDto 객체에 글 작성자도 담기
		dto.setWriter(id);
		service.saveContent(dto);
		
		return new ModelAndView("notice/insert");
	}
	//글 자세히 보기 요청 처리
	@RequestMapping("/notice/detail")
	public String detail(HttpServletRequest request) {
		service.getDetail(request);
		return "notice/detail";
	}
	//글 삭제 요청처리
	@RequestMapping("/notice/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		service.deleteContent(num, request);
		return new ModelAndView("redirect:/notice/list.do");
	}
	
	@RequestMapping("/notice/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request) {
		
		service.getData(request);
		
		return new ModelAndView("notice/updateform");
	}
	//글 수정 요청처리
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public ModelAndView authUpdate(NoticeDto dto, HttpServletRequest request) {
		service.updateContent(dto);
		return new ModelAndView("notice/update");
	}
	
	//접근이 막혔으 때 오류 메시지를 띄우고, /notice/list.do 페이지로 보내는 페이지로 이동
	@RequestMapping(value = "/notice/access_denied")
	public ModelAndView noAccess() {
		return new ModelAndView("notice/access_denied");
	}
}



