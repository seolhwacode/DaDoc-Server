package com.team1.dadoc.trade.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team1.dadoc.trade.dto.TradeCommentDto;
@Repository
public class TradeCommentDaoImpl implements TradeCommentDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<TradeCommentDto> getList(TradeCommentDto dto) {
		
		return session.selectList("tradeComment.getList", dto);
	}

	@Override
	public void delete(int num) {
		session.update("tradeComment.delete", num);
		
	}

	@Override
	public void insert(TradeCommentDto dto) {
		session.insert("tradeComment.insert", dto);
		
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("tradeComment.getSequence");
	}

	@Override
	public void update(TradeCommentDto dto) {
		session.update("tradeComment.update", dto);
		
	}

	@Override
	public TradeCommentDto getData(int num) {
		
		return session.selectOne("tradeComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		
		return session.selectOne("tradeComment.getCount", ref_group);
	}
	
	
}
