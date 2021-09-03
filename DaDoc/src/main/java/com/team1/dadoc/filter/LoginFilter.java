package com.team1.dadoc.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// /users/private/* 하위에서 일어나는 모든 요청에 filtering
// /cafe/private/* 
// 여러 장소에 filtering 하게 되었다! -> urlPatterns = {필터링 경로, ... } 로 여러 url 패턴을 넣을 수 있다!
@WebFilter(urlPatterns = { "/users/private/*" , "/challenge/private/*" })
public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		
		
	}

	// 필터가 동작될 때 호출되는 메소드
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//1. 로그인을 했는지 로그인된 아이디를 읽어와 본다.(HttpSession 객체)
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		//2. 만일 로그인을 햇다면 관여하지 않고 요청의 흐름을 이어간다.(FilterChain 객체)
		if(id != null) {
			//System.out.println("로그인 되어 있음");
			chain.doFilter(request, response);
		}else {
			 /*
	          *  로그인 페이지로 강제 리다일렉트 됬다면 
	          *  로그인 성공후에 원래 가려던 목적지로 다시 보내야 하고
	          *  GET 방식 전송 파라미터가 있다면 파라미터 정보도 같이 가지고 갈수 있도록 해야한다.
	          *  
	          *  encoding 을 안하면?
	          *  - get 방식의 parameter 를 전부 읽어올 수 없다.
	          *  - 파라미터가 하나까지 밖에 오지 않는다.(뒤에 잘림)
	          *  	ex) /test/xxx.jsp?a=xxx&b=xxx
	          *  		=> /test/xxx.jsp?a=xxx 까지 밖에 나오지 않음
	          *  
	          *  - / => %2F
	          *  - ? => %3F
	          *  - & => %26
	          *  - = => %3D
	          */
	         //원래 가려던 url 정보 읽어오기
	         String url=req.getRequestURI();
	         //GET 방식 전송 파라미터를 query 문자열로 읽어오기 ( a=xxx&b=xxx&c=xxx )
	         String query=req.getQueryString();
	         //특수 문자는 인코딩을 해야한다.
	         String encodedUrl=null;
	         if(query==null) {//전송 파라미터가 없다면 
	            encodedUrl=URLEncoder.encode(url);
	         }else {
	            // 원래 목적지가 /test/xxx.jsp 라고 가정하면 아래와 같은 형식의 문자열을 만든다.
	            // "/test/xxx.jsp?a=xxx&b=xxx ..."
	            encodedUrl=URLEncoder.encode(url+"?"+query);
	         }
	         
	         //3. 로그인을 하지 않았다면  /users/loginform.jsp 페이지로 리다일렉트 이동 시킨다. (HttpServletResponse)
	         String cPath=req.getContextPath();
	         HttpServletResponse resp=(HttpServletResponse)response;
	         resp.sendRedirect(cPath+"/users/login_form.do?url="+encodedUrl);

		}

		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		
	}

}
