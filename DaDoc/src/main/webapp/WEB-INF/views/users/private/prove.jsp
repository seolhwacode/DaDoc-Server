<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/prove.do</title>
<!-- 외부 css 및 파일들 추가  -->
<jsp:include page="/include/resources_head.jsp"></jsp:include>
<!-- 사용자 페이지에서만 사용하는 공통 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/users/users_template.css">
<!-- 탈퇴 모달에서 사용되는 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/users/leave_modal.css">
<style>
	/*페이지 헤더 색상 조정*/
	.page-header {
		background-color: #F9E0AE;
	}
	
	/* crumb 네비바 뒤로가기 */
	.page-header .breadcrumb{
		z-index: 0;
	}
	
	/* 전체 메인 컨텐츠 & 아래 여백 추가 */
	.root-container{
		margin-bottom: 10%;
		margin-top: 10%;
	}
	
	/* 중앙정렬  */
	.content-container{
		max-width: 100%;
		margin: 0 auto;
	}
	
	/* 오른쪽 내부 - h1 - 아래 밑줄 */
	.content-container .right-content > h1{
		border-bottom: solid;
	  	border-color: #682c0e;
	}
	
	/* 오른쪽 내부 패딩 추가 */
	.right-content{
		padding-left: 30px;
	}
	
	/*비밀번호 입력 & 설명 부분 가운데로 보내기 */
	.center-container{
		margin: auto;
	    max-width: 500px;
	    padding-top: 100px;
	}
	
	/* 설명 부분 - 글 서식 변경  */
	.center-container p {
		font-size: 1rem;
		font-weight: bold;
		color: black;
	}
	
	/* form 내부의 버튼 */
	.center-container form button{
		width: -webkit-fill-available;
	    background-color: #C24914;
	    color: #f9e0ae;
	    font-weight: bold;
	    font-size: 1.2rem;
	    margin-top: 30px;
	}
	
	/* form 내부의 버튼 hover */
	.center-container form button:hover{
		background-color: #8c3712;
		color: #f9e0ae;
	}
	
	/* form 내부 input */
	.center-container form input{
	    border-color: #682c0e;
	}
	
	/* form 내부 input - focus*/
	.center-container form input:focus{
	    border-color: #682c0e;
	    border-width: 2px;
	}
	
</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="userInfo" name="thisPage"/>
	</jsp:include>

	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div class="col-md-12 align-self-center p-static order-2 text-center">
					<h1 class="text-dark font-weight-bold text-8 bold-family">Check Password</h1>
					<span class="sub-title text-dark">You with DADOC</span>
				</div>
				<div class="col-md-12 align-self-center order-1">
					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/users/private/info.do">User Information</a></li>
						<li class="active">Check Password</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- main content -->
	<div class="container root-container">
		<div class="content-container">
			<div class="row">
				<jsp:include page="/include/users/users_template.jsp">
					<jsp:param value="${ myPage }" name="myPage"/>
				</jsp:include>
				<!-- 오른쪽 실제 content -->
				<div class="col-md-9 right-content">
					<h1>비밀번호 인증 페이지</h1>
					<div class="center-container">
						<p>비밀번호 인증이 필요한 페이지입니다. 비밀번호를 입력해주세요.</p>
						<div class="form-wrapper">
							<form action="${pageContext.request.contextPath}/users/private/pwd_check.do" method="post">
								<input type="hidden" name="id" value="${ sessionScope.id }" />
								<input type="hidden" name="url" value="${ url }" />
								<input class="form-control form-control-lg" type="password" name="pwd" id="pwd" />
								<button class="btn" type="submit">확인</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<!-- 탈퇴 모달 -->
	<jsp:include page="/include/users/leave_modal.jsp"></jsp:include>
	
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
	
	<!-- vue -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	
	<!-- 탈퇴 모달 js 파일 가져오기 -->
	<script src="${pageContext.request.contextPath}/include/users/leave_modal.js"></script>
</body>
</html>