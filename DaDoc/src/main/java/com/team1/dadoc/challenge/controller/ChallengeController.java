package com.team1.dadoc.challenge.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.challenge.service.ChallengeService;
import com.team1.dadoc.challenges.dto.ChallengesDto;


@Controller
public class ChallengeController {
	
	@Autowired
	private ChallengeService service;
	
	@RequestMapping(value="/challenge/main")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		return "challenge/main";
	}
	
	// 챌린지 업로드 & DB 저장
	@RequestMapping(value="/challenge/register_form")
	public ModelAndView registerForm(HttpServletRequest request) {
		return new ModelAndView("challenge/register_form");
	}
	
	// 챌린지 DB에 집어넣기 
	@RequestMapping(value="/challenge/register" , method=RequestMethod.POST)
	public ModelAndView register(ChallengesDto dto, HttpServletRequest request) {
		// form에서 dto로 데이터 받아오고
		// dto: challenge 정보와 MultipartFile image 정보를 가지고 있다.
		// request : imagePath 만드는데 사용, session 영역의 id 가져오기
		System.out.println(dto.getImage());
		service.saveImage(dto, request);
		return new ModelAndView("challenge/main");
	}
	
}
