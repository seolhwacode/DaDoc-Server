package com.team1.dadoc.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	
	@RequestMapping(value = "/user/signup_tos")
	public String signupTos() {
		return "user/signup_tos";
	}
}
