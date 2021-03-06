package com.team1.dadoc.challenges.dao;

import java.util.List;

import com.team1.dadoc.challenges.dto.ChallengesDto;

public interface ChallengesDao {
	//챌린지 리스트 가져오기
	public List<ChallengesDto> getList(ChallengesDto dto);
	//새로운 챌린지 등록하기
	public void register(ChallengesDto dto);
	//모든 ROW의 개수
	public int getCount();
	//챌린지 상세 정보 가져오기
	public ChallengesDto getData(int num);
	//챌린지 삭제
	public void delete(int num);
	//챌린지 업데이트
	public void update(ChallengesDto dto);
	//내가 만든 챌린지 가져오기
	public List<ChallengesDto> getMyList(String id);
}
