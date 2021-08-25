package com.team1.dadoc.users.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.users.dao.UsersDao;
import com.team1.dadoc.users.dto.UsersDto;
import com.team1.dadoc.users.dto.UsersPwdQuestionDto;
import com.team1.dadoc.users.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	@Autowired
	private UsersDao dao;
	
	//sginup_tos.do 페이지로 이동
	@RequestMapping(value = "/users/signup_tos")
	public String signupTos() {
		return "users/signup_tos";
	}
	
	//signup_form 페이지로 이동
	//isAdChecked : 광고 수신 동의 체크
	@RequestMapping(value = "/users/signup_form", method = RequestMethod.GET)
	public ModelAndView signupForm(ModelAndView mView, @RequestParam boolean isAdChecked) {
		mView.addObject("isAdChecked", isAdChecked);
		mView.setViewName("users/signup_form");
		
		return mView;
	}
	
	//ajax 로 비밀번호 분실시에 입력할 질문 리스트를 가져온다.
	@RequestMapping(value = "/ajax/users/pwd_question_list")
	@ResponseBody
	public List<UsersPwdQuestionDto> ajaxGetPwdQuestionList(){
		return dao.getPwdQuestions();
	}
	
	//ajax 로 id 가 존재하는지를 알려준다.
	@RequestMapping(value = "/ajax/users/check_id")
	@ResponseBody
	public Map<String, Object> checkId(@RequestParam String inputId){
		//UsersService 가 리턴해주는 Map 을 리턴해서 json 문자열을 응답한다.
		return service.isIdExist(inputId);
	}
	
	//ajax 로 nickname 이 존재하는지 알려준다.
	@RequestMapping(value = "/ajax/users/check_nickname")
	@ResponseBody
	public Map<String, Object> checkNickname(@RequestParam String inputNick){
		//UsersService 가 리턴해주는 Map 을 리턴해서 json 문자열을 응답한다.
		return service.isNickExist(inputNick);
	}
	
	//회원가입 정보를 insert
	@RequestMapping(value = "/users/signup", method = RequestMethod.POST)
	public ModelAndView signup(UsersDto dto) {
		System.out.println("여기는 컨트롤러");
		
		//System.out.println(id);
		
		System.out.println("id : " + dto.getId());
		System.out.println("pwd : " + dto.getPwd());
		System.out.println("nickname : " + dto.getNickname());
		System.out.println("name : " + dto.getName());
		System.out.println("sex : " + dto.getSex());
		System.out.println("birth : " + dto.getBirth());
		System.out.println("tel : " + dto.getTel());
		System.out.println("email : " + dto.getEmail());
		System.out.println("pwd_question : " + dto.getPwd_question());
		System.out.println("pwd_answer : " + dto.getPwd_answer());
		
		return null;
	}
	
}
