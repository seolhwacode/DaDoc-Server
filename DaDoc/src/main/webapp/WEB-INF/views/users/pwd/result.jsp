<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd/result.do</title>
</head>
<body>
	<div class="container">
		<h1>비밀번호 찾기 결과 페이지</h1>
		<c:choose>
			<c:when test="${ requestScope.isCorrect }">
				<p>새로운 비밀번호는 아래와 같습니다. 로그인 후, 비밀번호를 변경해주세요.</p>
				<br />
				<h3>${ requestScope.newPwd }</h3>
				<a href="${pageContext.request.contextPath}/users/login_form.do">로그인하러 가기</a>
				<a href="${pageContext.request.contextPath}/">홈으로 가기</a>
			</c:when>
			<c:otherwise>
				<p>정답이 일치하지 않습니다.</p>
				<a href="${pageContext.request.contextPath}/users/pwd/input_id.do">비밀번호 찾기로 돌아가기</a>
				<a href="${pageContext.request.contextPath}/">홈으로 가기</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>