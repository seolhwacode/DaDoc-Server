package com.team1.dadoc.challenges.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team1.dadoc.challenges.dto.ChallengesDto;

@Repository
public class ChallengesDaoImpl implements ChallengesDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void register(ChallengesDto dto) {
		/*
		 * Mapper's namespace: challenges
		 * sql's id : insert
		 * parameterType : ChallengesDto
		 */
		session.insert("challenges.insert", dto);
	}

}
