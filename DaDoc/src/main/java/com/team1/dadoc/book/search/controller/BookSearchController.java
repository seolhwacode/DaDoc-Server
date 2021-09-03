package com.team1.dadoc.book.search.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.dadoc.book.search.service.BookSearchService;

@Controller
public class BookSearchController {

	@Autowired
	private BookSearchService service;
	
	//네이버 검색 api 테스트
	@RequestMapping(value = "/test")
	@ResponseBody
	public Map<String, Object> test(@RequestParam String query) {
		//onpen api 에서 json 형식의 string 받다온다.
		return service.getBasicSearchList(query);
	}
}
