package com.team1.dadoc.challenger.dao;

import java.util.List;

import com.team1.dadoc.challenger.dto.ChallengerDto;

public interface ChallengerDao {
	//챌린지 참가 신청
	public void insert(ChallengerDto dto);
	//챌린지 별 참가자 수 구하기
	public int getChallengers(String title);
}
