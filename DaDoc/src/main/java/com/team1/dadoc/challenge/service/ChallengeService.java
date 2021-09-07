package com.team1.dadoc.challenge.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.challenger.dto.ChallengerDto;
import com.team1.dadoc.challenges.dto.ChallengesCommentDto;
import com.team1.dadoc.challenges.dto.ChallengesDto;
import com.team1.dadoc.photoshot.dto.PhotoShotDto;

public interface ChallengeService {
	
	// 새로운 챌린지 등록하기
	public void register(ChallengesDto dto, HttpServletRequest request);
	// 이미지 추가 - 이미지 업로드 & db 저장
	public void saveImage(ChallengesDto dto, HttpServletRequest request);
	// 챌린지 목록을 리턴하기
	public void getList(HttpServletRequest request);
	// 상세 목록 가져오기
	public void getDetail(ModelAndView mView, int num);
	// 챌린지 참가 신청 하기
	public void saveChallenger(ChallengerDto dto, HttpServletRequest request);
	// 챌린지 인증샷 업로드
	public void savePhotoShot(PhotoShotDto dto, HttpServletRequest request);
	// 챌린지 인증샷 가져오기
	public void getPhotoShot(ModelAndView mView, PhotoShotDto dto);
	// 챌린지 삭제하기
	public void deleteChallenge(int num, HttpServletRequest request);
	// 챌린지 업뎃하기
	public void updateChallenge(ChallengesDto dto);
	// 새로운 댓글 저장하기
	public void saveComment(HttpServletRequest request);
	// 댓글 수정하기
	public void updateComment(ChallengesCommentDto dto);
	// 댓글 삭제하기
	public void deleteComment(HttpServletRequest request);
}
