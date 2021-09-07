<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/access_denied.do</title>
</head>
<body>
	<script>
		alert("잘못된 접근입니다.");
		location.href = "${pageContext.request.contextPath}/notice/list.do";
	</script>
</body>
</html>