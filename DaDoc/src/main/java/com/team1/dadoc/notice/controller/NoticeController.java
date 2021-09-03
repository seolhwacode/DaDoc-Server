package com.team1.dadoc.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
