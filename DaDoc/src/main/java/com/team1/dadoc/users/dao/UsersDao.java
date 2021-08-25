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
}
