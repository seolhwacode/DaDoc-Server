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

	/*
	 * Mapper's namespace : users
	 * sql's id : isIdExist
	 * parameterType : String
	 * resultType : String (존재하는 id 값 리턴)
	 */
	//인자로 전달된 아이디가 존재하는지 여부를 검사하여 리턴하는 메소드
	@Override
	public boolean isIdExist(String inputId) {
		//전달 받은 id 가 존재하는지 검사한다.
		String id = session.selectOne("users.isIdExist", inputId);
		
		//id 없읍
		if(id == null) {
			return false;
		}else {
			return true;
		}
	}

	/*
	 * Mapper's namespace : users
	 * sql's id : isNickExist
	 * parameterType : String
	 * resultType : String (존재하는 id 값 리턴)
	 */
	@Override
	public boolean isNickExist(String inputNick) {
		//전달받은 nickname 이 존재하는지 검사
		String nickname = session.selectOne("users.isNickExist", inputNick);
		
		//id 없읍
		if(nickname == null) {
			return false;
		}else {//아이디 있음
			return true;
		}
	}
	
	
	
}
