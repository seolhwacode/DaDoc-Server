<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/trade/upload_form.jsp</title>
<%-- bootstrap 읽어오기 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
</head>
<body>
	<div class="container">
	   	<h1>게시글 폼</h1>
	   	<form action="${pageContext.request.contextPath}/trade/upload.do" method="post" enctype="multipart/form-data">
	      	<div>
	         	<label for="title">설명</label>
	         	<input type="text" name="title" id="title"/>
	      	</div>
	      	<div>
	         	<label for="image">이미지</label>
	         	<input type="file" name="image" id="image"
	            	accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
	      	</div>
	      	<button type="submit">업로드</button>
	   	</form>
	</div>
</body>
</html>