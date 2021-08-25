package com.team1.dadoc.challenge.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.challenges.dto.ChallengesDto;

public interface ChallengeService {
	
	// 새로운 챌린지 등록하기
	public void register(ChallengesDto dto, HttpServletRequest request);
	// 이미지 추가 - 이미지 업로드 & db 저장
	public void saveImage(ChallengesDto dto, HttpServletRequest request);
	// 챌린지 목록을 리턴하기
	public void getList(HttpServletRequest request);
	// 상세 목록 가져오기
	public void getDetail(ModelAndView mView, int num);
	
	

}
