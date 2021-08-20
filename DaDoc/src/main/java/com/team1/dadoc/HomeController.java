package com.team1.dadoc;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	/*
	 * "/home.do" 요청이 왔을 때 이 메소드로 요청 처리하기
	 * 
	 * .do 는 생략가능
	 */
	@RequestMapping("/home.do")
	public String home(HttpServletRequest request) {
		//DB 에서 읽어온 공지사항이라고 사정하자
		List<String> notice = new ArrayList<String>();
		notice.add("무더운 여름입니다.");
		notice.add("더위 조심하세요.");
		notice.add("어쩌구...");
		notice.add("저쩌구...");
		
		//공지사항을 request 에 담기
		request.setAttribute("notice", notice);
		
		//view 페이지 (jsp 페이지) 로 forward 이동해서 응답
		return "home";
	}

}
