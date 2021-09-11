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
<title>/views/notice/insertform.jsp</title>
<jsp:include page="/include/resources_head.jsp"></jsp:include>
<style>
/*페이지 헤더 색상 조정*/
.page-header {
	background-color: #F9E0AE;
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

						<h1 class="text-dark font-weight-bold text-8 bold-family">Notice Write</h1>
						<span class="sub-title text-dark">Attention! please read this notice.</span>
					</div>

					<div class="col-md-12 align-self-center order-1">

						<ul class="breadcrumb d-block text-center">
							<li><a href="${pageContext.request.contextPath}/notice/list.do">Notice</a></li>
							<li class="active">Notice Write</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		
<div class="container">
	
	<form action="insert.do" method="post" id="insertForm">
		<div id="title" class="mb-3">
			<label class="form-label" for="title">제목</label>
			<input data-msg-required="please enter your message." class="form-control" type="text" name="title" id="title" required/>
		</div>
		<div id="content" class="mb-3">
			<label class="form-label" for="content">내용</label>
			<textarea data-msg-required="please enter your message." rows="15" class="form-control"  name="content" id="content" required></textarea>
		</div>
		<button class="btn btn-primary" id="submitBtn" type="submit">저장</button>
		<button class="btn btn-primary" id="resetBtn" type="reset" onclick="javascript:resetConfirm()">취소</button>
	</form>
</div>
<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
<!-- 네비게이션 바 js -->
	<script src="${pageContext.request.contextPath}/include/navbarjs.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

function resetConfirm(){
	//취소할지 물어봄
	swal({
		title: "작성을 취소하시겠습니까?",
		text: "게시판으로 돌아갑니다.",
		icon: "warning",
		button: true,
		dangerMode: true
	})
	
	.then(function(isReset){
		if (isReset) {
			location.href = "list.do";
		
		}else{
			
		}
	});
	
}
</script>

</body>
</html>