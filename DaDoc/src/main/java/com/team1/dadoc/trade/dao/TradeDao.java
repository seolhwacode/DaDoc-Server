package com.team1.dadoc.trade.dao;

import java.util.List;

import com.team1.dadoc.trade.dto.TradeDto;

public interface TradeDao {

	//글 목록
	public List<TradeDto> getList(TradeDto dto);
	//글의 갯수
	public int getCount();
	//글 추가
	public void insert(TradeDto dto);
	//글 정보 얻어오기
	public TradeDto getData(int num);
	//키워드를 활용한 글 정보 얻어오기
	public TradeDto getData(TradeDto dto);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(TradeDto dto);
	
	
	
	
}
