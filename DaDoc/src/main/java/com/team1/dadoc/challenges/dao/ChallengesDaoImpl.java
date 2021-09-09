package com.team1.dadoc.challenges.dao;

import java.util.List;

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
	
	//challenge main에 challenge 리스트 가져오기
	@Override
	public List<ChallengesDto> getList(ChallengesDto dto) {
		return session.selectList("challenges.getList", dto);
	}
	
	//dadoc_challenges table의 총 row 수 
	@Override
	public int getCount() {
		return session.selectOne("challenges.getCount");
	}

	// challenges에서 num에 해당하는 데이터 정보를 dto에 담아 가져오기
	@Override
	public ChallengesDto getData(int num) {
		/*
		 * Mapper's name: challenges
		 * sql's id : getData
		 * parameterType: int
		 * resultType: ChallengesDto
		 */
		return session.selectOne("challenges.getData", num);
	}

	@Override
	public void delete(int num) {
		/*
		 * Mapper's name: challenges
		 * sql's id: delete
		 * parameterType: int
		 * */
		session.delete("challenges.delete", num);
	}

	@Override
	public void update(ChallengesDto dto) {
		/*
		 * Mapper's name: challenges
		 * sql's id: update
		 * parameterType: dto
		 * */
		session.update("challenges.update",dto);
	}

	@Override
	public List<ChallengesDto> getMyList(String id) {
		return session.selectList("challenges.getMyList", id);
	}

}
