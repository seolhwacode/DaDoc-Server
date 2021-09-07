package com.team1.dadoc.users.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	//개인정보 메인 페이지로 이동
	@RequestMapping(value = "/users/private/info")
	public ModelAndView usersInfo() {
		return new ModelAndView("users/private/info");
	}
	
	//id 에 맞는 개인정보 가져오기
	// 일부러 /users/private/ 아래 경로를 사용한 이유 : 개인 정보는 아무나 함부로 가져오면 안된다.
	@RequestMapping(value = "/users/private/ajax_get_user_all")
	@ResponseBody
	public UsersDto getUserAll(@RequestParam String id) {
		//id 에 해당하는 사용자의 정보를 모두 읽어와, UsersDto 로 return
		return service.getUserDataAll(id);
	}
	
	//id 에 맞는 질문 문장 가져오기
	@RequestMapping(value = "/ajax/users/get_question")
	@ResponseBody
	public Map<String, Object> ajaxGetQuestion(@RequestParam String id) {
		return service.getQuestion(id);
	}
	
	//프로필 변경 form 으로 이동 - 파라미터로 현재 프로필 사진의 값을 넘겨준다.
	@RequestMapping(value = "/users/private/update_profile_form")
	public ModelAndView updateProfileForm(@RequestParam String profile) {
		ModelAndView mView = new ModelAndView();
		mView.addObject("profile", profile);
		mView.setViewName("users/private/update_profile_form");
		return mView;
	}
	
	//image 파일 업로드
	@RequestMapping(value = "/users/private/ajax_profile_upload", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxProfileUpload(@RequestParam MultipartFile image, HttpServletRequest request) {
		//프로필 사진을 바꿀 때, upload 폴더에 upload 하기 - imagePath(/upload/실제파일이름) 리턴
		return service.uploadProfile(image, request);
	}
	
	//upload 한 이미지 삭제 - imagePath : '/upload/저장된 파일 이름'
	@RequestMapping(value = "/users/private/ajax_profile_delete")
	@ResponseBody
	public Map<String, Object> ajaxProfileDelete(@RequestParam String imagePath, HttpServletRequest request) {
		System.out.println(imagePath);
		//프로필 사진을 바꿀 때, upload 폴더에 해당 파일 삭제하기 - imagePath(/upload/실제파일이름) 을 파라미터로 가져옴
		boolean isDeleted = service.deleteUploadProfile(imagePath, request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isDeleted", isDeleted);
		
		return map;
	}
	
	//변경된 프로필 사진 db 에 반영 -> alert 로 반영함을 알리기 -> 프로필 info 페이지로 이동
	@RequestMapping(value = "/users/private/update_profile")
	public ModelAndView updateProfile(UsersDto dto) {
		service.updateProfile(dto);
		return new ModelAndView("users/private/update_profile");
	}
	
	//사용자 정보 수정 페이지로 이동 전에, 비밀번호를 입력하는 페이지로 이동
	@RequestMapping(value = "/users/private/prove")
	public ModelAndView prove(@RequestParam String url) {
		ModelAndView mView = new ModelAndView();
		//원래 이동하려고 했던 url을 그대로 읽어옴
		mView.addObject("url", url);
		mView.setViewName("users/private/prove");
		return mView;
	}
	
	//입력한 비밀번호가 유효한지 체크
	//유효하면 -> sessionScope 에 "auth" attribute 를 추가한다.
	@RequestMapping(value = "/users/private/pwd_check")
	public ModelAndView pwdCheck(UsersDto dto, @RequestParam String url, ModelAndView mView, HttpSession session) {
		//id 에 맞는 pwd 가 일치하는지 확인한 후 -> boolean 으로 return 한다.
		boolean isSuccess = service.pwdCheck(dto);
		//유효할 때 -> requestScope 에 "auth" attribute 를 추가한다.
		if(isSuccess) {
			//isSuccess 가 ture 면 -> "true" String 넣기 
			// -> 이유 : boolean 으로 getAttribute 하면, 해당 attribte 가 없을 때는 오류가 뜬다.
			//request scope 에 넣어도, redirect 를 하기 때문에 의미가 없었다.
			// 그렇기 때문에, session 에 넣고, 확인 후 삭제하는 형식으로 진행
			session.setAttribute("auth", "true");
		}
		
		//url 의 contextpath 를 잘라내기
		url = url.replace("/dadoc", "");
		
		//이동할 페이지
		mView.setViewName("redirect:" + url);
		
		return mView;
	}
	
	//수정 form 페이지로 이동
	//ModelAndView authUsers*(..) => UsersUpdateAspct 에 걸린다. 
	@RequestMapping(value = "/users/private/update_form")
	public ModelAndView aspectUsersUpdateForm(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		//포워드 이동
		mView.setViewName("users/private/update_form");
		return mView;
	}
	
	//수정 페이지로 이동
	@RequestMapping(value = "/users/private/update")
	public ModelAndView userDataUpdate(UsersDto dto, ModelAndView mView) {
		//db에 사용자 정보 update
		service.update(dto);
		mView.setViewName("users/private/update");
		return mView;
	}
	
	//비밀번호 수정 form 페이지로 이동
	@RequestMapping(value = "/users/private/pwd_update_form")
	public ModelAndView aspectUsersPwdUpdateForm(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		//포워드 이동
		mView.setViewName("users/private/pwd_update_form");
		return mView;
	}
	
	//비밀번호 수정
	@RequestMapping(value = "/users/private/pwd_update", method = RequestMethod.POST)
	public ModelAndView pwdUpdate(UsersDto dto, ModelAndView mView, HttpSession session) {
		//비밀번호 변경하기
		boolean isSuccess = service.pwdUpdate(dto, session);
				
		//변경 성공 결과를 ModelAndView 에 담기
		mView.addObject("isSuccess", isSuccess);
		
		mView.setViewName("users/private/pwd_update");
		return mView;
	}
}
