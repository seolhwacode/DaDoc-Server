package com.team1.dadoc.trade.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.trade.dto.TradeDto;



public interface TradeService {
	//갤러리의 list 가져오기
	public void getList(HttpServletRequest request);
	//갤러리 목록을 리턴하는 메소드 
	public List<TradeDto> getList2(HttpServletRequest request);
	
	//갤러리에 사진 upload & DB 저장하기
	public void saveImage(TradeDto dto, HttpServletRequest request);
	//갤러리에 사진 저장하기 - ajax
	public Map<String, Object> uploadAjaxImage(TradeDto dto, HttpServletRequest request);
	//갤러리에 사진 저장하기 - db에만 저장(upload 작업은 이미 완료)
	public void insert(TradeDto dto, HttpServletRequest request);
	//갤러리 detail 페이지에 필요한 data를 ModelAndView 에 저장
	public void getDetail(ModelAndView mView, int num);
}
