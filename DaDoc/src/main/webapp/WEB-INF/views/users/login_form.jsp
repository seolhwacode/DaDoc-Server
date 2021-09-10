<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login_form.do</title>

<jsp:include page="/include/resources_head.jsp"></jsp:include>

<!-- navbar css 추가 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/navbarcss.css">

<style>
	.container{
		transition: all 1s linear;
	}

	/*페이지 헤더 색상 조정*/
	.page-header {
		background-color: #F9E0AE !important;
	}
	
	/* 페이지 헤더 - home 색깔 변경 */
	.breadcrumb a{
		color: #0088CC;
	}
	
	/* crumb 네비바 들어가기 */
	.page-header .breadcrumb{
		z-index: 0;
	}
	
	/* 내부 로그인 form + head 중앙정렬 */
	.login-container{
	    max-width: 60%;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    margin: auto;
	}
	
	/* 로그인 form + head 중앙정렬 */
	.login-box{
		width: -webkit-fill-available;
	    padding: 10%;
	}
	
	/* form 위에 간격 띄우기, 밑줄 추가*/
	.dodoc-login-form-container{
	    margin-top: 5%;
	    border-bottom: solid;
	    border-color: #682C0E;
	}
	
	/* 로그인 아래 밑줄 */
	.login-form-head{
		border-bottom: solid;
	    border-color: #682C0E;
	}
	
	/* 로그인 폼 내부의 ipnut 요소간의 간격 띄우기 */
	.dodoc-login-form-container div{
		margin-bottom: 10px;
	}
	
	/* form 의 input 색 좀 더 진하게 하기 */
	.dodoc-login-form-container input{
	    border-color: #bfbfbf;
	}
	
	/* form 의 input 에 focues 되었을 때 색 변경 */
	.dodoc-login-form-container input:focus{
		border-color: #682C0E;
	}
	
	/* form 로그인 버튼 */
	.dodoc-login-form-container .btn{
	    width: -webkit-fill-available;
	    background-color: #C24914;
	    color: wheat;
	    font-weight: bold;
	    font-size: 1.2rem;
	}
	
	/* form 로그인 버튼 - hover 될 때 색 변경 */
	.dodoc-login-form-container .btn:hover{
		background-color: #8c3712;
	}
	
	/* 회원가입, 비밀번호 찾기 링크 부분 */
	.login-form-footer{
		display: flex;
		justify-content: center;
	    margin-top: 10px;
	}
	
	/* 회원가입, 비밀번호 찾기 링크 부분 - padding 추가 & 글씨 크기 조절*/
	.login-form-footer div{
		padding: 10px;
		font-size: 1.2rem;
	}
	
	/* 회원가입, 비밀번호 찾기 링크 부분 기본 색 */
	.login-form-footer a{
		color: #929292;
	}
	
	/* 회원가입, 비밀번호 찾기 링크 부분 - hover 되었을 때 색 */
	.login-form-footer a:hover{
		color: #682c0e;
	}
	
</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="login" name="thisPage"/>
	</jsp:include>
	
	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div
					class="col-md-12 align-self-center p-static order-2 text-center">

					<h1 class="text-dark font-weight-bold text-8 bold-family">Login</h1>
					<span class="sub-title text-dark">Join with DADOC</span>
				</div>

				<div class="col-md-12 align-self-center order-1">

					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li class="active">Login</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- main content -->
	<div id="login_container" class="container">
		<div class="login-container">
			<div class="login-box">
				<div class="login-form-head">
					<h1>로그인</h1>
				</div>
				<div class="dodoc-login-form-container">
					<form @submit.prevent="submitForm" 
							action="${pageContext.request.contextPath}/users/login.do" 
							 ref="login_form" method="post">
						<%-- 로그인 후에 이동할 목적지 정보를 url 이라는 파라미터 명으로 전송될 수 있도록 한다. --%>
						<c:choose>
							<c:when test="${empty param.url }">
								<%-- url 이 파라미터로 넘어오지 X -> 최상위 경로, 즉 home.do 로 이동한다. --%>
								<input type="hidden" name="url" value="${pageContext.request.contextPath}/" />
							</c:when>
							<c:otherwise>
								<input type="hidden" name="url" value="${param.url }" />
							</c:otherwise>
						</c:choose>
						<div>
							<label class="form-label" for="id">아이디</label>
							<input class="form-control form-control-lg" type="text" name="id" id="id" placeholder="id" />
						</div>
						<div>
							<label class="form-label" for="pwd">비밀번호</label>
							<input class="form-control form-control-lg" type="password" name="pwd" id="pwd" placeholder="password" />
						</div>
						<button class="btn mt-3 mb-3" type="submit">로그인</button>
					</form>
				</div>
				<div class="login-form-footer">
					<div class="signup-link">
						<a href="${pageContext.request.contextPath}/users/signup_tos.do">회원가입</a>
					</div>
					<div class="search-pwd-link">
						<a href="${pageContext.request.contextPath}/users/pwd/input_id.do">비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
	<!-- 네비게이션 바 js -->
	<script src="${pageContext.request.contextPath}/include/navbarjs.js"></script>
	<!-- vue -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<!-- gura_util.js -->
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	
	<script>
		// webcontent 위치
		const base_url = "http://localhost:8888/dadoc";
		
		let login_container = new Vue({
			el: "#login_container",
			data: {
				base_url,
				
			},
			methods: {
				//login form 을 submit 할 때 실행할 함수
				//-> ajax 로 로그인 & 결과 검사
				submitForm(){
					//form 의 객체를 가져옴
					const form = this.$refs.login_form;
					
					//vue 객체
					const self = this;
					
					//form ajax 전송 - gura_util 활용
					ajaxFormPromise(form)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						//data = { isSuccess: true/false, url: url }
						//로그인 성공 결과
						if(data.isSuccess){
							//성공
							location.href = self.base_url + '/users/login_result.do?url=' + data.url;
						}else{
							alert('로그인 실패');
						}
					});
				}
			}
		});
	</script>
</body>
</html>
