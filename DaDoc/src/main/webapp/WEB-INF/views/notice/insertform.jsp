<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/insertform.jsp</title>
</head>
<body>
<div class="container">
	<h1>새글 작성 폼</h1>
	<form action="insert.do" method="post" id="insertForm">
		<div class="mb-3">
			<label class="form-label" for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title"/>
		</div>
		<div class="mb-3">
			<label class="form-label" for="content">내용</label>
			<textarea class="form-control"  name="content" id="content"></textarea>
		</div>
		<button class="btn btn-primary" type="submit">저장</button>
	</form>
</div>

</body>
</html>