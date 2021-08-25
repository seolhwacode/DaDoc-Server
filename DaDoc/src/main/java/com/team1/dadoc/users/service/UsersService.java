package com.team1.dadoc.users.service;

import java.util.Map;

import com.team1.dadoc.users.dto.UsersDto;

public interface UsersService {
	//inputId 와 같은 id 가 DB 에 존재하는지 여부 Map 으로 return
	public Map<String, Object> isIdExist(String inputId);
	//inputNick 과 같은 nickname 이 DB 에 존재하는지 여부 Map 으로 return
	public Map<String, Object> isNickExist(String inputNick);
	//UsersDto 의 내용을 db 에 추가 - 비밀번호 암호화 추가
	public boolean addUser(UsersDto dto);
}
