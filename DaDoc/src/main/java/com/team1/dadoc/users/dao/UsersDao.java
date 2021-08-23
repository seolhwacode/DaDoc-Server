package com.team1.dadoc.users.dao;

import java.util.List;

import com.team1.dadoc.users.dto.UsersPwdQuestionDto;

public interface UsersDao {
	//비밀번호 분실시 질문 리스트를 리턴하는 메소드
	public List<UsersPwdQuestionDto> getPwdQuestions();
}
