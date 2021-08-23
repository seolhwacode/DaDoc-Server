package com.team1.dadoc.users.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team1.dadoc.users.dto.UsersPwdQuestionDto;

//bean 이 될 수 있도록
@Repository
public class UsersDaoImpl implements UsersDao {
	
	//필요한 핵심 의존 객체
	@Autowired
	private SqlSession session;

	/*
	 * Mapper's namespace : users
	 * sql's id : getPwdQuestions
	 * parameterType : X
	 * resultType : UsersPwdQuestionDto -> List
	 */
	//비밀번호 분실시 질문 리스트를 리턴하는 메소드
	@Override
	public List<UsersPwdQuestionDto> getPwdQuestions() {
		return session.selectList("users.getPwdQuestions");
	}
	
	
	
}
