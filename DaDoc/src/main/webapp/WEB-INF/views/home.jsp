<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.do</title>
<!-- Vendor CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
<!-- Vendor CSS - owl.carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/owl.carousel/assets/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/owl.carousel/assets/owl.theme.default.min.css">
<!-- Theme CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/porto/theme-elements.css">
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지입니다.</h1>
		<ul>
      <li><a href="${pageContext.request.contextPath}/user/login_form.do">로그인 form 으로 이동</a></li>
			<li><a href="${pageContext.request.contextPath}/user/signup_tos.do">회원가입 약관 으로 이동</a></li>
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
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
						</div>
						</div><div class="owl-item active" style="width: 510px; margin-right: 10px;">
							<div>	
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
							</div>
						</div>
						<div class="owl-item" style="width: 510px; margin-right: 10px;">
							<div>
								<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/images/1.jpg">
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
	
	
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
	
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
</body>
</html>