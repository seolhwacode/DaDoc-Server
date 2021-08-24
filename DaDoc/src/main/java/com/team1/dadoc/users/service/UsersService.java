package com.team1.dadoc.users.service;

import java.util.Map;

public interface UsersService {
	//inputId 와 같은 id 가 DB 에 존재하는지 여부 Map 으로 return
	public Map<String, Object> isIdExist(String inputId);
	//inputNick 과 같은 nickname 이 DB 에 존재하는지 여부 Map 으로 return
	public Map<String, Object> isNickExist(String inputNick);
}
