package com.team1.dadoc.users.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.team1.dadoc.users.dao.UsersDao;
import com.team1.dadoc.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao dao;

	//inputId 와 같은 id 가 DB 에 존재하는지 여부 Map 으로 return
	@Override
	public Map<String, Object> isIdExist(String inputId) {
		//Map 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		//isExist 라는 키값으로 아이디가 존재하는지 여부를 담는다.
		map.put("isExist", dao.isIdExist(inputId));
		//Map 객체를 리턴해준다.
		return map;
	}
	
	//inputNick 과 같은 nickname 이 DB 에 존재하는지 여부 Map 으로 return
	@Override
	public Map<String, Object> isNickExist(String inputNick) {
		//Map
		Map<String, Object> map = new HashMap<String, Object>();
		//isExist 라는 키앖으로 닉네임이 존재하는지 여부를 담는다.
		map.put("isExist", dao.isNickExist(inputNick));
		//Map 객체 리턴
		return map;
	}

	//UsersDto 의 내용을 db 에 추가 - 비밀번호 암호화 추가
	@Override
	public boolean addUser(UsersDto dto) {
		//사용자가 입력한 비밀번호 읽어오기
		String pwd = dto.getPwd();
		
		//암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(pwd);
		
		//dto 에 다시 넣어줌
		dto.setPwd(encodedPwd);
		
		//기본 프로필 사진 random 으로 1~4 사이의 파일로 지정
		Random random = new Random();
		int randNum = random.nextInt(3) + 1;
		
		//-> /resources/images/profile01 ~ 4
		String profile = "/resources/images/profile0" + randNum;
		
		//dto 에 profile 추가
		dto.setProfile(profile);
		
		//db 에 insert
		boolean isSuccess = dao.insertUser(dto);
		
		return isSuccess;
	}

	//dto 의 id/pwd 의 값이 db 에 일치하는 값이 있는지 확인 및 로그인(session)
	@Override
	public void loginProcess(UsersDto dto, HttpSession session) {
		//1. 로그인 폼에 입력한 아이디를 이용해서 해당 정보를 select 
		UsersDto result = dao.getData(dto.getId());
		
		//isValid : 입력한 정보가 맞는지 여부
		boolean isValid = false;
		
		//2. select 된 정보가 없으면 -> null -> 로그인 실패
		if(result != null) {
			//존재하는 id
			//비밀번호가 일치하는지 확인
			//암호화 되어 있기 때문에, BCrypt 객체를 사용해서 검사한다. -> true / false 리턴
			isValid = BCrypt.checkpw(dto.getPwd(), result.getPwd());
		}
		
		//3. isValid == true 면 -> 비밀번호가 일치한다.
		//-> 로그인 처리 : session 에 "id" 라는 키값으로 아이디를 담는다.
		if(isValid) {
			//유효하다 : 비밀번호가 일치
			session.setAttribute("id", dto.getId());
		}
	}
	
	
}
