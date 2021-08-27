<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd/question.do</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
	<div class="container">
		<h1>질문 페이지</h1>
		<p>${ requestScope.id }</p>
		<form action="${pageContext.request.contextPath}/users/pwd/result.do" method="post">
			<!-- 입력한 id 또한 같이 넘어감 -->
			<input type="hidden" name="id" value="${ requestScope.id }" />
			<p>질문 : ${ requestScope.question }</p>
			<input type="text" name="answer" class="form-control" placeholder="질문에 대한 답을 입력해주세요." />
			<button type="submit">제출</button>
		</form>
	</div>
</body>
</html>