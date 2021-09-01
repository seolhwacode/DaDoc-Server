<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/prove.do</title>
</head>
<body>
	<div class="container">
		<h1>비밀번호 인증 페이지</h1>
		<div>
			<form action="${pageContext.request.contextPath}/users/private/pwd_check.do" method="post">
				<input type="hidden" name="id" value="${ sessionScope.id }" />
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" />
				<button type="submit">확인</button>
			</form>
		</div>
	</div>
</body>
</html>