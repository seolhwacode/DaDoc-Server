package com.team1.dadoc.users.dao;

import java.util.List;

import com.team1.dadoc.users.dto.UsersDto;
import com.team1.dadoc.users.dto.UsersPwdQuestionDto;

public interface UsersDao {
	//비밀번호 분실시 질문 리스트를 리턴하는 메소드
	public List<UsersPwdQuestionDto> getPwdQuestions();
	//인자로 전달된 아이디가 존재하는지 여부를 검사하여 리턴하는 메소드
	public boolean isIdExist(String inputId);
	//인자로 전달된 넥네임이 존재하는지 여부를 검사하여 리턴하는 메소드
	public boolean isNickExist(String inputNick);
	//인자로 전달된 dto 를 db 에 insert
	public boolean insertUser(UsersDto dto);
	//id 에 해당하는 data 를 dto 에 담아 return
	public UsersDto getData(String id);
	//id 에 해당하는 pwd_question 의 문장을 리턴한다.
	public String getQuestion(String id);
	//id 에 해당하는 pwd_answer 의 string 값을 읽어온다.
	public String getAnswer(String id);
	//암호화된 비밀번호 db 에 update
	public void updatePwd(UsersDto dto);
	//profile 을 update
	public void updateProfile(UsersDto dto);
	//사용자의 정보를 수정한다.
	public void updateUserData(UsersDto dto);
}
