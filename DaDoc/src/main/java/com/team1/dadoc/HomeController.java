package com.team1.dadoc;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	/*
	 * "/home.do" 요청이 왔을 때 이 메소드로 요청 처리하기
	 * 
	 * .do 는 생략가능
	 */
	@RequestMapping("/home.do")
	public String home(HttpServletRequest request) {
				
		//view 페이지 (jsp 페이지) 로 forward 이동해서 응답
		return "home";
	}

}
