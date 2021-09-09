package com.team1.dadoc.book.search.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping(value = "/bookgood/ajax_isExist")
	@ResponseBody
	public Map<String, Object> ajaxIsExist(BookGoodDto dto, HttpSession session){
		//session 에서 id 가져와서 dto 에 넣기
		dto.setId((String)session.getAttribute("id"));
		
		//해당 id 와 isbn 에 해당하는 값이 좋아요 리스트에 있는지 확인하고, 그 값을 boolean 값으로 josn return
		return service.getIsBookGood(dto);
	}
	
	//책 좋아요 추가 : 해당 id 와 isbn 을 db 에 추가한다.
	@RequestMapping(value = "/bookgood/ajax_add")
	@ResponseBody
	public Map<String, Object> ajaxAdd(BookGoodDto dto, HttpSession session){
		//session 에서 id 가져와서 dto 에 넣기
		dto.setId((String)session.getAttribute("id"));
		
		//id 와 isbn 을 db 에 추가 후, 결과를 Map 에 담아 가져온다.
		return service.goodAdd(dto);
	}
	
	//책 좋아요 취소(삭제) : 해당 id 와 isbn 에 해당하는 row 를 삭제
	@RequestMapping(value = "/bookgood/ajax_cancel")
	@ResponseBody
	public Map<String, Object> ajaxCancel(BookGoodDto dto, HttpSession session){
		//session 에서 id 가져와서 dto 에 넣기
		dto.setId((String)session.getAttribute("id"));
		
		//id 와 isbn 에 해당하는 row db 에서 삭제 후, 결과를 Map 에 담아 가져온다.
		return service.goodCancel(dto);
	}
}
