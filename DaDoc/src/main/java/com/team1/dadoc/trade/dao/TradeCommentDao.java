package com.team1.dadoc.trade.dao;

import java.util.List;

import com.team1.dadoc.trade.dto.TradeCommentDto;

public interface TradeCommentDao {
	//댓글 목록 얻어오기
	public List<TradeCommentDto> getList(TradeCommentDto dto);
	//댓글 삭제
	public void delete(int num);
	//댓글 추가 
	public void insert(TradeCommentDto dto);
	//추가할 댓글의 글번호를 리턴하는 메소드 
	public int getSequence();
	//댓글 수정
	public void update(TradeCommentDto dto);
	//댓글 하나의 정보를 리턴하는 메소드
	public TradeCommentDto getData(int num);
	//댓글의 갯수를 리턴하는 메소드
	public int getCount(int ref_group);
	
}
