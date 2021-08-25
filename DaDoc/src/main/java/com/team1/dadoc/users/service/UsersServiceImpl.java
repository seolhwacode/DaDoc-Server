package com.team1.dadoc.users.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	
}
