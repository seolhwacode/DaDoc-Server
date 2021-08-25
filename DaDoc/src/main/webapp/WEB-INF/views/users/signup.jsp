<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.do</title>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${ isSuccess }">
			<h1>회원가입 성공!</h1>
			<a href="${pageContext.request.contextPath}/users/login.do">로그인하러가기</a>
			<a href="${pageContext.request.contextPath}/home.do">홈으로 돌아가기</a>
			</c:when>
			<c:otherwise>
			<h1>회원가입 실패ㅠㅠ</h1>
			<a href="${pageContext.request.contextPath}/users/signup_tos.do">회원가입 다시 하기</a>
			<a href="${pageContext.request.contextPath}/home.do">홈으로 돌아가기</a>
			</c:otherwise>
		</c:choose>
		
	</div>
	
</body>
</html>