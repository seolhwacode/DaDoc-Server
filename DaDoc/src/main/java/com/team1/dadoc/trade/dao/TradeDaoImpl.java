package com.team1.dadoc.trade.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team1.dadoc.trade.dto.TradeDto;

@Repository
public class TradeDaoImpl implements TradeDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<TradeDto> getList(TradeDto dto){
		
		return session.selectList("trade.getList", dto);
	}

	@Override
	public int getCount(TradeDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(TradeDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public TradeDto getData(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TradeDto getData(TradeDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(TradeDto dto) {
		// TODO Auto-generated method stub
		
	}
}
