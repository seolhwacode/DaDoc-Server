<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- navbar css 추가 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/navbarcss.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Poor+Story&display=swap" rel="stylesheet">
<title>views/notice/detail.jsp</title>
<jsp:include page="/include/resources_head.jsp"></jsp:include>
<style>
.page-header {
	background-color: #F9E0AE;
}

.content{
	border-style: dot;
	border-width: medium;
	height: 400px
	}

}


thead{
	background: #D0AF84;
	color : #682C0E;
	font-size : 20px;
}

</style>

</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="notice" name="thisPage"/>
	</jsp:include>
	
	<!-- 페이지 헤더 -->
		<section class="page-header page-header-modern page-header-md">
			<div class="container">
				<div class="row">
					<div class="col-md-12 align-self-center p-static order-2 text-center">

						<h1 class="text-dark font-weight-bold text-8 bold-family">Notice Detail</h1>
						<span class="sub-title text-dark">Attention! please read this notice.</span>
					</div>

					<div class="col-md-12 align-self-center order-1">

						<ul class="breadcrumb d-block text-center">
							<li><a href="${pageContext.request.contextPath}/notice/list.do">Notice</a></li>
							<li class="active">Notice Detail</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		
<div class="container">
	<c:if test="${dto.prevNum ne 0 }">
		<a href="detail.do?num=${dto.prevNum }&keyword=${encodedK }&condition=${condition }">이전글</a>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
		<a href="detail.do?num=${dto.nextNum }&keyword=${encodedK }&condition=${condition }">다음글</a>
	</c:if>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td scope="row">${dto.num }</td>
				<td>${dto.writer }</td>
				<td>${dto.title }</td>
				<td>${dto.regdate }</td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th>내용</th>
				<td colspan="2">
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
<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
<!-- 네비게이션 바 js -->
	<script src="${pageContext.request.contextPath}/include/navbarjs.js"></script>
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