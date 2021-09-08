package com.team1.dadoc.book.search.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.book.good.dto.BookGoodDto;
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
		//onpen api 에서 json string 으로 받아서 Map 에 받다온다.
		return service.getBasicSearchList(dto);
	}
	
	//네이버 상세 검색 api
	@RequestMapping(value = "/booksearch/ajax_detail_search")
	@ResponseBody
	public Map<String, Object> ajaxDetailSearch(BookSearchDto dto){
		//open api 에서 xml 형식의 데이터를 받아, json 으로 만든 후, Map 에 담아 가져온다.
		return service.getDetailSearchList(dto);
	}
	
	//해당 id 와 isbn 에 해당하는 값이 좋아요 리스트에 있는지 확인하고, 그 값을 boolean 값으로 josn return
	@RequestMapping(value = "/booksearch/ajax_book_good")
	@ResponseBody
	public Map<String, Object> ajaxBookGood(BookGoodDto dto, HttpSession session){
		//session 에서 id 가져와서 dto 에 넣기
		dto.setId((String)session.getAttribute("id"));
		
		//해당 id 와 isbn 에 해당하는 값이 좋아요 리스트에 있는지 확인하고, 그 값을 boolean 값으로 josn return
		return service.getIsBookGood(dto);
	}
}
