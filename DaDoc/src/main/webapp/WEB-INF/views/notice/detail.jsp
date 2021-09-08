<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Poor+Story&display=swap" rel="stylesheet">
<title>views/notice/detail.jsp</title>
<style>

.container{
	background-color: #F9E0AE ;
	text-align: center;
	margin-top: 140px;
	padding-bottom:80px;
	font-family: 'East Sea Dokdo', cursive;
	font-size: 25px;
}

thead{
	background: #D0AF84;
	color : #682C0E;
	font-size : 20px;
}

h1{
	font-family: 'Poor Story', cursive;
}

</style>
<jsp:include page="/resources/template.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<c:if test="${dto.prevNum ne 0 }">
		<a href="detail.do?num=${dto.prevNum }&keyword=${encodedK }&condition=${condition }">이전글</a>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
		<a href="detail.do?num=${dto.nextNum }&keyword=${encodedK }&condition=${condition }">다음글</a>
	</c:if>
	<h1>공지 사항</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${dto.num }</td>
				<td>${dto.writer }</td>
				<td>${dto.title }</td>
				<td>${dto.regdate }</td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th>내용</th>
				<td colspan="10">
					<div class="content">${dto.content }</div>
				</td>
			</tr>
		</tbody>
	</table>
	<ul>
		<li><a href="${pageContext.request.contextPath}/notice/list.do">목록보기</a></li>
		<c:if test="${dto.writer eq id }">
			<li><a href="updateform.do?num=${dto.num }">수정</a></li>
			<li><a href="javascript:deleteConfirm()">삭제</a></li>
		</c:if>
	</ul>
	
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function deleteConfirm(){
	//삭제할지 물어봄
	swal({
		title: "삭제하시겠습니까?",
		text: "복구할 수 없습니다.",
		icon: "warning",
		buttons: true,
		dangerMode: true
	})
	
	.then(function(isDelete){
	  	if (isDelete) {
	    	location.href = "delete.do?num=${dto.num }";
	  	}
	});
	
}

</script>
</body>
</html>