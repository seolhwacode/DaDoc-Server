<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/trade/upload.jsp</title>
</head>
<body>
	<script>
		alert("사진 업로드에 성공했습니다.");
		location.href = "${pageContext.request.contextPath}/trade/list.do";
	</script>
</body>
</html>