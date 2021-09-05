package com.team1.dadoc.book.search.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.book.search.dto.BookSearchDto;
import com.team1.dadoc.book.search.service.BookSearchService;

@Controller
public class BookSearchController {

	@Autowired
	private BookSearchService service;
	
	//상세 검색 페이지로 이동
	@RequestMapping(value = "/booksearch/search_list")
	public ModelAndView searcList() {
		return new ModelAndView("booksearch/search_list");
	}
	
	//네이버 기본 검색 api
	@RequestMapping(value = "/booksearch/ajax_basic_search")
	@ResponseBody
	public Map<String, Object> ajaxBasicSearch(BookSearchDto dto) {
		//onpen api 에서 json 형식의 string 받다온다.
		return service.getBasicSearchList(dto);
	}
}
