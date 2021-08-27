package com.team1.dadoc.users.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

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
	public ModelAndView signup(ModelAndView mView ,UsersDto dto) {
		//UsersDto 를 DB 에 추가 (insert) : 성공 여부를 boolean 값으로 받아온다.
		boolean isSuccess = service.addUser(dto);
		//성공 여부 추가
		mView.addObject("isSuccess", isSuccess);
		//이동할 페이지 설정
		mView.setViewName("users/signup");
		
		return mView;
	}
	
	//로그인 폼 페이지로 이동
	@RequestMapping(value = "/users/login_form")
	public ModelAndView loginForm() {
		return new ModelAndView("users/login_form");
	}
	
	//로그인 처리
	//dto : id, pwd 가 들어있다.
	@RequestMapping(value = "/users/login")
	public ModelAndView login(ModelAndView mView, UsersDto dto,
						@RequestParam String url, HttpSession session) {
		//db 에서 실제 id/pwd 가 일치하는지 확인 & 로그인처하는 서비스
		service.loginProcess(dto, session);
		
		//parameter 로 넘어온 url 을 인코딩하여 request 영역에 추가한다.
		String encodeUrl = URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodeUrl", encodeUrl);
		
		//경로 설정
		mView.setViewName("users/login");
		
		return mView;
	}
	
	//로그아웃
	@RequestMapping(value = "/users/private/logout")
	public ModelAndView logout(ModelAndView mView, HttpSession session) {
		//세션에서 id 라는 키값으로 저장된 값 삭제
		session.removeAttribute("id");
		//이동 경로
		mView.setViewName("users/logout");
		
		return mView;
	}
	
	//비밀번호 찾기 - id 입력하기
	@RequestMapping(value = "/users/pwd/input_id")
	public ModelAndView pwdInputId() {
		return new ModelAndView("/users/pwd/input_id");
	}
	
	//비밀번호 찾기 - id 가 있을 때, 이에 맞는 질문 출력하는 페이지로 넘어가기(페이지 이동만)
	@RequestMapping(value = "/users/pwd/question")
	public ModelAndView pwdInputId(ModelAndView mView, @RequestParam String inputId) {
		//서비스에서 inputId 에 해당하는 data 를 읽어와서 해당 질문을 mView 에 넣어준다.
		service.getPwdQuestion(mView, inputId);
		return mView;
	}
	
	//비밀번호 찾기 - 질문 체크 후, 결과를 띄우는 페이지
	@RequestMapping(value = "/users/pwd/result")
	public ModelAndView newPwd(ModelAndView mView, 
			@RequestParam String id, @RequestParam String answer) {
		//질문의 답변이 일치하는지 검사
		//1. 일치 X - isCorrect: false 값만 mView 에 담겨서 넘어간다.
		//2. 일치 O - isCorrect: true, newPwd: xxxx 값이 mView 에 담겨서 넘어간다.
		
		//답이 맞는지 체크한다.
		boolean isCorrect = service.checkAnswer(id, answer);
		//답 맞는지 여부 ModelAndView 에 담기
		mView.addObject("isCorrect", isCorrect);
		
		if(isCorrect) {
			//정답
			//새로운 비밀번호를 생성하고, db 에 pwd 를 갱신한 후, 새로 생성한 pwd plain text 를 mView 에 담기
			service.createNewRPwd(mView, id);
		}
		
		//이동할 페이지 경로 설정
		mView.setViewName("users/pwd/result");
		
		return mView;
	}
	
	
}
