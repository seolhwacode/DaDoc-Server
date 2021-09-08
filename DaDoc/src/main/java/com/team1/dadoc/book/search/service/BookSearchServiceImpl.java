package com.team1.dadoc.book.search.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.dadoc.book.good.dao.BookGoodDao;
import com.team1.dadoc.book.good.dto.BookGoodDto;
import com.team1.dadoc.book.search.dto.BookSearchDto;

@Service
public class BookSearchServiceImpl implements BookSearchService {

	//책의 좋아요 DB 와 연결을 위한 dao
	@Autowired
	private BookGoodDao dao;
	//애플리케이션 클라이언트 아이디값
	private String clientId = "tPLcDAdvKX1Enb22c25W";
	//애플리케이션 클라이언트 시크릿값
    private String clientSecret = "nBxGxVTl80";
    
    //onpen api 에서 json string 으로 받아서 Map 에 받다온다.
	@Override
	public Map<String, Object> getBasicSearchList(BookSearchDto dto) {
        try {
        	//검색어를 인코딩하기
        	String encodedQuery = URLEncoder.encode(dto.getQuery(), "UTF-8");
        	//sort 인코딩하기
        	String encodedSort = URLEncoder.encode(dto.getSort(), "UTF-8");
        	//검색 요청 url
        	String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + encodedQuery 
        			+ "&display=" + dto.getDisplay() + "&start=" + dto.getStart() + "&sort=" + encodedSort;
        	//요청 url 에 요청하기위한 URL 객체
        	URL url = new URL(apiURL);
        	//connection 가져오기
        	HttpURLConnection con = (HttpURLConnection)url.openConnection();
        	//HTTP GET 방식 통신
        	con.setRequestMethod("GET");
        	//헤더 설정 - 등록한 id, secret
        	con.setRequestProperty("X-Naver-Client-Id", clientId);
        	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        	//통신 코드 읽어오기 -> 성공 or err 코드
        	int responseCode = con.getResponseCode();
        	//통신 결과를 읽어오기 위한 리더 객체
        	BufferedReader br;
        	
        	if(responseCode == 200) {//정상 호출
        		//정상 -> 결과값을 읽어들인다.
        		//System.out.println("정상 출력-------------------");
        		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        	}else {//에러 -> 에러 읽어들임
        		System.out.println("에러 출력 ---------------------");
        		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        	}
        	
        	String inputLine;
        	StringBuffer response = new StringBuffer();
        	//버퍼에서 한 줄씩 끝까지 읽기
        	int i = 0;
        	while((inputLine = br.readLine()) != null) {
        		response.append(inputLine);
        		//System.out.println(inputLine);
        	}
        	//리더 닫기
        	br.close();
        	//결과값 출력
//        	System.out.println("결과값 출력 ===============================");
//        	System.out.println(response.toString());
        	
        	ObjectMapper mapper = new ObjectMapper();
        	Map<String, Object> map = mapper.readValue(response.toString(), Map.class);
        	
        	return map;
        	
        }catch(Exception e) {
        	System.out.println(e);
        }
        
        return null;
	}

	//open api 에서 xml 형식의 데이터를 받아, json 으로 만든 후, Map 에 담아 가져온다.
	@Override
	public Map<String, Object> getDetailSearchList(BookSearchDto dto) {
		try {
			//sort 인코딩하기
        	String encodedSort = URLEncoder.encode(dto.getSort(), "UTF-8");
			//검색 요청 url
        	String apiURL = "https://openapi.naver.com/v1/search/book_adv.xml?"
        			+ "display=" + dto.getDisplay() + "&start=" + dto.getStart() + "&sort=" + encodedSort;
			//검색어들 null 검사하기
        	//-> null 이 아니면? -> 검색어를 인코딩하기 -> apiURL 에 추가한다.
        	//1. 제목(d_titl)
			if(dto.getD_titl() != null) {
				apiURL += "&d_titl=" + URLEncoder.encode(dto.getD_titl(), "UTF-8");
			}
			//2. 저자(d_auth)
			if(dto.getD_auth() != null) {
				apiURL += "&d_auth=" + URLEncoder.encode(dto.getD_auth(), "UTF-8");
			}
			//3. 목차(d_cont)
			if(dto.getD_cont() != null) {
				apiURL += "&d_cont=" + URLEncoder.encode(dto.getD_cont(), "UTF-8");
			}
			//4. isbn(d_isbn)
			if(dto.getD_isbn() != null) {
				apiURL += "&d_isbn=" + URLEncoder.encode(dto.getD_isbn(), "UTF-8");
			}
			//5. 출판사(d_publ)
			if(dto.getD_publ() != null) {
				apiURL += "&d_publ=" + URLEncoder.encode(dto.getD_publ(), "UTF-8");
			}
			//6. 출간 시작일(d_dafr)
			if(dto.getD_dafr() != null) {
				apiURL += "&d_dafr=" + URLEncoder.encode(dto.getD_dafr(), "UTF-8");
			}
			//7. 출간 종료일(d_dato)
			if(dto.getD_dato() != null) {
				apiURL += "&d_dato=" + URLEncoder.encode(dto.getD_dato(), "UTF-8");
			}
			//8. 책 검색 카테고리(d_catg)
			if(dto.getD_catg() != null) {
				apiURL += "&d_catg=" + URLEncoder.encode(dto.getD_catg(), "UTF-8");
			}
        	
        	//요청 url 에 요청하기위한 URL 객체
        	URL url = new URL(apiURL);
        	//connection 가져오기
        	HttpURLConnection con = (HttpURLConnection)url.openConnection();
        	//HTTP GET 방식 통신
        	con.setRequestMethod("GET");
        	//헤더 설정 - 등록한 id, secret
        	con.setRequestProperty("X-Naver-Client-Id", clientId);
        	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        	//통신 코드 읽어오기 -> 성공 or err 코드
        	int responseCode = con.getResponseCode();
        	//통신 결과를 읽어오기 위한 리더 객체
        	BufferedReader br;
        	
        	if(responseCode == 200) {//정상 호출
        		//정상 -> 결과값을 읽어들인다.
//        		System.out.println("정상 출력-------------------");
        		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        	}else {//에러 -> 에러 읽어들임
        		System.out.println("에러 출력 ---------------------");
        		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        	}
        	
        	String inputLine;
        	StringBuffer response = new StringBuffer();
        	//버퍼에서 한 줄씩 끝까지 읽기
        	int i = 0;
        	while((inputLine = br.readLine()) != null) {
        		response.append(inputLine);
//        		System.out.println(inputLine);
        	}
        	//리더 닫기
        	br.close();
//        	//결과값 출력
//        	System.out.println("결과값 출력 ===============================");
//        	System.out.println(response.toString());
        	
        	//XML 문자열 -> JSON 객체로 만들기
        	JSONObject jObject = XML.toJSONObject(response.toString());
        	
        	ObjectMapper mapper = new ObjectMapper();
        	Map<String, Object> map = mapper.readValue(jObject.toString(), Map.class);
        	
        	return map;
        	
        }catch(Exception e) {
        	System.out.println(e);
        }
		//없으면 null 리턴
		return null;
	}

	//해당 id 와 isbn 에 해당하는 값이 좋아요 리스트에 있는지 확인하고, 그 값을 boolean 값으로 josn return
	@Override
	public Map<String, Object> getIsBookGood(BookGoodDto dto) {
		//해당 id 와 isbn 에 해당하는 값이 좋아요 리스트에 있는지 확인하고, 그 값을 boolean 값으로 return
		boolean isGood = dao.getIsGood(dto);
		//결과값을 Map 에 넣고 return
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isGood", isGood);
		return map;
	}
	
}
