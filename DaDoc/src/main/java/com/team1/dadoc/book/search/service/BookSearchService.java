package com.team1.dadoc.book.search.service;

import java.util.Map;

import org.json.JSONObject;

import com.team1.dadoc.book.search.dto.BookSearchDto;

public interface BookSearchService {
	//읽어오는거 테스트하기
	public Map<String, Object> getBasicSearchList(BookSearchDto dto);
}
