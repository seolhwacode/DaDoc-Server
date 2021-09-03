package com.team1.dadoc.book.search.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class BookSearchServiceImpl implements BookSearchService {

	@Override
	public Map<String, Object> getBasicSearchList(String query) {
		//애플리케이션 클라이언트 아이디값
		String clientId = "tPLcDAdvKX1Enb22c25W";
		//애플리케이션 클라이언트 시크릿값
        String clientSecret = "nBxGxVTl80";
		
        try {
        	//검색어를 인코딩하기
        	String encodedQuery = URLEncoder.encode(query, "UTF-8");
        	//검색 요청 url
        	String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + encodedQuery;
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
        		System.out.println("정상 출력-------------------");
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
        		System.out.println(inputLine);
        	}
        	//리더 닫기
        	br.close();
        	//결과값 출력
        	System.out.println("결과값 출력 ===============================");
        	System.out.println(response.toString());
        	
        	ObjectMapper mapper = new ObjectMapper();
        	Map<String, Object> map = mapper.readValue(response.toString(), Map.class);
        	
        	return map;
        	
        }catch(Exception e) {
        	System.out.println(e);
        }
        
        return null;
	}
	
}
