package com.team1.dadoc.users.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.users.dto.UsersDto;

public interface UsersService {
	//inputId 와 같은 id 가 DB 에 존재하는지 여부 Map 으로 return
	public Map<String, Object> isIdExist(String inputId);
	//inputNick 과 같은 nickname 이 DB 에 존재하는지 여부 Map 으로 return
	public Map<String, Object> isNickExist(String inputNick);
	//UsersDto 의 내용을 db 에 추가 - 비밀번호 암호화 추가
	public boolean addUser(UsersDto dto);
	//dto 의 id/pwd 의 값이 db 에 일치하는 값이 있는지 확인 및 로그인(session)
	public void loginProcess(UsersDto dto, HttpSession session);
	//inputId 에 해당하는 data 를 읽어와서 해당 질문과 inputId를 mView 에 넣어준다.
	public void getPwdQuestion(ModelAndView mView, String inputId);
	//비밀번호 찾기 - id 와 작성 답변을 통해 질문의 답이 맞는지 체크한다.
	public boolean checkAnswer(String id, String answer);
	//새로운 비밀번호를 생성하고, db 에 pwd 를 갱신한 후, 새로 생성한 pwd plain text 를 mView 에 담기
	public void createNewRPwd(ModelAndView mView, String id);
}
