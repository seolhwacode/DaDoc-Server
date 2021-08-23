package com.team1.dadoc.challenge.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.team1.dadoc.challenges.dto.ChallengesDto;

public interface ChallengeService {
	
	// 새로운 챌린지 등록하기
	public void register(ChallengesDto dto);
	// 챌린지 목록을 리턴하기
	public void getList(HttpServletRequest request);
	

}
