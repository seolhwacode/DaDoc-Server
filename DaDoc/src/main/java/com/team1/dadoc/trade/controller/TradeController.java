package com.team1.dadoc.trade.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.trade.dao.TradeDao;
import com.team1.dadoc.trade.dto.TradeDto;
import com.team1.dadoc.trade.service.TradeService;



@Controller
public class TradeController {
	
	@Autowired
	private TradeService service;
	@Autowired
	private TradeDao dao;
	
	//ajax 요청에 대해 Gallery 하단 페이징 처리에 필요한 데이터 리턴하는 메소드
	@RequestMapping("/api/trade/paging")
	@ResponseBody
	public Map<String, Object> paging(@RequestParam int pageNum){
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=8;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	   
		//전체 row 의 갯수
		int totalRow = dao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum = totalPageCount; //보정해 준다. 
		}
		//json 문자열로 응답할 데이터를 일단 Map 에 담는다.
		Map<String, Object> map=new HashMap<>();
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);
		map.put("totalPageCount", totalPageCount);
		// Map 을 리턴해주면 Map 에 담긴 데이터가 
		// {"startPageNum": x, "endPageNum":x, "totalPageCount":x} 의 json 문자열로 
		// 변환되어서 응답된다. 
		return map;
	}
	
	//ajax 요청에 대해 Gallery 목록을 출력할 컨트롤러 메소드 
	@RequestMapping("/api/trade/list")
	@ResponseBody 
	public List<TradeDto> getList2(HttpServletRequest request){
		
		return service.getList2(request);
	}
	
	//gallery list 페이지로 이동
	@RequestMapping(value = "/trade/list")
	public String getList(HttpServletRequest request) {
		//view 페이지에 사용될 데이터는 request 영역에 담는다.
		service.getList(request);
		
		return "trade/list";
	}
	
	//gallery 사진 업로드 form 페이지로 이동
	@RequestMapping(value = "/trade/upload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("trade/upload_form");
	}
	
	//gallery 사진 업로드 & DB 저장
	@RequestMapping(value = "/trade/upload")
	public ModelAndView authUpload(TradeDto dto, HttpServletRequest request) {
		//form 에서 dto 로 데이터 받아옴
		//dto : caption, MultipartFile image 를 가지고 있다.
		//request :  imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		service.saveImage(dto, request);
		
		return new ModelAndView("trade/upload");
	}
	
	//gallery 사진 업로드 form - ajax form
	@RequestMapping(value = "/trade/ajax_form")
	public ModelAndView authAjaxForm(HttpServletRequest request) {
		
		return new ModelAndView("trade/ajax_form");
	}

	//gallery 사진 업로드 - ajax
	//json 으로 return 할 것
	@RequestMapping(value = "/trade/ajax_upload")
	@ResponseBody
	public Map<String, Object> authAjaxUpload(TradeDto dto, HttpServletRequest request){		
		//form 에서 dto 로 데이터 받아옴
		//dto : MultipartFile image 를 가지고 있다.
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		//return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
		return service.uploadAjaxImage(dto, request);
	}
	
	//gallery 사진 업로드 - ajax
	//json 으로 return 할 것
	@RequestMapping(value = "/trade/ajax_upload2")
	@ResponseBody
	public Map<String, Object> testAjaxUpload2(TradeDto dto, HttpServletRequest request){		
		//form 에서 dto 로 데이터 받아옴
		//dto : MultipartFile image 를 가지고 있다.
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		//return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
		return service.uploadAjaxImage(dto, request);
	}
	
	//imagePath 구성 X -> dto 로 imagePath 를 받아서 DB 에 저장하기
	@RequestMapping(value = "/Trade/insert")
	public ModelAndView authInsert(TradeDto dto, HttpServletRequest request) {
		//dto : caption, imagePath 가지고 있다.
		//request : dto 에 writer(id) 추가
		service.insert(dto, request);
		
		return new ModelAndView("Trade/upload");
	}
	
	//imagePath 구성 X -> dto 로 imagePath 를 받아서 DB 에 저장하기
	@RequestMapping(value = "/Trade/ajax_insert")
	@ResponseBody
	public Map<String, Object> authAjaxInsert(TradeDto dto, HttpServletRequest request) {
		//dto : caption, imagePath 가지고 있다.
		//request : dto 에 writer(id) 추가
		service.insert(dto, request);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}	
	
	//gallery 게시글의 num 이 parameter get 방식으로 넘어온다.
	//detail 페이지
	@RequestMapping(value = "/Trade/detail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mView, @RequestParam int num) {
		//갤러리 detail 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(mView, num);
		mView.setViewName("trade/detail");
		
		return mView;
	}
	
}
