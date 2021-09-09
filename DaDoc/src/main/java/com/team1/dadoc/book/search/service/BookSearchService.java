package com.team1.dadoc.book.search.service;

import java.util.Map;

import org.json.JSONObject;

import com.team1.dadoc.book.good.dto.BookGoodDto;
import com.team1.dadoc.book.search.dto.BookSearchDto;

public interface BookSearchService {
	//onpen api 에서 json string 으로 받아서 Map 에 받다온다.
	public Map<String, Object> getBasicSearchList(BookSearchDto dto);
	//open api 에서 xml 형식의 데이터를 받아, json 으로 만든 후, Map 에 담아 가져온다.
	public Map<String, Object> getDetailSearchList(BookSearchDto dto);
	//해당 id 와 isbn 에 해당하는 값이 좋아요 리스트에 있는지 확인하고, 그 값을 boolean 값으로 josn return
	public Map<String, Object> getIsBookGood(BookGoodDto dto);
	//id 와 isbn 을 db 에 추가 후, 결과를 Map 에 담아 가져온다.
	public Map<String, Object> goodAdd(BookGoodDto dto);
	//id 와 isbn 에 해당하는 row db 에서 삭제 후, 결과를 Map 에 담아 가져온다.
	public Map<String, Object> goodCancel(BookGoodDto dto);
}
