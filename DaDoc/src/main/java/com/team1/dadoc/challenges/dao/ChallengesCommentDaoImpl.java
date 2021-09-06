package com.team1.dadoc.challenges.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team1.dadoc.challenges.dto.ChallengesCommentDto;

@Repository
public class ChallengesCommentDaoImpl implements ChallengesCommentDao{
	
	@Autowired
	private SqlSession session;
	
	//댓글 목록 가져오기
	@Override
	public List<ChallengesCommentDto> getList(ChallengesCommentDto dto) {
		return session.selectList("challengesComment.getList",dto);
	}
	
	//댓글 개수 가져오기
	@Override
	public int getCount(int ref_group) {
		return session.selectOne("challengesComment.getCount",ref_group);
	}
	
	//댓글 저장하기
	@Override
	public void insert(ChallengesCommentDto dto) {
		session.insert("challengesComment.insert", dto);
	}

	@Override
	public int getSequence() {
		return  session.selectOne("challengesComment.getSequence");
	}
	
	
	
}
