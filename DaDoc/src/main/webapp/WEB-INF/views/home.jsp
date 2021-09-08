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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.min.css">

<!-- Theme CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme-elements.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme-blog.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme-shop.css">

<!-- navbar css 추가 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/navbarcss.css">
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="home" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h1>인덱스 페이지입니다.</h1>
		
		<!-- 캐로세일 실험 -->
		<div class="carosel-container">
			<div class="owl-carousel owl-theme show-nav-hover">
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
			</div>
		</div>
		
		<!-- 테스트를 위한 더미 데이터 -->
		<div>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto quam repudiandae laborum officiis autem molestias enim rem ea odio eum quaerat ipsum possimus dolore assumenda mollitia consequuntur impedit iusto reiciendis!</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse placeat quaerat voluptate ut natus molestiae dolor suscipit ipsam doloremque nostrum nam ipsum laudantium iure odit amet a cum porro similique?</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad aliquam culpa error debitis veritatis reprehenderit voluptatum vitae optio laboriosam incidunt iste id cupiditate omnis cum placeat. Sit at nostrum libero?</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad aliquam culpa error debitis veritatis reprehenderit voluptatum vitae optio laboriosam incidunt iste id cupiditate omnis cum placeat. Sit at nostrum libero?</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad aliquam culpa error debitis veritatis reprehenderit voluptatum vitae optio laboriosam incidunt iste id cupiditate omnis cum placeat. Sit at nostrum libero?</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad aliquam culpa error debitis veritatis reprehenderit voluptatum vitae optio laboriosam incidunt iste id cupiditate omnis cum placeat. Sit at nostrum libero?</p>
		</div>
	</div>
	
	<!-- Vendor -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.appear/jquery.appear.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.cookie/jquery.cookie.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/popper/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.validation/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.gmap/jquery.gmap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/jquery.isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/vide/jquery.vide.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/vivus/vivus.min.js"></script>
	
	<!-- 네비게이션 바 js -->
	<script src="${pageContext.request.contextPath}/include/navbarjs.js"></script>
	<script>
		//data-plugin-options="{'items': 4, 'autoplay': true, 'autoplayTimeout': 3000}"
		$(document).ready(function(){
		  	$(".owl-carousel").owlCarousel({
		  		items: 4,
		  		margin: 10,
		  		loop: true,
		  		nav: true,
		  		dots: true,
		  		autoplay: true,
		  		autoplayTimeout: 3000
		  	});
		});
	</script>
</body>
</html>