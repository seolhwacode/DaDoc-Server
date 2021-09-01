package com.team1.dadoc.users.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class UsersUpdateAspect {
	// return type : Object
	// 메소드 명 : authUsers 로 시작
	// 파라미터 : 개수, 타입 관련 X
	// @Around 로 aspect 를 적용하면 메소드의 인자로 ProceedingJoinPoint type 이 전달된다.
	@Around("execution(org.springframework.web.servlet.ModelAndView authUsers*(..))")
	public Object usersUpdateCheck(ProceedingJoinPoint joinPoint) throws Throwable  {
		//전달된 인자들을 가져온다.
		Object[] args = joinPoint.getArgs();
		
		//메소드에 전달된 인자중에서 HttpServletRequest 객체를 찾는다.
		for(Object tmp:args) {
			if(tmp instanceof HttpServletRequest) {
				//찾았으면 원래 type 으로 casting
				HttpServletRequest request = (HttpServletRequest)tmp;
				
				//HttpSession 객체의 참조값 얻어와서 로그인 여부를 알아낸다.
				String id = (String) request.getSession().getAttribute("id");
				
				//requestScope 에 attribute 에 "auth" 의 값 읽어, 허가 받은 접근인지 확인하기
				String auth = (String) request.getSession().getAttribute("auth");
				//해당 정보를 얻은 후, "auth" attribute 를 session 에서 삭제
				request.getSession().removeAttribute("auth");
				
				//허가 여부 확인
				//id 가 없음  / auth 가 없음 / auth 가 false
				if(id == null || auth == null || "false".equals(auth)) {
					//허가 X -> /users/private/prove.do 페이지로 이동하여 허가받게 하기
					ModelAndView mView = new ModelAndView();
					mView.setViewName("redirect:/users/private/prove.do");
					//메소드를 여기서 return -> 원래 auth 로 수행되는 메소드는 실행되지 X
					return mView;
				}
			}
		}
		
		//허가 받음 -> /users/private/update_form.do 로 이동
		//throws Throwable 을 추가해야한다.
		//aspect 가 적용된 메소드 수행하기
		Object obj = joinPoint.proceed();
		
		//aspect 가 적용된 메소드가 리턴된 직후에 할 작업은 여기서 한다.
		//ModelAndView 객체가 Object type 으로 리턴된다.
		return obj;
	}
	
}
