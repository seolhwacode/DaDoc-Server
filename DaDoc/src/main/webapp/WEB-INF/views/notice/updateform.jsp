<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/notice/updateform.jsp</title>
</head>
<body>
<div class="container">
	<h1>글 수정 폼 입니다.</h1>
	<form action="update.do" method="post">
		<input type="hidden" name="num" value="${dto.num }" />
		<div>
			<label for="writer">작성자</label>
			<input type="text" id="writer" value="${dto.writer }" disabled/>
		</div>
		<div>
			<label for="title">제목</label>
			<input type="text" name="title" id="title" value="${dto.title }"/>
		</div>
		<div>
			<label for="content">내용</label>
			<textarea name="content" id="content">${dto.content }</textarea>
		</div>
		<button type="submit" onclick="submitContents(this);">수정확인</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>