package com.team1.dadoc.book.search.service;

import java.util.Map;

import org.json.JSONObject;

import com.team1.dadoc.book.search.dto.BookSearchDto;

public interface BookSearchService {
	//onpen api 에서 json string 으로 받아서 Map 에 받다온다.
	public Map<String, Object> getBasicSearchList(BookSearchDto dto);
	//open api 에서 xml 형식의 데이터를 받아, json 으로 만든 후, Map 에 담아 가져온다.
	public Map<String, Object> getDetailSearchList(BookSearchDto dto);
}
