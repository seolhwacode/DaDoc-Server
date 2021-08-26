package com.team1.dadoc.challenger.dao;

import com.team1.dadoc.challenger.dto.ChallengerDto;

public interface ChallengerDao {
	//챌린지 참가 신청
	public void insert(ChallengerDto dto);
}
