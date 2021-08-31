<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.do</title>
<!-- Vendor CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Vendor CSS - owl.carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.theme.default.min.css">
<!-- Theme CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/porto/theme-elements.css">
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지입니다.</h1>
		<ul>
			<c:choose>
				<c:when test="${ empty sessionScope.id }">
					<li><a href="${pageContext.request.contextPath}/users/login_form.do">로그인 form 으로 이동</a></li>
					<li><a href="${pageContext.request.contextPath}/users/signup_tos.do">회원가입 약관 으로 이동</a></li>
				</c:when>
				<c:otherwise>
					<p><strong>${ sessionScope.id }</strong> 님이 로그인 중...</p>
					<li><a href="${pageContext.request.contextPath}/users/private/info.do">개인 페이지</a></li>
					<li><a href="${pageContext.request.contextPath}/users/private/logout.do">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="${pageContext.request.contextPath}/challenge/main.do">챌린지 게시판으로 이동</a></li>
			<li><a href="${pageContext.request.contextPath}/trade/list.do">거래 게시판으로 이동</a></li>			
		</ul>
		
		<!-- 캐로세일 실험 -->
		<div class="row">
			<div class="col">
				<div class="owl-carousel owl-theme show-nav-hover owl-loaded owl-drag owl-carousel-init" style="height: auto;">
					<div class="owl-stage-outer">
						<div class="owl-stage" style="transform: translate3d(-1560px, 0px, 0px); transition: all 0s ease 0s; width: 7280px;">
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
						</div>
						</div><div class="owl-item active" style="width: 510px; margin-right: 10px;">
							<div>	
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="owl-nav">
					<button type="button" role="presentation" class="owl-prev"></button>
					<button type="button" role="presentation" class="owl-next"></button>
				</div>
				<div class="owl-dots"></div></div>
			</div>
		</div>
	</div>
	
	
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
	
	<script>
		$(document).ready(function(){
		  	$(".owl-carousel").owlCarousel({
		  		items: 4,
		  		margin: 10,
		  		loop: true,
		  		nav: true,
		  		dots: true
		  	});
		});
	</script>
	<script  type="text/javascript">
		  var naver_id_login = new naver_id_login("X4xrYfz3fETmZ5MehsJF", "http://localhost:8888/dadoc");
		  // 접근 토큰 값 출력
		  // alert(naver_id_login.oauthParams.access_token);
		  // 네이버 사용자 프로필 조회
		  naver_id_login.get_naver_userprofile("naverSignInCallback()");
		  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		  function naverSignInCallback() {
		    alert(naver_id_login.getProfileData('id'));
		    alert(naver_id_login.getProfileData('age'));
		    alert(naver_id_login.getProfileData('nickname'));
		  }
	</script>
</body>
</html>