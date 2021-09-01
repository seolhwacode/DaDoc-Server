<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.do</title>
</head>
<body>
	<script>
		alert("회원 정보를 수정했습니다.");
		location.href = "${pageContext.request.contextPath}/users/private/info.do";
	</script>
</body>
</html>