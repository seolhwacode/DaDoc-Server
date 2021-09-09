package com.team1.dadoc.challenger.dao;

import java.util.List;

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

	@Override
	public int getChallengers(String title) {
		int count = session.selectOne("challenger.getChallengers",title); 
		return count;
	}

	@Override
	public List<ChallengerDto> getMyChallenge(String id) {
		return session.selectList("challenger.getMyChallenge", id);
	}

	@Override
	public String getRegisterUser(ChallengerDto dto) {
		return session.selectOne("challenger.getRegisterUser",dto);
	}

}
