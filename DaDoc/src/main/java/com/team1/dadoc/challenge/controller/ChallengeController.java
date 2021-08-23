package com.team1.dadoc.challenge.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ChallengeController {
	
	
	@RequestMapping("/challenge/main")
	public String getList(HttpServletRequest request) {
		
		return "challenge/main";
	}
}
