package com.team1.dadoc.challenge.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping(value="/challenge/register")
	public ModelAndView register(ChallengesDto dto) {
		
		service.register(dto);
		return new ModelAndView("challenge/main");
	}
	
}
