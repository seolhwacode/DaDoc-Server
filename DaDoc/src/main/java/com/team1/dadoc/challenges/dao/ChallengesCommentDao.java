package com.team1.dadoc.challenges.dao;

import java.util.List;

import com.team1.dadoc.challenges.dto.ChallengesCommentDto;

public interface ChallengesCommentDao {
	//댓글 목록 가져오기
	public List<ChallengesCommentDto> getList(ChallengesCommentDto dto);
	//댓글 개수 가져오기
	public int getCount(int ref_group);
	//댓글 저장하기
	public void insert(ChallengesCommentDto dto);
	//댓글 시퀀스 가져오기
	public int getSequence();
}
