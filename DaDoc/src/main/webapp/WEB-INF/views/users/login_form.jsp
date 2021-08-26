<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login_form.do</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
	<div class="container">
		<h1>로그인 폼입니다.</h1>
		<form action="${pageContext.request.contextPath}/users/login.do" method="post">
			<%-- 로그인 후에 이동할 목적지 정보를 url 이라는 파라미터 명으로 전송될 수 있도록 한다. --%>
			<c:choose>
				<c:when test="${empty param.url }">
					<%-- url 이 파라미터로 넘어오지 X -> 최상위 경로, 즉 home.do 로 이동한다. --%>
					<input type="hidden" name="url" value="${pageContext.request.contextPath}/" />
				</c:when>
				<c:otherwise>
					<input type="hidden" name="url" value="${param.url }" />
				</c:otherwise>
			</c:choose>
			<div>
				<label class="form-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id" placeholder="id" />
			</div>
			<div>
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd" placeholder="password" />
			</div>
			<div>
				<label class="form-label" for="loginSave">
					<input type="checkbox" name="loginSave" id="loginSave"></input>
					7일동안 로그인 상태 유지
				</label>
			</div>
			<button class="btn btn-primary mt-4" type="submit">로그인</button>
		</form>
		<a href="${pageContext.request.contextPath}/users/signup_tos.do">회원가입</a>
		<a href="${pageContext.request.contextPath}/users/pwd/input_id.do">비밀번호 찾기</a>
	</div>
</body>
</html>