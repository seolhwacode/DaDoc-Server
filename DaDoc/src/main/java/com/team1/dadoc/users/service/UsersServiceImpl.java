package com.team1.dadoc.users.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.dadoc.users.dao.UsersDao;

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
	
	
}
