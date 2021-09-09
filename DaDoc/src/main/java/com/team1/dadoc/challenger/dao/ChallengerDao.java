package com.team1.dadoc.challenger.dao;

import java.util.List;

import com.team1.dadoc.challenger.dto.ChallengerDto;

public interface ChallengerDao {
	//챌린지 참가 신청
	public void insert(ChallengerDto dto);
	//챌린지 별 참가자 수 구하기
	public int getChallengers(String title);
	//내가 참가한 챌린지 가져오기
	public List<ChallengerDto> getMyChallenge(String id);
	//챌린지에 참가한 유저 정보 구하기
	public String getRegisterUser(ChallengerDto dto);
}
