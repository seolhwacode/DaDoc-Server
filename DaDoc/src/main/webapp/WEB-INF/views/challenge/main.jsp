<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/challenge/main.do</title>
</head>
<body>
<div class="container">
<a href="${pageContext.request.contextPath}/challenge/register_form.do">챌린지 신청하기</a>
<div class="list">
	<c:forEach var="tmp" items="${list }">
		<p>${tmp.num}</p>
		<p>${tmp.writer}</p>
		<p>${tmp.type}</p>
		<p>${tmp.title}</p>
		<p>${tmp.category}</p>
		<p>${tmp.description}</p>
		<p>${tmp.period}</p>
		<p>${tmp.startDate}</p>
		<p>${tmp.endDate}</p>
		<p>${tmp.regdate}</p>
		<p>-----------------</p>
	</c:forEach>
</div>
</div>
</body>
</html>