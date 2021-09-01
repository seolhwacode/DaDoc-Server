package com.team1.dadoc.users.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team1.dadoc.users.dto.UsersDto;
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

	/*
	 * Mapper's namespace : users
	 * sql's id : insert
	 * parameterType : UsersDto
	 * resultType : int ()
	 */
	@Override
	public boolean insertUser(UsersDto dto) {
		//업데이트한 id 로 select 하여 count 를 return한다.
		// 성공 : 1 / 실패 : 0
		int isSuccess = session.insert("users.insert", dto);
		
		//0 이면 실패
		if(isSuccess == 0) {
			return false;
		}else {
			//이외에는 성공
			return true;
		}
	}

	/*
	 * Mapper's namespace : users
	 * sql's id : getData
	 * parameterType : string
	 * resultType : UsersDto -> 실제 리턴 타입
	 */
	//id 에 해당하는 data 를 dto 에 담아 return
	@Override
	public UsersDto getData(String id) {
		//해당 data 가 없으면 null 이 리턴됨
		return session.selectOne("users.getData", id);
	}

	/*
	 * Mapper's namespace : users
	 * sql's id : getQuestion
	 * parameterType : string
	 * resultType : string
	 */
	//id 에 해당하는 pwd_question 의 문장을 리턴한다.
	@Override
	public String getQuestion(String id) {
		//해당 질문이 없으면, null 이 리턴됨
		return session.selectOne("users.getQuestion", id);
	}

	/*
	 * Mapper's namespace : users
	 * sql's id : getAnswer
	 * parameterType : string
	 * resultType : string
	 */
	//id 에 해당하는 pwd_answer 의 string 값을 읽어온다.
	@Override
	public String getAnswer(String id) {
		//해당 질문의 답이 없으면 null 이 리턴됨
		return session.selectOne("users.getAnswer", id);
	}

	/*
	 * Mapper's namespace : users
	 * sql's id : updatePwd
	 * parameterType : string
	 */
	//암호화된 비밀번호 db 에 update
	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.updatePwd", dto);		
	}

	/*
	 * Mapper's namespace : users
	 * sql's id : updateProfile
	 * parameterType : UsersDto
	 * resultType : X
	 */
	//profile 을 update
	@Override
	public void updateProfile(UsersDto dto) {
		session.update("users.updateProfile", dto);		
	}

	/*
	 * Mapper's namespace : users
	 * sql's id : updateUserData
	 * parameterType : UsersDto
	 * resultType : X
	 */
	//사용자의 정보를 수정한다.
	@Override
	public void updateUserData(UsersDto dto) {
		session.update("users.updateUserData", dto);		
	}
	
	
	
}
