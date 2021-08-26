package com.team1.dadoc.challenger.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team1.dadoc.challenger.dto.ChallengerDto;

@Repository
public class ChallengerDaoImpl implements ChallengerDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(ChallengerDto dto) {
		session.insert("challenger.insert", dto);
	}

}
